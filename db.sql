DROP TABLE IF EXISTS `java_login`.`app_role`;
CREATE TABLE  `java_login`.`app_role` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `APP_ROLE_UK` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `java_login`.`app_user`;
CREATE TABLE  `java_login`.`app_user` (
  `USER_ID` bigint(20) NOT NULL,
  `USER_NAME` varchar(36) NOT NULL,
  `ENCRYTED_PASSWORD` varchar(128) NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `APP_USER_UK` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `java_login`.`persistent_logins`;
CREATE TABLE  `java_login`.`persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `java_login`.`user_role`;
CREATE TABLE  `java_login`.`user_role` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ROLE_UK` (`USER_ID`,`ROLE_ID`),
  KEY `USER_ROLE_FK2` (`ROLE_ID`),
  CONSTRAINT `USER_ROLE_FK1` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`USER_ID`),
  CONSTRAINT `USER_ROLE_FK2` FOREIGN KEY (`ROLE_ID`) REFERENCES `app_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into App_User (USER_ID, USER_NAME, ENCRYTED_PASSWORD, ENABLED)
values (2, 'dbuser1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 1);
 
insert into App_User (USER_ID, USER_NAME, ENCRYTED_PASSWORD, ENABLED)
values (1, 'dbadmin1', '$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu', 1);

insert into app_role (ROLE_ID, ROLE_NAME)
values (1, 'ROLE_ADMIN');
 
insert into app_role (ROLE_ID, ROLE_NAME)
values (2, 'ROLE_USER');
 
insert into user_role (ID, USER_ID, ROLE_ID)
values (1, 1, 1);
 
insert into user_role (ID, USER_ID, ROLE_ID)
values (2, 1, 2);
 
insert into user_role (ID, USER_ID, ROLE_ID)
values (3, 2, 2);