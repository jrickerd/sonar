/*
 * Sonar, open source software quality management tool.
 * Copyright (C) 2008-2012 SonarSource
 * mailto:contact AT sonarsource DOT com
 *
 * Sonar is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * Sonar is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with Sonar; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02
 */
package org.sonar.plugins.design.batch;

import org.apache.commons.io.IOUtils;
import org.junit.Test;
import org.sonar.api.design.Dependency;
import org.sonar.api.resources.JavaPackage;
import org.sonar.api.resources.Resource;
import org.sonar.graph.DirectedGraph;
import org.sonar.graph.Dsm;
import org.sonar.graph.DsmManualSorter;

import java.io.IOException;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class DsmSerializerTest {
  @Test
  public void serializeEmptyDsm() throws IOException {
    Dsm dsm = new Dsm(new DirectedGraph());
    assertThat(DsmSerializer.serialize(dsm), is("[]"));
  }

  @Test
  public void serialize() throws IOException {
    Resource foo = new JavaPackage("org.foo").setId(7);
    Resource bar = new JavaPackage("org.bar").setId(8);
    Dependency dep = new Dependency(foo, bar).setId(30l).setWeight(1);

    DirectedGraph<Resource, Dependency> graph = new DirectedGraph<Resource, Dependency>();
    graph.addVertex(foo);
    graph.addVertex(bar);
    graph.addEdge(dep);


    Dsm<Resource> dsm = new Dsm<Resource>(graph);
    DsmManualSorter.sort(dsm, bar, foo); // for test reproductibility
    String json = IOUtils.toString(getClass().getResourceAsStream("/org/sonar/plugins/design/batch/DsmSerializerTest/dsm.json"));
    assertThat(DsmSerializer.serialize(dsm), is(json));
  }
}
