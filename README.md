📦 docker-node-mongo-app
A simple, production-style Dockerized Node.js application with MongoDB, built using Docker Compose. This project showcases a basic DevOps setup including containerization, multi-service orchestration, and networked services.

🧱 Project Architecture :

+------------------+       +--------------------+
|  Node.js Backend | <---> |   MongoDB Service  |
|  (Dockerized)    |       |  (Dockerized)      |
+------------------+       +--------------------+
        |                          |
        +--------------------------+
                  Docker Network


🚀 Technologies Used :
🐳 Docker & Docker Compose
⚙️ Node.js + Express
🗃️ MongoDB
🔌 Mongoose for MongoDB integration
🧰 DevOps fundamentals


📂 Folder Structure :
.
├── backend/
│   ├── Dockerfile
│   ├── package.json
│   └── index.js
├── docker-compose.yml
└── README.md


🔧 Getting Started :
1️⃣ Clone the Repository
git clone https://github.com/shiwangbisht/docker-node-mongo-app.git
cd docker-node-mongo-app

2️⃣ Run the Application
docker-compose up --build

3️⃣ Access the App
Open http://localhost:3000
You should see: "Hello from Dockerized Node.js App!"

🛠️ How It Works
Node.js container connects to MongoDB using the internal Docker network.
Docker Compose sets up both services in a single command.
MongoDB data is persisted using Docker volumes.

🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first.


## Adding teraform file to create a EC2-instance using AWS cloud provider and installing docker ##