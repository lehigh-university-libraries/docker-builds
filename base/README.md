# Base

Base Docker image from which almost all others are derived. It is not meant to
be run on its own.

Built from [Islandora-DevOps/isle-buildkit base](https://github.com/Islandora-DevOps/isle-buildkit/tree/main/base)

It's based off off [debian], and includes [s6 overlay] and [confd].

## Settings

### Confd Settings

The following environment variables cannot be provided by [confd] as they drive
it's configuration, they must be set on each container as environment variables.

| Environment Variable    | Default | Description                                                                       |
| :---------------------- | :------ | :-------------------------------------------------------------------------------- |
| CONFD_BACKEND           | env     | The backend to use for `confd` only `env`, and `etcd` are supported at the moment |
| CONFD_ENABLE_SERVICE    | false   | If `true` confd will run continuously rather than just on startup.                |
| CONFD_LOG_LEVEL         | error   | The log level to use when executing `confd`                                       |
| CONFD_POLLING_INTERVAL  | 30      | Time in seconds between runs of `confd` when enabled as a service                 |

### Certificate Settings

If using development certificates for local development, they can be made
available within the containers using the following environment variables.

| Environment Variable | Default | Description                                   |
| :------------------- | :------ | :-------------------------------------------- |
| CERT_PUBLIC_KEY      |         | Public CA to add to container CA trust store. |


### Database Settings

Many services can work with multiple backends, to this end the `DB_DRIVER`
setting is used to determine which of the backend specific environment variables
to use. For example if `DB_DRIVER` is equal to `mysql` then the `DB_MYSQL_HOST`
and `DB_MYSQL_PORT` variables will be used when connecting to the backend.

| Environment Variable | Default    | Description                                                                                     |
| :------------------- | :--------- | :---------------------------------------------------------------------------------------------- |
| DB_DRIVER            | mysql      | The database driver to use by default, only `mysql` and `postgresql` are supported at this time |
| DB_HOST              |            | The database host to use. The default value is derived from `DB_DRIVER` if not specified        |
| DB_MYSQL_HOST        | mariadb    | The default database host if `DB_DRIVER` is `mysql`                                             |
| DB_MYSQL_PORT        | 3306       | The default database port if `DB_DRIVER` is `mysql`                                             |
| DB_NAME              | default    | The name of the default database if no other is specified                                       |
| DB_PASSWORD          | password   | The password of the user used by the service (e.g. Drupal) to connect to the database           |
| DB_PORT              |            | The database port to use. The default value is derived from `DB_DRIVER` if not specified        |
| DB_POSTGRESQL_HOST   | postgresql | The default database host if `DB_DRIVER` is `postgresql`                                        |
| DB_POSTGRESQL_PORT   | 5432       | The default database port if `DB_DRIVER` is `postgresql`                                        |
| DB_ROOT_PASSWORD     | password   | The root user password                                                                          |
| DB_ROOT_USER         | root       | The root user, which is used only on startup to create database / user in the chosen backend    |
| DB_USER              | default    | The user used by the service (e.g. Drupal) to connect to the database                           |

> N.B. For all of the settings above, images that descend from this image can
> apply a prefix to every setting. So for example `DB_NAME` would become
> `FCREPO_DB_NAME`. This is to allow for different settings on a per-service
> basis when sharing the same confd backend.

### Development Settings

When doing development with the containers it is sometimes useful to remap the
`uid` of users in the container to match that of the host user to prevent
permission denied errors when bind mounting files.

| Environment Variable    | Default | Description                                                                                                                       |
| :---------------------- | :------ | :-------------------------------------------------------------------------------------------------------------------------------- |
| DEVELOPMENT_ENVIRONMENT | false   | Set to `true` if using the containers for development, runs start up scripts to remap `uid` of users inside of the container etc. |
| UID                     |         | The `uid` of the host user                                                                                                        |

[debian]: https://hub.docker.com/_/debian
[bearer authentication]: https://tools.ietf.org/html/rfc6750
[confd]: https://github.com/kelseyhightower/confd
[JWT Authentication]: https://islandora.github.io/documentation/technical-documentation/jwt/
[mkcert]: https://github.com/FiloSottile/mkcert
[s6 overlay]: https://github.com/just-containers/s6-overlay
[Syn]: https://github.com/Islandora/Syn
