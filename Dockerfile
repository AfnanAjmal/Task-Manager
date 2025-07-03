# DevOps Task Manager - Dockerfile
# COMSATS University - Spring 2025 - CSC483 DevOps Assignment
# Student: Afnan Ajmal | Instructor: Qasim Malik

# Use official Node.js LTS runtime as base image
FROM node:18-alpine

# Set metadata labels
LABEL maintainer="afnanajmal03@gmail.com"
LABEL description="DevOps Task Manager Web Application for COMSATS University Assignment"
LABEL course="CSC483 - Topics in Computer Science II (DevOps)"
LABEL semester="Spring 2025"
LABEL instructor="Qasim Malik"
LABEL student="Afnan Ajmal"

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY app/package*.json ./

# Install Node.js dependencies
RUN npm ci --only=production && npm cache clean --force

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodeuser -u 1001

# Copy application source code
COPY app/ .

# Change ownership of application files to non-root user
RUN chown -R nodeuser:nodejs /usr/src/app

# Switch to non-root user
USER nodeuser

# Expose port 3000
EXPOSE 3000

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Health check to ensure container is running properly
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "const http = require('http'); http.get('http://localhost:3000/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1); }).on('error', () => { process.exit(1); });"

# Command to run the application
CMD ["npm", "start"]

# Build instructions:
# docker build -t devops-task-manager .
# docker run -p 3000:3000 -e MONGODB_URI=mongodb://host.docker.internal:27017/devops_tasks devops-task-manager 