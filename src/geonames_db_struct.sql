CREATE TABLE geo_geoname (
    geonameid       INT,
    name            VARCHAR(200),
    asciiname       VARCHAR(200),
    alternatenames  VARCHAR(4000),
    latitude        DECIMAL(10, 7),
    longitude       DECIMAL(10, 7),
    fclass          CHAR(1),
    fcode           VARCHAR(10),
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
    moddate         DATE,
    PRIMARY KEY (geonameid)
) CHARACTER SET utf8;


CREATE TABLE geo_alternate_name (
    alternatenameId INT,
    geonameid       INT,
    isoLanguage     VARCHAR(7),
    alternateName   VARCHAR(200),
    isPreferredName BOOLEAN,
    isShortName     BOOLEAN,
    isColloquial    BOOLEAN,
    isHistoric      BOOLEAN,
    PRIMARY KEY (alternatenameId)
) CHARACTER SET utf8;


CREATE TABLE geo_country (
    iso_alpha2       CHAR(2),
    iso_alpha3       CHAR(3),
    iso_numeric      INTEGER,
    fips_code        VARCHAR(3),
    name             VARCHAR(200),
    capital          VARCHAR(200),
    areainsqkm       DOUBLE,
    population       INTEGER,
    continent        CHAR(2),
    tld              CHAR(3),
    currency         CHAR(3),
    currencyName     CHAR(20),
    Phone            CHAR(10),
    postalCodeFormat VARCHAR(100),
    postalCodeRegex  VARCHAR(255),
    geonameId        INT,
    languages        VARCHAR(200),
    neighbours       CHAR(100),
    equivalentFipsCode CHAR(10),
    PRIMARY KEY (iso_alpha2)
) CHARACTER SET utf8;


CREATE TABLE geo_language (
    iso_639_3     CHAR(4),
    iso_639_2     VARCHAR(50),
    iso_639_1     VARCHAR(50),
    language_name VARCHAR(200),
    PRIMARY KEY (iso_639_3)
) CHARACTER SET utf8;


CREATE TABLE geo_admin1 (
    code        CHAR(6),
    name        TEXT,
    nameAscii   TEXT,
    geonameid   INT,
    PRIMARY KEY (code, geonameid)
) CHARACTER SET utf8;


CREATE TABLE geo_admin2 (
    code        CHAR(15),
    name        TEXT,
    nameAscii   TEXT,
    geonameid   INT,
    PRIMARY KEY (code, geonameid)
) CHARACTER SET utf8;


CREATE TABLE geo_hierarchy (
    hierarchyId INT NOT NULL AUTO_INCREMENT,
    parentId    INT,
    childId     INT,
    type        VARCHAR(50),
    PRIMARY KEY (hierarchyId)
) CHARACTER SET utf8;


CREATE TABLE geo_feature (
    code        CHAR(7),
    name        VARCHAR(200),
    description TEXT,
    PRIMARY KEY (code)
) CHARACTER SET utf8;


CREATE TABLE geo_timezone (
    id         INT NOT NULL AUTO_INCREMENT,
    timeZoneId VARCHAR(200),
    GMT_offset DECIMAL(3, 1),
    DST_offset DECIMAL(3, 1),
    PRIMARY KEY (id)
) CHARACTER SET utf8;


CREATE TABLE geo_continent (
    code        CHAR(2),
    name        VARCHAR(20),
    geonameid   INT,
    PRIMARY KEY (code)
) CHARACTER SET utf8;
