# DevOps Task Manager Application

## 🎯 Project Overview
Task Manager web application built with Node.js, Express, and MongoDB Atlas for COMSATS University DevOps Course (CSC483).


## 🚀 Application Features
- ✅ Create, Read, Update, Delete (CRUD) tasks
- ✅ Task status management (pending, in-progress, completed)
- ✅ Priority levels (low, medium, high)
- ✅ Task filtering and search
- ✅ Responsive web interface
- ✅ MongoDB Atlas integration
- ✅ REST API endpoints

## 🛠️ Tech Stack
- **Backend**: Node.js + Express.js
- **Database**: MongoDB Atlas (Cloud)
- **Frontend**: Vanilla JavaScript + HTML/CSS
- **Deployment**: Docker + AWS EC2

## 📋 Prerequisites
- Node.js 18+
- MongoDB Atlas account
- Docker (for deployment)

## ⚙️ Environment Setup

### Local Development
```bash
# Clone repository
git clone <your-app-repo-url>
cd devops-app-repo

# Install dependencies
npm install

# Create .env file
echo "MONGODB_URI=your_mongodb_atlas_connection_string" > .env
echo "PORT=3000" >> .env

# Start application
npm start
```

### Docker Deployment
```bash
# Build and run with Docker Compose
docker-compose up -d

# Application will be available at http://localhost:3000
```

## 🌐 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Home page |
| GET | `/api/tasks` | Get all tasks |
| GET | `/api/tasks/:id` | Get task by ID |
| POST | `/api/tasks` | Create new task |
| PUT | `/api/tasks/:id` | Update task |
| DELETE | `/api/tasks/:id` | Delete task |
| GET | `/health` | Health check |

## 🚀 AWS EC2 Deployment

### Prerequisites
- AWS EC2 instance (t3.micro or larger)
- Docker installed on EC2
- Security group allowing port 3000

### Deployment Steps
```bash
# On EC2 instance
git clone <your-app-repo-url>
cd devops-app-repo

# Deploy with Docker Compose
docker-compose up -d

# Application will be live at http://your-ec2-ip:3000
```

## 📊 MongoDB Atlas Configuration
See `MONGODB_ATLAS_CONFIG.md` for detailed database setup instructions.

## 🔗 Related Repositories
- **Test Repository**: Contains Selenium test suite for this application
- **CI/CD Pipeline**: Automated testing against live deployment

## 📝 License
Educational project for COMSATS University DevOps Course 
