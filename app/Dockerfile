FROM node:18-alpine

WORKDIR /app

# Copy only package files first (for better caching)
COPY app/package*.json ./  

RUN npm install

# Copy rest of the app source
COPY app/. .

EXPOSE 3000
CMD ["node", "index.js"]
