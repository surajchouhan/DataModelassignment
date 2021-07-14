mysql> desc person;
+-----------------------------+---------------+------+-----+---------+-------+
| Field                       | Type          | Null | Key | Default | Extra |
+-----------------------------+---------------+------+-----+---------+-------+
| PARTY_ID                    | varchar(20)   | NO   | PRI | NULL    |       |
| SALUTATION                  | varchar(100)  | YES  |     | NULL    |       |
| FIRST_NAME                  | varchar(100)  | YES  | MUL | NULL    |       |
| MIDDLE_NAME                 | varchar(100)  | YES  |     | NULL    |       |
| LAST_NAME                   | varchar(100)  | YES  | MUL | NULL    |       |
| PERSONAL_TITLE              | varchar(100)  | YES  |     | NULL    |       |
| SUFFIX                      | varchar(100)  | YES  |     | NULL    |       |
| NICKNAME                    | varchar(100)  | YES  |     | NULL    |       |
| FIRST_NAME_LOCAL            | varchar(100)  | YES  |     | NULL    |       |
| MIDDLE_NAME_LOCAL           | varchar(100)  | YES  |     | NULL    |       |
| LAST_NAME_LOCAL             | varchar(100)  | YES  |     | NULL    |       |
| OTHER_LOCAL                 | varchar(100)  | YES  |     | NULL    |       |
| MEMBER_ID                   | varchar(20)   | YES  |     | NULL    |       |
| GENDER                      | char(1)       | YES  |     | NULL    |       |
| BIRTH_DATE                  | date          | YES  |     | NULL    |       |
| DECEASED_DATE               | date          | YES  |     | NULL    |       |
| HEIGHT                      | double        | YES  |     | NULL    |       |
| WEIGHT                      | double        | YES  |     | NULL    |       |
| MOTHERS_MAIDEN_NAME         | varchar(255)  | YES  |     | NULL    |       |
| MARITAL_STATUS              | char(1)       | YES  |     | NULL    |       |
| SOCIAL_SECURITY_NUMBER      | varchar(255)  | YES  |     | NULL    |       |
| PASSPORT_NUMBER             | varchar(255)  | YES  |     | NULL    |       |
| PASSPORT_EXPIRE_DATE        | date          | YES  |     | NULL    |       |
| TOTAL_YEARS_WORK_EXPERIENCE | double        | YES  |     | NULL    |       |
| COMMENTS                    | varchar(255)  | YES  |     | NULL    |       |
| EMPLOYMENT_STATUS_ENUM_ID   | varchar(20)   | YES  | MUL | NULL    |       |
| RESIDENCE_STATUS_ENUM_ID    | varchar(20)   | YES  | MUL | NULL    |       |
| OCCUPATION                  | varchar(100)  | YES  |     | NULL    |       |
| YEARS_WITH_EMPLOYER         | decimal(20,0) | YES  |     | NULL    |       |
| MONTHS_WITH_EMPLOYER        | decimal(20,0) | YES  |     | NULL    |       |
| EXISTING_CUSTOMER           | char(1)       | YES  |     | NULL    |       |
| CARD_ID                     | varchar(60)   | YES  | UNI | NULL    |       |
| LAST_UPDATED_STAMP          | datetime(3)   | YES  |     | NULL    |       |
| LAST_UPDATED_TX_STAMP       | datetime(3)   | YES  | MUL | NULL    |       |
| CREATED_STAMP               | datetime(3)   | YES  |     | NULL    |       |
| CREATED_TX_STAMP            | datetime(3)   | YES  | MUL | NULL    |       |
+-----------------------------+---------------+------+-----+---------+-------+
36 rows in set (0.14 sec)

//personal information.

mysql> select  FIRST_NAME from person where PARTY_ID="DemoCustomer";
+------------+
| FIRST_NAME |
+------------+
| Demo       |
+------------+
1 row in set (0.11 sec)


mysql> select  FIRST_NAME,MIDDLE_NAME,LAST_NAME from PERSON where PARTY_ID="DemoCustomer";
+------------+-------------+-----------+
| FIRST_NAME | MIDDLE_NAME | LAST_NAME |
+------------+-------------+-----------+
| Demo       | NULL        | Customer  |
+------------+-------------+-----------+
1 row in set (0.00 sec)

mysql>


//Contact information

mysql> select c. CONTACT_MECH_ID from Contact_mech c INNER JOIN Party_contact_mech pc ON pc.CONTACT_MECH_ID=c.CONTACT_MECH_ID INNER JOIN party p ON p.PARTY_ID=pc.PARTY_ID AND p.PARTY_ID='DemoCustomer';
+-----------------+
| CONTACT_MECH_ID |
+-----------------+
| 9015            |
| 9025            |
| 9026            |
| 9027            |
+-----------------+
4 rows in set (0.11 sec)


mysql> select * from  POSTAL_ADDRESS where Contact_mech_id='9015';
+-----------------+---------------+-----------+-------------------+----------+--------------+------------------+------------+------+-------------+-------------+-----------------+----------------+-----------------------+---------------+---------------------+--------------------+--------------+-------------------------+-------------------------+-------------------------+-------------------------+
| CONTACT_MECH_ID | TO_NAME       | ATTN_NAME | ADDRESS1          | ADDRESS2 | HOUSE_NUMBER | HOUSE_NUMBER_EXT | DIRECTIONS | CITY | CITY_GEO_ID | POSTAL_CODE | POSTAL_CODE_EXT | COUNTRY_GEO_ID | STATE_PROVINCE_GEO_ID | COUNTY_GEO_ID | MUNICIPALITY_GEO_ID | POSTAL_CODE_GEO_ID | GEO_POINT_ID | LAST_UPDATED_STAMP      | LAST_UPDATED_TX_STAMP   | CREATED_STAMP           | CREATED_TX_STAMP        |
+-----------------+---------------+-----------+-------------------+----------+--------------+------------------+------------+------+-------------+-------------+-----------------+----------------+-----------------------+---------------+---------------------+--------------------+--------------+-------------------------+-------------------------+-------------------------+-------------------------+
| 9015            | Demo Customer | NULL      | 2004 Factory Blvd | NULL     |         NULL | NULL             | NULL       | Orem | NULL        | 84057       | NULL            | USA            | UT                    | NULL          | NULL                | NULL               | 9000         | 2021-07-13 19:09:04.201 | 2021-07-13 19:09:00.493 | 2021-07-13 19:09:04.201 | 2021-07-13 19:09:00.493 |
+-----------------+---------------+-----------+-------------------+----------+--------------+------------------+------------+------+-------------+-------------+-----------------+----------------+-----------------------+---------------+---------------------+--------------------+--------------+-------------------------+-------------------------+-------------------------+-------------------------+
1 row in set (0.02 sec)

mysql> select * from  POSTAL_ADDRESS where Contact_mech_id='9025';
Empty set (0.00 sec)