# Ansible Role: drone

This role will install drone [agents][1] + [server][2] using [docker](https://www.docker.com/)

[1]:https://docs.drone.io/administration/agents/
[2]:https://docs.drone.io/administration/server/

## Requirements

This role requires: [docker installed](https://docs.docker.com/install/) on the server

### Role Variables

Change the `drone_host_port` for expose port if conflict and update the `drone_version` from [github release page](https://github.com/drone/drone/releases).

```yml
drone_version: "latest"
drone_host_port: "8080"
```

Install the drone server or agent via the following config. Default is `false`.

```yml
drone_server_enable: "false"
drone_agent_enable: "false"
```

Default database is `sqlite` and drone can be installed with `mysql` or `postgres` database. See the followings. 

```yml
drone_database_driver: "postgres"
drone_postgres_data_dir: "/var/lib/postgresql/data"
drone_postgres_password: "drone"
drone_postgres_user: "drone"
drone_postgres_db: "drone
```

mysql database (5.7 version)

```yml
drone_database_driver: "mysql"
drone_mysql_data_dir: "/var/lib/mysql/data"
drone_mysql_password: "drone"
drone_mysql_user: "drone"
drone_mysql_db: "drone"
```

### additional parameters

The ansible role offers additional parameters - please check `defaults/main.yml` file.

## Example Playbook

import the drone role from 

```
$ ansible-galaxy install appleboy.drone
```

Add the following in playbook.

```yml
- hosts: drone
  vars_files:
    - vars/main.yml
  roles:
    - { role: appleboy.drone }
```

Inside `vars/main.yml` for `drone-server`

```yml
drone_server_enable: "true"
drone_version: "latest"
drone_server_host: "368a7a66.ngrok.io"
drone_server_proto: "https"
drone_rpc_secret: "30075d074bfd9e74cfd0b84a5886b986"
drone_github_client_id: "e2bdde88b88f7ccf873a"
drone_github_client_secret: "b0412c975bbf2b6fcd9b3cf5f19c8165b1c14d0c"
```

for drone-agent:

```yml
drone_agent_enable: "true"
drone_version: "latest"
drone_rpc_server: "http://192.168.64.2:8080"
drone_rpc_secret: "30075d074bfd9e74cfd0b84a5886b986"
```
