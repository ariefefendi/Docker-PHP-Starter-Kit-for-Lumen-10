# Docker PHP Starter Kit for Lumen 10
🚀 A complete Docker development environment for Lumen 10 with automated project initialization.

A production-ready Docker starter kit for Lumen 10 featuring PHP 8.2, Nginx, MySQL 8, phpMyAdmin, and Composer. Includes automated project initialization for a fast, consistent, and hassle-free development experience.

> Build your Lumen application in minutes with a complete Docker development environment.

---

# Architecture

```mermaid
flowchart LR

Browser["Browser"]

--> Nginx["NGINX"]

--> PHP["Lumen 10<br/>PHP 8.2"]

--> DB["MySQL 8"]

phpMyAdmin["phpMyAdmin"]

--> DB

# System Architecture

```mermaid
flowchart LR

    U["Developer"] -->|Browser| NGINX["NGINX<br/>Port 8082"]

    NGINX --> PHP["PHP 8.2 FPM<br/>Lumen 10"]

    PHP --> MYSQL["MySQL 8<br/>Port 3309"]

    ADMIN["phpMyAdmin<br/>Port 9092"] --> MYSQL

    PHP --> SRC["/var/www<br/>Application Source"]

    INSTALL["install_lumen10.sh"] --> PHP

    style PHP fill:#e8f5e9
    style MYSQL fill:#fff3cd
    style NGINX fill:#e3f2fd
    style ADMIN fill:#fce4ec
```

---

# Docker Container Relationship

```mermaid
flowchart TD

docker["Docker Compose"]

docker --> app["lumen-app<br/>PHP 8.2 FPM"]

docker --> nginx["lumen-nginx"]

docker --> mysql["lumen-mysql"]

docker --> pma["lumen-phpmyadmin"]

nginx --> app

app --> mysql

pma --> mysql
```

---

# Installation Flow

```mermaid
flowchart TD

A[Start Docker] --> B[Build PHP Container]

B --> C[Run install_lumen10.sh]

C --> D[Composer Create Project]

D --> E[Install Lumen 10 in /tmp]

E --> F[Copy Project to /var/www]

F --> G[Generate APP_KEY]

G --> H[Set Storage Permission]

H --> I[Lumen Ready]
```

---

# HTTP Request Flow

```mermaid
sequenceDiagram

participant User
participant Nginx
participant PHP
participant Lumen
participant MySQL

User->>Nginx: HTTP Request

Nginx->>PHP: FastCGI

PHP->>Lumen: Execute Application

Lumen->>MySQL: Query Database

MySQL-->>Lumen: Result

Lumen-->>PHP: JSON Response

PHP-->>Nginx: Output

Nginx-->>User: HTTP Response
```

---

# Project Bootstrap Flow

```mermaid
flowchart LR

Clone Repository

--> DockerCompose["docker-compose up -d --build"]

--> Containers["Containers Running"]

--> Install["bash install_lumen10.sh"]

--> Ready["Lumen Ready"]

--> Development["Start Development"]

--> API["Build REST API"]
```

---

# Docker Network

```mermaid
graph TB

subgraph lumen-net

NGINX["lumen-nginx"]

APP["lumen-app"]

MYSQL["lumen-mysql"]

PMA["lumen-phpmyadmin"]

end

Browser --> NGINX

NGINX --> APP

APP --> MYSQL

PMA --> MYSQL
```

---

# Complete Development Workflow

```mermaid
flowchart TD

A[Clone Repository]

--> B[docker-compose up -d --build]

--> C[Docker Build]

--> D[PHP 8.2]

D --> E[Nginx]

E --> F[MySQL]

F --> G[phpMyAdmin]

G --> H[Run install_lumen10.sh]

H --> I[Lumen Installed]

I --> J[Develop API]

J --> K[Test API]

K --> L[Deploy]
```


---

# Why This Docker Environment?

Unlike many Docker templates, this project focuses on providing a **stable, reproducible, and cross-platform development environment**, especially for developers working on Windows with bind-mounted volumes.

By separating the installation process into a temporary Linux directory (`/tmp`) before copying the project into the mounted workspace, the setup avoids many common issues related to file permissions and Composer extraction.

---

# Key Benefits

## Fast Project Bootstrap

Create a fully functional Lumen 10 development environment in just a few minutes.

No manual installation of PHP, Composer, MySQL, or Nginx is required on the host machine.

---

## Windows Friendly

One of the biggest challenges when using Docker Desktop on Windows is Composer performance and permission issues.

This repository solves that problem by installing Lumen inside the Linux container before synchronizing it to the mounted directory.

Benefits include:

* Faster installation
* Stable Composer execution
* No missing vendor packages
* Fewer permission errors

---

## Isolated Development Environment

Every dependency runs inside Docker containers.

This means:

* No PHP version conflicts
* No Composer conflicts
* No MySQL conflicts
* No local environment pollution

Each project can have its own isolated stack.

---

## Ready for API Development

The environment is optimized for:

* REST API
* JWT Authentication
* OAuth
* AWS SDK
* OCR Services
* Queue Workers
* Microservices

---

## Easy to Customize

Need another project?

Simply modify:

* Container names
* Database credentials
* Network name
* Exposed ports

without changing the overall architecture.

---

## Reproducible Environment

Every developer on the team uses exactly the same versions of:

* PHP
* Composer
* MySQL
* Nginx

This eliminates the classic "works on my machine" problem.

---

## Developer Friendly

Useful built-in services include:

* MySQL 8
* phpMyAdmin
* Nginx
* PHP-FPM
* Composer

Everything is managed through Docker Compose.

---

# Advantages Compared to Traditional Local Installation

| Traditional Setup         | Docker Environment |
| ------------------------- | ------------------ |
| Install PHP manually      | Included           |
| Install Composer manually | Included           |
| Install MySQL manually    | Included           |
| Install Nginx manually    | Included           |
| PHP version conflicts     | None               |
| MySQL version conflicts   | None               |
| Easy team collaboration   | ✅                 |
| One-command deployment    | ✅                 |
| Cross-platform            | ✅                 |
| Isolated environment      | ✅                 |

---

# Overall Workflow

```
Clone Repository
        │
        ▼
docker-compose up -d --build
        │
        ▼
Run install_lumen10.sh
        │
        ▼
Lumen Installed
        │
        ▼
Start Development
        │
        ▼
Build API
        │
        ▼
Deploy
```
