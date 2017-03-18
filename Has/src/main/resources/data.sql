INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('0', 'ADMIN');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('1', 'PERM_VIEW_USER');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('2', 'PERM_REMOVE_USER');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('3', 'PERM_EDIT_USER');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('4', 'PERM_CREATE_USER');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('5', 'PERM_SEARCH_USER');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('6', 'PERM_VIEW_ROOM');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('7', 'PERM_REMOVE_ROOM');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('8', 'PERM_EDIT_ROOM');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('9', 'PERM_CREATE_ROOM');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('10', 'PERM_SEARCH_ROOM');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('11', 'PERM_VIEW_RESERVATION');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('12', 'PERM_REMOVE_RESERVATION');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('13', 'PERM_EDIT_RESERVATION');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('14', 'PERM_CREATE_RESERVATION');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('15', 'PERM_CREATE_REQUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('16', 'PERM_VIEW_REQUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('17', 'PERM_REMOVE_REQUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('18', 'PERM_EDIT_REQUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('19', 'PERM_CREATE_PERSONAL_DATA');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('20', 'PERM_REMOVE_PERSONAL_DATA');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('21', 'PERM_EDIT_PERSONAL_DATA');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('22', 'PERM_VIEW_PERSONAL_DATA');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('23', 'PERM_CREATE_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('24', 'PERM_VIEW_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('25', 'PERM_EDIT_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('26', 'PERM_REMOVE_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('27', 'PERM_SEARCH_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('28', 'PERM_CREATE_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('29', 'PERM_VIEW_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('30', 'PERM_EDIT_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('31', 'PERM_REMOVE_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('32', 'PERM_SEARCH_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('33', 'PERM_CREATE_EMPLOYEE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('34', 'PERM_VIEW_EMPLOYEE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('35', 'PERM_EDIT_EMPLOYEE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('36', 'PERM_REMOVE_EMPLOYEE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('37', 'PERM_SEARCH_EMPLOYEE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('38', 'PERM_VIEW_RESERVATION_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('39', 'PERM_REMOVE_RESERVATION_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('40', 'PERM_EDIT_RESERVATION_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('41', 'PERM_CREATE_RESERVATION_GUEST');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('42', 'PERM_CREATE_SCHEDULE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('43', 'PERM_VIEW_SCHEDULE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('44', 'PERM_EDIT_SCHEDULE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('45', 'PERM_REMOVE_SCHEDULE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('46', 'PERM_SEARCH_SCHEDULE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('47', 'PERM_CREATE_REQUEST_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('48', 'PERM_VIEW_REQUEST_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('49', 'PERM_REMOVE_REQUEST_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('50', 'PERM_EDIT_REQUEST_MEAL');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('51', 'PERM_CREATE_TASK');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('52', 'PERM_VIEW_TASK');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('53', 'PERM_EDIT_TASK');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('54', 'PERM_REMOVE_TASK');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('55', 'PERM_SEARCH_TASK');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('56', 'PERM_VIEW_ROLE');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('57', 'PERM_CREATE_CONFIGURATION');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('58', 'PERM_VIEW_CONFIGURATION');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('59', 'PERM_EDIT_CONFIGURATION');
INSERT INTO PERMISSION (PERMISSION_ID, permission) VALUES ('60', 'PERM_REMOVE_CONFIGURATION');



INSERT INTO ROLE (USER_ROLE_ID, ROLE_NAME) VALUES ('1', 'ADMIN');
INSERT INTO ROLE (USER_ROLE_ID, ROLE_NAME) VALUES ('2', 'MANAGER');
INSERT INTO ROLE (USER_ROLE_ID, ROLE_NAME) VALUES ('3', 'RECEPTION');
INSERT INTO ROLE (USER_ROLE_ID, ROLE_NAME) VALUES ('4', 'SERVICE');
INSERT INTO ROLE (USER_ROLE_ID, ROLE_NAME) VALUES ('5', 'CLIENT');
INSERT INTO ROLE (USER_ROLE_ID, ROLE_NAME) VALUES ('6', 'BOOKING');


INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '0');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '1');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '2');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '3');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '4');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '5');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '6');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '7');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '8');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '9');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '10');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '11');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '12');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '13');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '14');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '15');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '16');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '17');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '18');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '19');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '20');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '21');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '22');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '23');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '24');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '25');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '26');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '27');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '28');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '29');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '30');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '31');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '32');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '33');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '34');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '35');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '36');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '37');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '38');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '39');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '40');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '41');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '42');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '43');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '44');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '45');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '46');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '47');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '48');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '49');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '50');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '51');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '52');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '53');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '54');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '55');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '56');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '57');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '58');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '59');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('1', '60');

INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '1');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '5');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '6');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '7');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '8');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '9');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '10');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '15');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '16');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '17');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '18');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '33');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '34');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '35');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '36');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '37');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '38');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '39');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '40');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '41');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '42');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '43');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '44');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '45');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '46');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '51');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '52');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '53');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '54');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '55');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '57');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '58');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '59');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('2', '60');


INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '1');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '5');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '6');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '7');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '8');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '9');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '10');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '11');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '12');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '13');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '14');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '17');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '20');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '25');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '28');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '29');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '30');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '31');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '32');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '37');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '38');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '39');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '40');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('3', '41');

INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('4', '11');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('4', '12');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('4', '13');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('4', '14');

INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '6');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '11');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '12');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '13');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '14');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '28');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '30');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '38');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '40');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '41');
INSERT INTO ROLE_PERMISSION (USER_ROLE_ID, PERMISSION_ID) VALUES ('6', '56');


INSERT INTO T_USER (USER_ID, LAST_LOGIN, password, email, REG_DATE, username, enabled) VALUES
('1', '2017-01-10T12:30:00', 'password', 'ivan@gmail.com', '2016-11-12', 'ivan', 'true'),
('2', '2017-01-26T11:10:10', '123123123', 'grigorkata77@abv.com', '2016-12-29', 'grigor', 'true'),
('3', '2017-01-26T23:11:10', '123456789a', 'pena23@abv.com', '2014-07-12', 'baba_pena', 'true'),
('4', '2017-01-27T13:12:10', '123456789b', 'georgi@abv.com', '2017-01-27', 'georgi', 'true'),
('5', '2017-01-25T23:14:10', '123456789c', 'joshua@abv.com', '2017-01-25', 'joshua', 'true'),
('6', '2017-01-24T14:12:10', '123456789d', 'johnny@abv.com', '2017-01-24', 'johnny', 'true'),
('7', '2017-01-23T23:23:23', '123456789e', 'nikolai@abv.com', '2017-01-23', 'niksana', 'true'),
('8', '2017-01-28T14:12:10', '123456789f', 'david@abv.com', '2017-01-27', 'david', 'true'),
('9', '2017-01-29T15:15:10', '123456789g', 'stefcho@abv.com', '2017-01-28', 'stefcho', 'true'),
('10', '2017-01-30T13:12:10', '123456789b', 'iordan@abv.com', '2017-01-29', 'dakata', 'true'),
('11', '2017-02-02T13:12:10', 'babatiestara', 'toni_nike@gmail.com', '2016-06-12', 'toni_nike', 'true'),
('12', '2017-01-10T12:30:00', 'password', 'timothy@gmail.com', '2016-11-12', 'tim', 'true'),
('13', '2017-01-28T14:12:10', 'password', 'blazer@abv.com', '2017-01-27', 'Blzr', 'true'),
('14', '2017-01-29T15:15:10', 'password', 'bobi@yahoo.com', '2016-01-28', 'boqn', 'true'),
('15', '2017-01-30T13:12:10', 'password', 'smurai_jack@abv.com', '2017-01-29', 'jack', 'true'),
('16', '2017-02-02T13:12:10', 'password', 'R2D2@gmail.com', '2016-06-12', 'mr_robot', 'true'),
('17', '2017-01-10T12:30:00', 'password', 'Mordor@gmail.com', '2016-11-12', 'sauron', 'true'),
('18', '2017-03-10T11:31:25', '123123123a', 'ginkata@abv.com', '2017-02-12', 'ginka90', 'true'),
('19', '2017-03-11T23:00:25', '123password', 'dani89@hotmail.com', '2017-03-06', 'dani89', 'true'),
('20', null, 'B00king', 'booking@msehas.bg', '2016-01-01', 'booking', 'true');


INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('1', '1');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('2', '2');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('3', '4');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('4', '3');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('5', '3');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('6', '3');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('7', '4');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('8', '4');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('9', '4');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('10', '2');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('11', '5');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('12', '1');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('13', '1');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('14', '1');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('15', '1');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('16', '1');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('17', '1');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('18', '5');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('19', '5');
INSERT INTO USER_ROLE (USER_ID, USER_ROLE_ID) VALUES ('20', '6');



