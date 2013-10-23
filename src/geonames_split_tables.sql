
CREATE TABLE IF NOT EXISTS geo_city (
    geoname_id      INT PRIMARY KEY,
    name            VARCHAR(200),
    latitude        DECIMAL(10,7),
    longitude       DECIMAL(10,7),
    country_code    CHAR(2),
    admin1          VARCHAR(20),
    admin2          VARCHAR(80),
    admin3          VARCHAR(20),
    admin4          VARCHAR(20),
    population      BIGINT,
    timezone_id     VARCHAR(40)
    PRIMARY KEY (geoname_id)
) CHARACTER SET utf8;

INSERT INTO geo_city
SELECT
    g.geoname_id,
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
    g.fclass =  'P'
    AND g.fcode = 'PPL';
    # AND g.population > 2000;


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
