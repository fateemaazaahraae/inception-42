<body>

<h1>🌀 Inception</h1>

<h2>📦 1337 / 42 Project – System Administration & Docker</h2>

<p><strong>Inception</strong> is a DevOps-focused project from the 1337/42 curriculum. The goal is to design and deploy a secure, scalable, and containerized system infrastructure using only Docker and Docker Compose — without relying on pre-built images.</p>

<p>The project simulates a real-world DevOps environment, focusing on isolation, automation, and service orchestration.</p>

<hr />

<h2>🧠 Project Objectives</h2>
<ul>
  <li>Understand and implement the concept of containerization.</li>
  <li>Use Dockerfiles to build your own images for every service.</li>
  <li>Use Docker Compose to orchestrate multi-container applications.</li>
  <li>Secure and isolate services properly using Docker networks and volumes.</li>
  <li>Store persistent data using Docker volumes.</li>
  <li>Serve a WordPress website with a MariaDB database, all in containers.</li>
  <li><em>(Bonus)</em> Add optional services like Redis, Adminer, FTP server, and more.</li>
</ul>

<hr />

<h2>🧱 Project Architecture</h2>
<p>The project consists of several services, each in its own container:</p>
<ul>
  <li><strong>NGINX</strong>: Acts as a reverse proxy and handles HTTPS using SSL.</li>
  <li><strong>WordPress</strong>: A CMS served via NGINX and connected to MariaDB.</li>
  <li><strong>MariaDB</strong>: A relational database used by WordPress.</li>
  <li><strong>(Optional Bonus)</strong>:
    <ul>
      <li>Redis: Caching service to boost WordPress performance.</li>
      <li>Adminer: Web-based DB management tool.</li>
      <li>FTP Server, Static website, etc.</li>
    </ul>
  </li>
</ul>

<hr />

<h2>🔐 .env File Configuration</h2>
<p>A <code>.env</code> file is <strong>required</strong> to run the project. It contains all sensitive environment variables such as usernames, passwords, and domains.</p>

<h3>Example <code>.env</code> content:</h3>
<pre><code>DOMAIN_NAME=yourdomain.com

WP_DB_NAME=wordpress
WP_DB_USER=wp_user
WP_DB_PASSWORD=wp_password

DB_ROOT_PASSWORD=db_root_password

WP_ADMIN_USER=admin
WP_ADMIN_PASSWORD=admin_password
WP_ADMIN_EMAIL=admin@example.com

FTP_USER=ftpuser
FTP_PASSWORD=ftppassword
</code></pre>

<blockquote>
  ⚠️ Make sure <strong>not to commit</strong> this file. It contains sensitive credentials.
</blockquote>

<hr />

<h2>🚀 How to Run the Project</h2>

<h3>1. Clone the Repository</h3>
<pre><code>git clone https://github.com/fateemaazaahraae/inception-42.git
cd inception-42
</code></pre>

<h3>2. Create the <code>.env</code> File</h3>
<pre><code>touch .env
# Edit it and add your configuration as shown above
</code></pre>

<h3>3. Build and Start the Containers</h3>
<pre><code>make
</code></pre>

<p>This will:</p>
<ul>
  <li>Build all images from their Dockerfiles</li>
  <li>Create the required containers</li>
  <li>Run the infrastructure</li>
</ul>

<hr />

<h2>🌐 Access the Services</h2>
<ul>
  <li><strong>WordPress</strong>: <code>https://yourdomain.com</code></li>
  <li><strong>WordPress Admin</strong>: <code>https://yourdomain.com/wp-admin</code></li>
  <li><strong>Adminer</strong> (if added): <code>http://yourdomain.com:adminerport</code></li>
  <li><strong>Static website</strong> (if added): <code>http://yourdomain.com:staticwebsiteport</code></li>
  
</ul>

<hr />

<h2>🧹 Clean Up</h2>
<p>To stop and remove all containers, networks, and volumes:</p>
<pre><code>make fclean --> (docker-compose down -v)
</code></pre>
<p><em>This also removes persistent volumes (use with caution).</em></p>

<hr />

<h2>🛠️ Technologies Used</h2>
<ul>
  <li>Docker</li>
  <li>Docker Compose</li>
  <li>NGINX</li>
  <li>WordPress</li>
  <li>MariaDB</li>
  <li>OpenSSL (for self-signed certificates)</li>
  <li>Bash scripting for automation</li>
</ul>

<hr />

<h2>📚 Key Learning Points</h2>
<ul>
  <li>Writing custom Dockerfiles</li>
  <li>Using Docker Compose for orchestration</li>
  <li>Managing secrets with <code>.env</code> files</li>
  <li>Building services from scratch without pre-built images</li>
  <li>Networking and communication between containers</li>
  <li>Ensuring persistent storage with Docker volumes</li>
  <li>Automating system infrastructure setup</li>
</ul>

<hr />

<h2>👨‍💻 Author</h2>
<p>Made with ❤️ by <strong>Fatima Zahrae Bazaz (fbazaz)</strong><br />
1337 / 42 Network</p>


</body>