INSERT INTO PERSONAL_DATA (PERSONAL_DATA_ID, address, egn, FULL_NAME, IDENTITY_EXPIRE_DATE, IDENTITY_ISSUE_DATE, IDENTITY_ISSUED_BY, IDENTITY_NUMBER, phone) VALUES
('1', 'some street', '9201275304', 'Spas Spasov', '2020-12-10', '2010-12-10', 'some MVR', '123456789', '213124124'),
('2', 'street 11', '9105165327', 'Grigor Dimitrov', '2020-12-15', '2010-12-15', 'MVR Ruse', '526441710', '0883888888'),
('3', 'street 12', '3102128936', 'Pena Ivanova', '2019-11-17', '2009-11-17', 'MVR Varna', '899121883', '0885455661'),
('4', 'street 13', '9104023426', 'Georgi Petrov', '2018-01-27', '2008-01-27', 'MVR Varna', '947343109', '0886595959'),
('5', 'street 14', '9107154482', 'Joshua Trump', '2021-02-28', '2011-02-28', 'MVR Ruse', '468127990', '0884789885'),
('6', 'street 15', '9108239840', 'Johnny Depp', '2022-03-29', '2012-03-29', 'MVR Burgas', '505850482', '0898888777'),
('7', 'street 16', '9109231762', 'Nikolai Nikolov', '2023-04-13', '2013-04-13', 'MVR Ruse', '672661246', '0898555123'),
('8', 'street 17', '9109309304', 'David Beckham', '2023-04-15', '2013-04-15', 'MVR Sofiq', '701115038', '0897443556'),
('9', 'street 18', '9201063964', 'Stefan Nedelchev', '2023-05-17', '2013-05-17', 'MVR Ruse', '394875313', '0883562412'),
('10', 'street 19', '9202053964', 'Petar Nedelchev', '2023-05-17', '2013-05-17', 'MVR Ruse', '394875377', '0883562343'),
('11', 'street 20', '9112053964', 'Bai Tanas Debelia', '2023-05-17', '2013-05-17', 'MVR Silistra', '114875313', '0883112341'),
('12', 'street 21', '9012053911', 'Toni Naika', '2024-05-12', '2014-05-12', 'MVR Sofia', '004875311', '0884135341'),
('13', 'street 22', '8801054212', 'Atanas Kolev', '2025-05-12', '2015-05-12', 'MVR Sofia', '112875303', '0871115341'),
('14', 'Jackson st.', '8822054212', 'Timothy Smith', '2025-05-12', '2015-05-12', 'MVR Sofia', '112875353', '0871625341'),
('15', 'Picadili circus', '9202053914', 'Pesho pesho', '2023-05-17', '2013-05-17', 'MVR Ruse', '394875373', '0883562343'),
('16', 'wolfsburg 26', '9112053994', 'Axl Law', '2023-05-17', '2013-05-17', 'MVR Silistra', '114875303', '0883112341'),
('17', 'johannesburg', '9012053931', 'Tom Soyer', '2024-05-12', '2014-05-12', 'MVR Sofia', '001875311', '0884135341'),
('18', 'kings street 1' , '8801054222', 'Luke Skywalker', '2025-05-12', '2015-05-12', 'MVR Sofia', '002875303', '0871115341'),
('19', 'a barrel of snakes', '4822054212', 'Boba fett', '2025-05-12', '2015-05-12', 'MVR Sofia', '212875353', '0871625341');

INSERT INTO EMPLOYEE (EMPLOYEE_ID, DATE_HIRED, PERSONAL_DATA_ID, USER_ID, EMPLOYED, SALARY, BUSY) VALUES
('1', '2016-11-12', '1', '1', 'true', 750.50, FALSE),
('2', '2016-12-29', '2', '2', 'true', 750.50, FALSE),
('3', '2014-01-27', '3', '3', 'false', 649.99, FALSE),
('4', '2017-01-27', '4', '4', 'true', 649.50, TRUE),
('5', '2017-01-27', '5', '5', 'false', 649.50, FALSE),
('6', '2017-01-27', '6', '6', 'false', 590.9, TRUE),
('7', '2017-01-17', '7', '7', 'true', 590.9, FALSE),
('8', '2017-01-04', '8', '8', 'false', 650.50, TRUE),
('9', '2017-02-01', '9', '9', 'true', 650.50, TRUE),
('10', '2017-02-03', '10', '10', 'true', 650.50, FALSE),
('11', '2017-02-03', '14', '12', 'true', 800.00, FALSE);

