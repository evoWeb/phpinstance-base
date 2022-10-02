# PHP web instance config for Portainer stacks

## Quick Start

Choose phpinstance template in portainer and add the following environment variables

```.env
APP_NAME=
INSTANCE_FOLDER=

# PHP_VERSION=8.1

# MYSQL_PORT=
MYSQL_ROOT_PASSWORD=
MYSQL_PRODUCTION_PASSWORD=
MYSQL_STAGING_PASSWORD=

# without www.
HTTP_PRODUCTION_DOMAIN=
# HTTP_PRODUCTION_ALIAS=
# relative to data/htdocs
# HTTP_PRODUCTION_ROOT=production/current/public

# without www.
HTTP_STAGING_DOMAIN=
# HTTP_STAGING_ALIAS=
# relative to data/htdocs
# HTTP_STAGING_ROOT=staging/current/public
```

## Required Variables

| Variable                  | Default | Value         | Description                                                                    |
|---------------------------|---------|---------------|--------------------------------------------------------------------------------|
| APP_NAME                  | unset   | name          | Unique per server name of the docker app consist of 54 character of a-Z_-0-9   |
| HTTP_PRODUCTION_DOMAIN    | unset   | domain        | Domain for production site. An alias with prefixed www. will always be created |
| HTTP_STAGING_DOMAIN       | unset   | domain        | Domain for staging site. An alias with prefixed www. will always be created    |
| INSTANCE_FOLDER           | unset   | absolute path | Path on the server where the instance is installed into                        |
| MYSQL_ROOT_PASSWORD       | unset   | password      | Password for the mysql root account                                            |
| MYSQL_PRODUCTION_PASSWORD | unset   | password      | Password for the mysql production database                                     |
| MYSQL_STAGING_PASSWORD    | unset   | password      | Password for the mysql staging database                                        |

## Recommended Variables

| Variable              | Default                   | Value          | Description                                                              |
|-----------------------|---------------------------|----------------|--------------------------------------------------------------------------|
| HTTP_PRODUCTION_ALIAS | unset                     | domain         | Alias domain for production site. Mostly its www.$HTTP_PRODUCTION_DOMAIN |
| HTTP_PRODUCTION_ROOT  | production/current/public | relative path  | Path to production instance files                                        |
| HTTP_STAGING_ALIAS    | unset                     | domain         | Alias domain for staging site. Mostly its www.$HTTP_STAGING_DOMAIN       |
| HTTP_STAGING_ROOT     | staging/current/public    | relative path  | Path to staging instance files                                           |
| MYSQL_PORT            | 3306                      | port number    | Port to be bound on local ip 127.0.0.1:$MYSQL_PORT                       |
| PHP_VERSION           | 8.1                       | version number | Version number so select what php version to install                     |
