-- All the rows inserted during Rails migrations. Rows inserted during server startup tasks (Java) are excluded : rules, profiles, metrics, ...

INSERT INTO ACTIVE_FILTERS(ID, FILTER_ID, USER_ID, ORDER_INDEX) VALUES (1, 1, null, 1);
INSERT INTO ACTIVE_FILTERS(ID, FILTER_ID, USER_ID, ORDER_INDEX) VALUES (2, 2, null, 2);
INSERT INTO ACTIVE_FILTERS(ID, FILTER_ID, USER_ID, ORDER_INDEX) VALUES (3, 3, null, 3);
ALTER TABLE ACTIVE_FILTERS ALTER COLUMN ID RESTART WITH 4;

INSERT INTO CRITERIA(ID, FILTER_ID, FAMILY, KEE, OPERATOR, VALUE, TEXT_VALUE, VARIATION) VALUES (1, 1, 'qualifier', null, '=', null, 'TRK', null);
INSERT INTO CRITERIA(ID, FILTER_ID, FAMILY, KEE, OPERATOR, VALUE, TEXT_VALUE, VARIATION) VALUES (2, 2, 'qualifier', null, '=', null, 'TRK', null);
INSERT INTO CRITERIA(ID, FILTER_ID, FAMILY, KEE, OPERATOR, VALUE, TEXT_VALUE, VARIATION) VALUES (3, 3, 'qualifier', null, '=', null, 'VW,SVW,TRK,BRC,DIR,PAC,FIL,CLA,UTS,LIB', null);
ALTER TABLE CRITERIA ALTER COLUMN ID RESTART WITH 4;

INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (1, 1, 'metric', 'alert_status', null, 1, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (2, 1, 'name', null, 'ASC', 2, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (3, 1, 'version', null, null, 3, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (4, 1, 'metric', 'ncloc', null, 4, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (5, 1, 'metric', 'violations_density', null, 5, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (6, 1, 'date', null, null, 6, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (7, 1, 'links', null, null, 7, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (8, 2, 'name', null, 'ASC', 1, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (9, 2, 'metric', 'ncloc', null, 2, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (10, 2, 'metric', 'violations_density', null, 3, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (11, 3, 'metric', 'alert_status', null, 1, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (12, 3, 'name', null, 'ASC', 2, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (13, 3, 'metric', 'ncloc', null, 3, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (14, 3, 'metric', 'violations_density', null, 4, null);
INSERT INTO FILTER_COLUMNS(ID, FILTER_ID, FAMILY, KEE, SORT_DIRECTION, ORDER_INDEX, VARIATION) VALUES (15, 3, 'date', null, null, 5, null);
ALTER TABLE FILTER_COLUMNS ALTER COLUMN ID RESTART WITH 16;

INSERT INTO FILTERS(ID, NAME, USER_ID, SHARED, FAVOURITES, RESOURCE_ID, DEFAULT_VIEW, PAGE_SIZE, PERIOD_INDEX) VALUES (1, 'Projects', null, true, false, null, 'list', null, null);
INSERT INTO FILTERS(ID, NAME, USER_ID, SHARED, FAVOURITES, RESOURCE_ID, DEFAULT_VIEW, PAGE_SIZE, PERIOD_INDEX) VALUES (2, 'Treemap', null, true, false, null, 'treemap', null, null);
INSERT INTO FILTERS(ID, NAME, USER_ID, SHARED, FAVOURITES, RESOURCE_ID, DEFAULT_VIEW, PAGE_SIZE, PERIOD_INDEX) VALUES (3, 'My favourites', null, true, true, null, 'list', null, null);
ALTER TABLE FILTERS ALTER COLUMN ID RESTART WITH 4;

INSERT INTO GROUP_ROLES(ID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (1, 1, null, 'admin');
INSERT INTO GROUP_ROLES(ID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (2, 1, null, 'default-admin');
INSERT INTO GROUP_ROLES(ID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (3, 2, null, 'default-user');
INSERT INTO GROUP_ROLES(ID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (4, null, null, 'default-user');
INSERT INTO GROUP_ROLES(ID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (5, 2, null, 'default-codeviewer');
INSERT INTO GROUP_ROLES(ID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (6, null, null, 'default-codeviewer');
ALTER TABLE GROUP_ROLES ALTER COLUMN ID RESTART WITH 7;

INSERT INTO GROUPS(ID, NAME, DESCRIPTION, CREATED_AT, UPDATED_AT) VALUES (1, 'sonar-administrators', 'System administrators', '2011-09-26 22:27:51.0', '2011-09-26 22:27:51.0');
INSERT INTO GROUPS(ID, NAME, DESCRIPTION, CREATED_AT, UPDATED_AT) VALUES (2, 'sonar-users', 'Any new users created will automatically join this group', '2011-09-26 22:27:51.0', '2011-09-26 22:27:51.0');
ALTER TABLE GROUPS ALTER COLUMN ID RESTART WITH 3;

INSERT INTO GROUPS_USERS(USER_ID, GROUP_ID) VALUES (1, 1);
INSERT INTO GROUPS_USERS(USER_ID, GROUP_ID) VALUES (1, 2);

INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('1');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('2');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('10');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('11');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('13');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('14');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('16');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('35');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('36');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('39');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('41');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('46');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('48');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('49');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('51');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('52');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('53');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('54');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('55');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('57');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('58');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('59');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('60');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('61');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('62');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('66');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('68');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('69');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('72');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('73');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('75');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('76');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('77');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('78');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('79');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('80');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('81');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('82');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('84');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('85');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('86');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('87');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('88');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('89');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('90');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('91');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('92');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('93');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('94');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('95');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('96');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('97');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('98');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('99');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('100');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('101');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('110');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('111');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('112');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('113');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('114');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('115');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('116');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('117');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('118');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('119');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('120');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('131');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('132');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('133');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('134');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('135');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('136');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('137');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('138');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('139');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('140');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('141');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('142');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('150');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('151');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('160');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('162');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('163');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('165');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('166');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('167');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('168');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('169');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('170');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('180');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('181');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('190');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('191');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('200');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('201');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('202');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('203');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('210');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('211');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('212');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('213');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('214');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('215');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('216');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('217');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('220');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('221');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('222');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('230');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('231');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('232');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('233');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('234');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('235');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('236');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('237');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('238');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('239');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('240');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('241');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('250');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('251');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('252');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('253');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('254');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('255');
INSERT INTO SCHEMA_MIGRATIONS(VERSION) VALUES ('256');

INSERT INTO USERS(ID, LOGIN, NAME, EMAIL, CRYPTED_PASSWORD, SALT, CREATED_AT, UPDATED_AT, REMEMBER_TOKEN, REMEMBER_TOKEN_EXPIRES_AT) VALUES (1, 'admin', 'Administrator', '', 'a373a0e667abb2604c1fd571eb4ad47fe8cc0878', '48bc4b0d93179b5103fd3885ea9119498e9d161b', '2011-09-26 22:27:48.0', '2011-09-26 22:27:48.0', null, null);
ALTER TABLE USERS ALTER COLUMN ID RESTART WITH 2;