INSERT INTO WORKING_SCHEDULE(ID, EMPLOYEE_ID, SHIFT, SCHEDULE_DATE) VALUES
(1, 2, 0, '2017-02-08'),
(2, 5, 1, '2017-02-08'),
(3, 8, 2, '2017-02-08'),
(4, 3, 0, '2017-02-09'),
(5, 3, 1, '2017-02-18'),
(6, 2, 0, '2017-02-18'),
(7, 9, 1, '2017-02-10');

INSERT INTO GUEST (GUEST_ID, NUMBER_RESERVATIONS, STATUS, PERSONAL_DATA_ID) VALUES (1, 2, 0, '11');
INSERT INTO GUEST (GUEST_ID, NUMBER_RESERVATIONS, STATUS, PERSONAL_DATA_ID, USER_ID) VALUES (2, 1, 0, '12', '11');
INSERT INTO GUEST (GUEST_ID, NUMBER_RESERVATIONS, STATUS, PERSONAL_DATA_ID) VALUES (3, 2, 0, '13');
INSERT INTO GUEST (GUEST_ID, NUMBER_RESERVATIONS, STATUS, PERSONAL_DATA_ID) VALUES (4, 0, 0, '15');
INSERT INTO GUEST (GUEST_ID, NUMBER_RESERVATIONS, STATUS, PERSONAL_DATA_ID) VALUES (5, 0, 0, '16');
INSERT INTO GUEST (GUEST_ID, NUMBER_RESERVATIONS, STATUS, PERSONAL_DATA_ID) VALUES (6, 0, 0, '17');
INSERT INTO GUEST (GUEST_ID, NUMBER_RESERVATIONS, STATUS, PERSONAL_DATA_ID) VALUES (7, 0, 0, '18');
INSERT INTO GUEST (GUEST_ID, NUMBER_RESERVATIONS, STATUS, PERSONAL_DATA_ID, USER_ID) VALUES (8, 1, 0, '19', '17');

INSERT INTO ROOM (NUMBER, BEDS_DOUBLE, BEDS_SINGLE, ROOM_CLASS, STATUS, CHILDREN, PETS, MINIBAR)  VALUES
(101, 1, 0, 0, 0, FALSE, FALSE, TRUE),
(102, 0, 1, 2, 1, FALSE, FALSE, FALSE),
(103, 0, 1, 2, 0, FALSE, FALSE, FALSE),
(201, 1, 1, 0, 0, TRUE, FALSE, TRUE),
(202, 1, 0, 1, 2, TRUE, TRUE, FALSE),
(203, 0, 3, 2, 1, FALSE, FALSE, FALSE),
(301, 0, 1, 0, 0, FALSE, FALSE, TRUE),
(302, 1, 0, 1, 0, TRUE, TRUE, TRUE),
(303, 0, 2, 1, 1, FALSE, TRUE, TRUE),
(304, 1, 1, 0, 2, TRUE, FALSE, TRUE),
(401, 0, 2, 1, 0, FALSE, TRUE, TRUE),
(402, 1, 2, 0, 0, TRUE, TRUE, TRUE);

INSERT INTO RESERVATION
(reservation_id, all_inclusive, breakfast, dinner, discount, end_date, group_id, last_modified_by_user_id, last_modified_time, number_adults, number_children, price, room_id, employee_id, start_date, status)
VALUES('1', false, true, false, 0, '2017-03-20', null, null, null, 2, 1, 40.0, 5, '5', '2017-03-16', 0),
('2', true, true, true, 10, '2017-03-22', 'asdasdmadafaka', null, null, 1, 1, 50.0, 8, '4', '2017-03-18', 1),
('3', true, true, true, 10, '2017-03-22', 'asdasdmadafaka', null, null, 1, 1, 50.0, 10, '4', '2017-03-18', 1),
('4', false, false, true, 10, '2017-03-24', null, null, null, 2, 0, 45.0, 2, '4', '2017-03-21', 1);

INSERT INTO RESERVATION_GUEST (RESERVATION_GUEST_ID, reservation_id, guest_id, owner) VALUES
(1, 1, 1, true),
(2, 2, 2, true),
(3, 3, 3, false),
(4, 4, 1, true),
(5, 4, 2, false);

INSERT INTO MEAL_CATEGORY (MEAL_CATEGORY_ID, TITLE, IMG, DESCRIPTION) VALUES
(1, 'Dessert', 'img/cake.jpg', 'Find the best desserts here.'),
(2, 'Salad', 'img/salad.jpg','Find the best salads here.'),
(3, 'BBQ', 'img/bbq.jpg','Find the best BBQs here.'),
(4, 'Pizza', 'img/pizza.jpg','Find the best Italian pizzas here.'),
(5, 'Pasta', 'img/pasta.jpg','Find the best Italian pastas here.'),
(6, 'Drinks', 'img/whiskey.jpg','Find the best beverages here.');

