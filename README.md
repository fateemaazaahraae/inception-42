# 🌀 Inception

## 📦 1337 / 42 Project – System Administration & Docker

**Inception** is a DevOps-focused project from the 1337/42 curriculum. The goal is to design and deploy a secure, scalable, and containerized system infrastructure using only Docker and Docker Compose — without relying on pre-built images.

The project simulates a real-world DevOps environment, focusing on isolation, automation, and service orchestration.

---

## 🧠 Project Objectives

- Understand and implement the concept of containerization.
- Use Dockerfiles to build your own images for every service.
- Use Docker Compose to orchestrate multi-container applications.
- Secure and isolate services properly using Docker networks and volumes.
- Store persistent data using Docker volumes.
- Serve a WordPress website with a MariaDB database, all in containers.
- *(Bonus)* Add optional services like Redis, Adminer, FTP server, and more.

---

## 🧱 Project Architecture

The project consists of several services, each in its own container:

- **NGINX**: Acts as a reverse proxy and handles HTTPS using SSL.
- **WordPress**: A CMS served via NGINX and connected to MariaDB.
- **MariaDB**: A relational database used by WordPress.
- *(Optional Bonus)*:
  - **Redis**: Caching service to boost WordPress performance.
  - **Adminer**: Web-based DB management tool.
  - **FTP Server**, **Static website**, etc.

All services are containerized with **custom Dockerfiles** and managed via **Docker Compose**.

---

## 🔐 .env File Configuration

A `.env` file is **required** to run the project. It contains all sensitive environment variables such as usernames, passwords, and domains.

### Example `.env` content:
```env
DOMAIN_NAME=yourdomain.com

WP_DB_NAME=wordpress
WP_DB_USER=wp_user
WP_DB_PASSWORD=wp_password

DB_ROOT_PASSWORD=db_root_password

WP_ADMIN_USER=admin
WP_ADMIN_PASSWORD=admin_password
WP_ADMIN_EMAIL=admin@example.com

FTP_USER=ftpuser
FTP_PASSWORD=ftppassword

    ⚠️ Make sure not to commit this file. It contains sensitive credentials.

🚀 How to Run the Project
1. Clone the Repository

git clone https://github.com/yourusername/inception.git
cd inception

2. Create the .env File

Create a .env file in the root directory and fill in the required fields.

touch .env
# Edit it and add your configuration as shown above

3. Build and Start the Containers

docker-compose up --build

This will:

    Build all images from their Dockerfiles

    Create the required containers

    Run the infrastructure

🌐 Access the Services

After starting the project, you can access the following:

    WordPress: https://yourdomain.com

    WordPress Admin: https://yourdomain.com/wp-admin

    Adminer (if added): https://yourdomain.com/adminer

    FTP (if added): via FTP client on port 21 or 21000 depending on your setup

🧹 Clean Up

To stop and remove all containers, networks, and volumes:

docker-compose down --volumes

This also removes persistent volumes (use with caution).
🛠️ Technologies Used

    Docker

    Docker Compose

    NGINX

    WordPress

    MariaDB

    OpenSSL (for self-signed certificates)

    Bash scripting for automation

📚 Key Learning Points

    Writing custom Dockerfiles

    Using Docker Compose for orchestration

    Managing secrets with .env files

    Building services from scratch without pre-built images

    Networking and communication between containers

    Ensuring persistent storage with Docker volumes

    Automating system infrastructure setup

👨‍💻 Author

Made with ❤️ by [Your Name]
1337 / 42 Network
