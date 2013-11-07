
CREATE TABLE geo_city (
    id              INT COMMENT "Geoname Id",
    name            VARCHAR(200)    COMMENT 'name of geographical point (utf8)',
    latitude        DECIMAL(10,7)   COMMENT 'latitude in decimal degrees (wgs84)',
    longitude       DECIMAL(10,7)   COMMENT 'longitude in decimal degrees (wgs84)',
    country_code    CHAR(2)         COMMENT 'ISO-3166 2-letter country code',
    admin1          VARCHAR(20)     COMMENT 'fipscode (subject to change to iso code) see geo_admin1 table. ISO codes are used for US, CH, BE and ME. UK and Greece are using an additional level between country and fips code. See geo_admin1 table',
    admin2          VARCHAR(80)     COMMENT 'code for the second administrative division, a county in the US. See geo_admin2 table',
    admin3          VARCHAR(20)     COMMENT 'code for third level administrative division',
    admin4          VARCHAR(20)     COMMENT 'code for fourth level administrative division',
    population      BIGINT,
    timezone_id     VARCHAR(100),   COMMENT 'the timezone id, see geo_timezone table',
    PRIMARY KEY (geoname_id)
) CHARACTER SET utf8;

INSERT INTO geo_city
SELECT
    g.id,
    g.name,
    g.latitude,
    g.longitude,
    g.country_code,
    g.admin1,
    g.admin2,
    g.admin3,
    g.admin4,
    g.population,
    g.timezone_id
FROM
    geo_geoname AS g
WHERE
    g.feature_class =  'P';


# Get administration 1 LEVEL FROM Spain
/*
SELECT gan.name, gg.*
FROM geo_geoname AS gg
    JOIN `geo_hierarchy` AS gh
        ON gg.id = gh.child_id
    JOIN `geo_alternate_name` AS gan
        ON gg.id = gan.geoname_id
        AND gan.language_code = 'es'
        AND gan.is_short = 1
WHERE gh.parent_id = 2510769
    AND gh.feature_code = 'ADM'
ORDER BY gan.name ASC
*/