INSERT INTO MEAL(MEAL_ID, MEAL_NAME, IMG, DESCRIPTION, PRICE, MEAL_CATEGORY_ID, DATE_POSTED) VALUES
 (1, 'Chocolate cake', 'img/meal.png', 'This is chocolate cake', 5.50, 1 , '2017-02-10'),
 (2, 'Vanilla cake', 'img/meal.png', 'This is chocolate cake', 4.30, 1 , '2017-02-10'),
 (3, 'Fruit cake', 'img/meal.png', 'This is chocolate cake', 5.60, 1, '2017-02-10' ),
 (4, 'Chocolate muffin', 'img/meal.png', 'This is chocolate cake', 2.50, 1, '2017-02-10' ),
 (5, 'Italian salad', 'img/meal.png', 'Delicious italian salad.', 4.50, 2 , '2017-02-10'),
 (6, 'Ceasar salad', 'img/meal.png', 'Delicious ceasar salad.', 5.99, 2 , '2017-02-10'),
 (7, 'Greece salad ', 'img/meal.png', 'Delicious greece salad.', 4.70, 2 , '2017-02-10'),
 (8, 'Shopska salad', 'img/meal.png', 'Delicious shopska salad.', 3.50, 2 , '2017-02-10'),
 (9, 'Veal bbq', 'img/meal.png', 'This is veal bbq.', 12.50, 3 , '2017-02-10'),
 (10, 'Chicken bbq', 'img/meal.png', 'This is chicken bbq', 9.90, 3 , '2017-02-10'),
 (11, 'Fork bbq', 'img/meal.png', 'This is fork bbq.', 7.90, 3, '2017-02-10' ),
 (12, 'Shol bbq', 'img/meal.png', 'This is most delicious meat from veal', 15.50, 3 , '2017-02-10');

INSERT INTO MEAL (MEAL_ID, MEAl_CATEGORY_ID, DATE_POSTED, IMG, DESCRIPTION, MEAL_NAME, PRICE) VALUES
(13, 1, '2017-02-14', 'img/meal.png', 'Home made beans with vegetables and sausage', 'Beans and sausage', '10'),
(14, 1, '2017-02-14', 'img/meal.png', 'Fried eggs with red pepper', 'Fried eggs', '5'),
(15, 2, '2017-02-14', 'img/meal.png', 'Steamed vegetables include: carrots, peas, corn and a gram of pure coke', 'Steamed vegetables', '15'),
(16, 2, '2017-02-14', 'img/meal.png', 'Pasta Bolognese includes: chopped vegetables, minced beef and red wine', 'Pasta Bolognese', '10'),
(17, 3, '2017-02-14', 'img/meal.png', 'Freshly baked tost bread', 'Toast', '2');

INSERT INTO REQUEST (REQUEST_ID, RESERVATION_GUEST_ID, STATUS, TIME_PLACED, TIME_FINISHED, REQUEST_TYPE) VALUES
(1, 1, 0, '2017-03-06T19:30:11','2017-03-06T19:41:20', 2),
(2, 2, 0, '2017-03-06T20:00:11','2017-03-06T20:08:44', 1);

INSERT INTO TASK(TASK_ID, TITLE, DESCRIPTION, TIME_PLACED, START_TIME, FINISH_TIME, ASSIGNER, DURATION, PRIORITY, EMPLOYEE_ID, STATUS) VALUES
 (1, 'Clean Room', 'Clean Room 201', '2017-03-06T11:45:00', '2017-03-06T11:50:00', '2017-03-06T12:20:00', 'SYSTEM', '00:30', 3, 3, 3),
 (2, 'Deliver Meal', 'Deliver Meal 203', '2017-03-06T15:00:00', '2017-03-06T15:25:00', '2017-03-06T15:35:00', 'SYSTEM', '00:10', 1, 7, 1),
 (3, 'Restock', 'Restock Restroom 201b', '2017-03-06T13:24:00', '2017-03-06T13:30:00', '2017-03-06T14:00:00', 'Grigor Dimitrov', '00:30', 3, 8, 1),
 (4, 'Clean Room', 'Clean Room 101', '2017-03-06T09:00:00', '2017-03-06T09:05:00', '2017-03-06T09:35:00', 'SYSTEM', '00:30', 1, 9, 1),
 (5, 'Change sheets', 'Change sheets in room 303', '2017-03-12T09:00:00', '2017-03-12T09:05:00', '2017-03-12T09:35:00', 'SYSTEM', '00:30', 1, 8, 3),
 (6, 'Change towels', 'Change towels in room 301', '2017-03-12T09:35:00', '2017-03-12T09:40:00', '2017-03-12T10:00:00', 'SYSTEM', '00:20', 1, 8, 2),
 (7, 'Bring toilet paper', 'Bring 2 rolls toilet paper in room 101', '2017-03-12T10:00:00', '2017-03-12T10:05:00', '2017-03-12T10:30:00', 'SYSTEM', '00:25', 1, 8, 3),
 (8, 'Bring soap', 'Bring soap in room 103', '2017-03-13T10:30:00', '2017-03-12T10:35:00', '2017-03-12T11:00:00', 'SYSTEM', '00:25', 1, 8, 1),
 (9, 'Bring shampoo', 'Bring shampoo in room 201', '2017-03-12T11:00:00', '2017-03-12T11:05:00', '2017-03-12T11:30:00', 'SYSTEM', '00:25', 1, 9, 3),
 (10, 'Deliver Meal', 'Deliver Meal to room 203', '2017-03-12T11:00:00', '2017-03-12T11:05:00', '2017-03-12T11:55:00', 'SYSTEM', '00:50', 1, 9, 3),
 (11, 'Clean room', 'Clean room 304 and prepare it for new guests', '2017-03-12T13:00:00', '2017-03-12T13:05:00', '2017-03-12T15:00:00', 'SYSTEM', '01:55', 1, 9, 2),
 (12, 'Clean room', 'Clean room 303 and prepare it for new guests', '2017-03-12T15:00:00', '2017-03-12T15:05:00', '2017-03-12T17:00:00', 'SYSTEM', '01:55', 1, 9, 1),
 (13, 'Change sheets', 'Change sheets in room 303', '2017-03-13T09:00:00', '2017-03-13T09:05:00', '2017-03-13T09:35:00', 'SYSTEM', '00:30', 1, 3, 3),
 (14, 'Change towels', 'Change towels in room 301', '2017-03-13T09:35:00', '2017-03-13T09:40:00', '2017-03-13T10:00:00', 'SYSTEM', '00:20', 1, 3, 2),
 (15, 'Bring toilet paper', 'Bring 2 rolls toilet paper in room 101', '2017-03-13T10:00:00', '2017-03-13T10:05:00', '2017-03-13T10:30:00', 'SYSTEM', '00:25', 1, 3, 3),
 (16, 'Bring soap', 'Bring soap in room 103', '2017-03-13T10:30:00', '2017-03-13T10:35:00', '2017-03-13T11:00:00', 'SYSTEM', '00:25', 1, 3, 1),
 (17, 'Bring shampoo', 'Bring shampoo in room 201', '2017-03-13T11:00:00', '2017-03-13T11:05:00', '2017-03-13T11:30:00', 'SYSTEM', '00:25', 1, 7, 3),
 (18, 'Deliver Meal', 'Deliver Meal to room 203', '2017-03-13T11:00:00', '2017-03-13T11:05:00', '2017-03-13T11:55:00', 'SYSTEM', '00:50', 1, 7, 3),
 (19, 'Clean room', 'Clean room 304 and prepare it for new guests', '2017-03-13T13:00:00', '2017-03-13T13:05:00', '2017-03-13T15:00:00', 'SYSTEM', '01:55', 1, 7, 2),
 (20, 'Clean room', 'Clean room 202 and prepare it for new guests', '2017-03-13T15:00:00', '2017-03-13T15:05:00', '2017-03-13T17:00:00', 'SYSTEM', '01:55', 1, 7, 1);

INSERT INTO CONFIGURATION (CONFIGURATION_ID, OVERNIGHT_PRICE, SINGLE_BED_PRICE, DOUBLE_BED_PRICE, ALL_INCLUSIVE_PRICE, BREAKFAST_PRICE, DINNER_PRICE,
HOTEL_NAME, SEASONAL_DISCOUNT, GUEST_DISCOUNT, LOW_CLASS_PRICE, MEDIUM_CLASS_PRICE, HIGH_CLASS_PRICE) VALUES
('1', '25', '1', '1.8', '10', '5', '5', 'Beach City', '0.10', '0', '1', '1.5', '2');