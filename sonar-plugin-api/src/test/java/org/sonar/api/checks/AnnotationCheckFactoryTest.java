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
package org.sonar.api.checks;

import org.hamcrest.Matcher;
import org.junit.Test;
import org.sonar.api.profiles.RulesProfile;
import org.sonar.api.rules.ActiveRule;
import org.sonar.api.rules.Rule;
import org.sonar.api.utils.SonarException;

import java.util.Arrays;

import static org.hamcrest.Matchers.*;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

public class AnnotationCheckFactoryTest {

  @Test
  public void createCheckWithoutProperties() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    ActiveRule activeRule = profile.activateRule(Rule.create("repo", "org.sonar.api.checks.CheckWithoutProperties", ""), null);
    AnnotationCheckFactory factory = AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(CheckWithoutProperties.class));

    Object check = factory.getCheck(activeRule);
    assertNotNull(check);
    assertThat(check, is(CheckWithoutProperties.class));
  }

  @Test
  public void createCheckWithStringProperty() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    Rule rule = Rule.create("repo", "org.sonar.api.checks.CheckWithStringProperty", "");
    rule.createParameter("pattern");

    ActiveRule activeRule = profile.activateRule(rule, null);
    activeRule.setParameter("pattern", "foo");
    AnnotationCheckFactory factory = AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(CheckWithStringProperty.class));

    Object check = factory.getCheck(activeRule);
    assertNotNull(check);
    assertThat(check, is(CheckWithStringProperty.class));
    assertThat(((CheckWithStringProperty) check).getPattern(), is("foo"));
  }

  @Test(expected = SonarException.class)
  public void failIfMissingProperty() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    Rule rule = Rule.create("repo", "org.sonar.api.checks.CheckWithStringProperty", "");
    rule.createParameter("unknown");

    ActiveRule activeRule = profile.activateRule(rule, null);
    activeRule.setParameter("unknown", "bar");
    AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(CheckWithStringProperty.class));
  }

  @Test
  public void createCheckWithPrimitiveProperties() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    Rule rule = Rule.create("repo", "org.sonar.api.checks.CheckWithPrimitiveProperties", "");
    rule.createParameter("max");
    rule.createParameter("ignore");

    ActiveRule activeRule = profile.activateRule(rule, null);
    activeRule.setParameter("max", "300");
    activeRule.setParameter("ignore", "true");
    AnnotationCheckFactory factory = AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(CheckWithPrimitiveProperties.class));

    Object check = factory.getCheck(activeRule);
    assertThat(((CheckWithPrimitiveProperties) check).getMax(), is(300));
    assertThat(((CheckWithPrimitiveProperties) check).isIgnore(), is(true));
  }

  @Test
  public void createCheckWithIntegerProperty() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    Rule rule = Rule.create("repo", "org.sonar.api.checks.CheckWithIntegerProperty", "");
    rule.createParameter("max");

    ActiveRule activeRule = profile.activateRule(rule, null);
    activeRule.setParameter("max", "300");
    AnnotationCheckFactory factory = AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(CheckWithIntegerProperty.class));

    Object check = factory.getCheck(activeRule);
    assertThat(((CheckWithIntegerProperty) check).getMax(), is(300));
  }

  /**
   * SONAR-3164
   */
  @Test
  public void setValueOfInheritedField() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    Rule rule = Rule.create("repo", "org.sonar.api.checks.ImplementedCheck", "");
    rule.createParameter("max");

    ActiveRule activeRule = profile.activateRule(rule, null);
    activeRule.setParameter("max", "300");
    AnnotationCheckFactory factory = AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(ImplementedCheck.class));

    Object check = factory.getCheck(activeRule);
    assertThat(((ImplementedCheck) check).getMax(), is(300));
  }

  @Test(expected = SonarException.class)
  public void failIfPropertyTypeIsNotSupported() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    Rule rule = Rule.create("repo", "org.sonar.api.checks.CheckWithUnsupportedPropertyType", "");
    rule.createParameter("max");

    ActiveRule activeRule = profile.activateRule(rule, null);
    activeRule.setParameter("max", "300");
    AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(CheckWithUnsupportedPropertyType.class));
  }

  @Test
  public void shouldOverridePropertyKey() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    Rule rule = Rule.create("repo", "org.sonar.api.checks.CheckWithOverriddenPropertyKey", "");
    rule.createParameter("maximum");

    ActiveRule activeRule = profile.activateRule(rule, null);
    activeRule.setParameter("maximum", "300");
    AnnotationCheckFactory factory = AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(CheckWithOverriddenPropertyKey.class));

    Object check = factory.getCheck(activeRule);
    assertThat(((CheckWithOverriddenPropertyKey) check).getMax(), is(300));
  }

  @Test
  public void shouldWorkWithClonedRules() {
    RulesProfile profile = RulesProfile.create("repo", "java");
    Rule rule = Rule.create("repo", "CheckWithKey", "");
    Rule clonedRule = Rule.create("repo", "CheckWithKey_2", "").setConfigKey("CheckWithKey").setParent(rule);

    profile.activateRule(rule, null);
    profile.activateRule(clonedRule, null);
    AnnotationCheckFactory factory = AnnotationCheckFactory.create(profile, "repo", Arrays.<Class>asList(CheckWithKey.class));

    assertThat(factory.getChecks(), (Matcher) not(hasItems(nullValue())));
  }
}
