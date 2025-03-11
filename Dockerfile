# Use an official Node.js image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for efficient caching)
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy the entire project (excluding files in .dockerignore)
COPY . .

# Expose the port the app runs on (change if needed)
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
