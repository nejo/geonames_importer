CREATE TABLE geo_geoname (
    id              INT,
    name            VARCHAR(200),
    name_ascii      VARCHAR(200),
    alternate_names VARCHAR(4000),
    latitude        DECIMAL(10, 7),
    longitude       DECIMAL(10, 7),
    feature_class   CHAR(1),
    feature_code    VARCHAR(10),
    country         VARCHAR(2),
    cc2             VARCHAR(60),
    admin1          VARCHAR(20),
    admin2          VARCHAR(80),
    admin3          VARCHAR(20),
    admin4          VARCHAR(20),
    population      INT,
    elevation       INT,
    gtopo30         INT,
    timezone        VARCHAR(40),
    mod_date        DATE,
    PRIMARY KEY (geoname_id)
) CHARACTER SET utf8;


CREATE TABLE geo_alternate_name (
    alternate_name_id   INT,
    geoname_id          INT,
    iso_language        VARCHAR(7),
    name                VARCHAR(200),
    is_preferred        BOOLEAN,
    is_short            BOOLEAN,
    is_colloquial       BOOLEAN,
    is_historic         BOOLEAN,
    PRIMARY KEY (alternate_name_id)
) CHARACTER SET utf8;


CREATE TABLE geo_country (
    iso_alpha2              CHAR(2),
    iso_alpha3              CHAR(3),
    iso_numeric             INTEGER,
    fips_code               VARCHAR(3),
    name                    VARCHAR(200),
    capital                 VARCHAR(200),
    area                    DOUBLE COMMENT 'Area in squared kilometers',
    population              INTEGER,
    continent               CHAR(2),
    tld                     CHAR(3),
    currency                CHAR(3),
    currency_name           CHAR(20),
    phone                   CHAR(10),
    postal_code_format      VARCHAR(100),
    postal_code_regex       VARCHAR(255),
    geoname_id              INT,
    languages               VARCHAR(200),
    neighbours              CHAR(100),
    equivalent_fips_code    CHAR(10),
    PRIMARY KEY (iso_alpha2)
) CHARACTER SET utf8;


CREATE TABLE geo_language (
    iso_639_3       CHAR(4),
    iso_639_2       VARCHAR(50),
    iso_639_1       VARCHAR(50),
    name            VARCHAR(200),
    PRIMARY KEY (iso_639_3)
) CHARACTER SET utf8;


CREATE TABLE geo_admin1 (
    code        CHAR(6),
    name        TEXT,
    name_ascii  TEXT,
    geoname_id  INT,
    PRIMARY KEY (code, geoname_id)
) CHARACTER SET utf8;


CREATE TABLE geo_admin2 (
    code        CHAR(15),
    name        TEXT,
    name_ascii   TEXT,
    geoname_id   INT,
    PRIMARY KEY (code, geoname_id)
) CHARACTER SET utf8;


CREATE TABLE geo_hierarchy (
    hierarchy_id    INT NOT NULL AUTO_INCREMENT,
    parent_id       INT,
    child_id        INT,
    type            VARCHAR(50),
    PRIMARY KEY (hierarchy_id)
) CHARACTER SET utf8;


CREATE TABLE geo_feature (
    code        CHAR(7),
    name        VARCHAR(200),
    description TEXT,
    PRIMARY KEY (code)
) CHARACTER SET utf8;


CREATE TABLE geo_timezone (
    id          INT NOT NULL AUTO_INCREMENT,
    timezone_id VARCHAR(200),
    gmt_offset  DECIMAL(3, 1),
    dst_offset  DECIMAL(3, 1),
    PRIMARY KEY (id)
) CHARACTER SET utf8;


CREATE TABLE geo_continent (
    code        CHAR(2),
    name        VARCHAR(20),
    geoname_id   INT,
    PRIMARY KEY (code)
) CHARACTER SET utf8;
