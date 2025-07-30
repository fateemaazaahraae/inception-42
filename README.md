# 🌀 Inception

## 📦 1337 / 42 Project - System Administration & Docker

Inception is a **DevOps-oriented project** where the goal is to build a full containerized infrastructure using **Docker**. The project emphasizes learning about system architecture, service isolation, automation, and orchestration — all while using **only raw Dockerfiles** (no pre-built images!).

---

## 🧠 Project Goals

- Understand the concept of containerization.
- Deploy multiple Docker containers with proper networking.
- Ensure services like WordPress, NGINX, MariaDB, Redis, and others run in isolated environments.
- Use Docker Compose for orchestration.
- Practice system configuration and secure container communication.
- Automate everything from build to deployment.

---

## 🗂️ Architecture Overview

Your system will consist of multiple Docker containers, such as:

- **NGINX**: Reverse proxy for WordPress with SSL.
- **WordPress**: CMS connected to the database.
- **MariaDB**: Relational database server.
- *(Optional: Redis, Adminer, FTP server, etc.)*

Each container is custom-built using **Dockerfiles**, following strict rules from the project.

---

## ⚙️ Requirements

Before running the project, ensure you have the following installed:

- Docker
- Docker Compose
- GNU Make (optional but useful)
- `.env` file (required)

---

## 🔐 .env File

You must create a `.env` file at the root of the project. It contains sensitive configuration like:

