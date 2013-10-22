CREATE TABLE geo_geoname (
    id              INT,
    name            VARCHAR(200)    COMMENT 'name of geographical point (utf8)',
    name_ascii      VARCHAR(200)    COMMENT 'name of geographical point in plain ascii characters',
    alternate_names VARCHAR(4000)   COMMENT 'alternate names, comma separated',
    latitude        DECIMAL(10, 7)  COMMENT 'latitude in decimal degrees (wgs84)',
    longitude       DECIMAL(10, 7)  COMMENT 'longitude in decimal degrees (wgs84)',
    feature_class   CHAR(1)         COMMENT 'see http://www.geonames.org/export/codes.html',
    feature_code    VARCHAR(10)     COMMENT 'see http://www.geonames.org/export/codes.html',
    country         VARCHAR(2)      COMMENT 'ISO-3166 2-letter country code',
    cc2             VARCHAR(60)     COMMENT 'alternate country codes, comma separated, ISO-3166 2-letter country code',
    admin1          VARCHAR(20)     COMMENT 'fipscode (subject to change to iso code) see geo_admin1 table. ISO codes are used for US, CH, BE and ME. UK and Greece are using an additional level between country and fips code.',
    admin2          VARCHAR(80)     COMMENT 'code for the second administrative division, a county in the US, see geo_admin2 table',
    admin3          VARCHAR(20)     COMMENT 'code for third level administrative division',
    admin4          VARCHAR(20)     COMMENT 'code for fourth level administrative division',
    population      INT,
    elevation       INT             COMMENT 'in meters',
    gtopo30         INT             COMMENT 'digital elevation model, srtm3 or gtopo30, average elevation of 3''x3'' (ca 90mx90m) or 30''x30'' (ca 900mx900m) area in meters',
    timezone        VARCHAR(40)     COMMENT 'the timezone id, see geo_timezone table',
    mod_date        DATE            COMMENT 'date of last modification in yyyy-MM-dd format',
    PRIMARY KEY (geoname_id)
) CHARACTER SET utf8;


CREATE TABLE geo_alternate_name (
    id                  INT,
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
    fips_code               VARCHAR(3)      COMMENT 'Federal Information Processing Standards code',
    name                    VARCHAR(200),
    capital                 VARCHAR(200),
    area                    DOUBLE          COMMENT 'Area in squared kilometers',
    population              INTEGER,
    continent               CHAR(2),
    tld                     CHAR(3)         COMMENT 'Top Level Domain',
    currency                CHAR(3)         COMMENT 'Currency code',
    currency_name           CHAR(20),
    phone_prefix            CHAR(10),
    postal_code_format      VARCHAR(100)    COMMENT '#=number,@=char',
    postal_code_regex       VARCHAR(255),
    geoname_id              INT,
    languages               VARCHAR(200)    COMMENT 'language codes in different standards, comma separated',
    neighbours              CHAR(100)       COMMENT 'Neighbour country codes, comma separated',
    equivalent_fips_code    CHAR(10)        COMMENT 'Additional FIPS code',
    PRIMARY KEY (iso_alpha2)
) CHARACTER SET utf8;


CREATE TABLE geo_language (
    iso_639_3       CHAR(4)         COMMENT 'ISO 639-3 code',
    iso_639_2       VARCHAR(50)     COMMENT 'ISO 639-2 code',
    iso_639_1       VARCHAR(50)     COMMENT 'ISO 639-1 code. Most commonly used code',
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
    name_ascii  TEXT,
    geoname_id  INT,
    PRIMARY KEY (code, geoname_id)
) CHARACTER SET utf8;


CREATE TABLE geo_hierarchy (
    hierarchy_id    INT NOT NULL AUTO_INCREMENT,
    parent_id       INT,
    child_id        INT,
    feature_code    VARCHAR(50)                     COMMENT 'see http://www.geonames.org/export/codes.html',
    PRIMARY KEY (hierarchy_id)
) CHARACTER SET utf8;


CREATE TABLE geo_feature (
    code        CHAR(7)         COMMENT 'see http://www.geonames.org/export/codes.html',
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
