FROM node:16

# Install Cypress dependencies
RUN apt-get update && apt-get install -y \
     libgtk2.0-0 \
     libgtk-3-0 \
     libnotify-dev \
     libgconf-2-4 \
     libnss3 \
     libxss1 \
     libasound2 \
     libxtst6 \
     xauth \
     xvfb \
     libgbm1

WORKDIR /usr/src/app

# Copy package.json and package-lock.json for installing dependencies
COPY package*.json ./

# Install dependencies in the container
RUN npm ci

# Copy the remaining files but not node_modules
COPY . .

# Install Cypress if not in package.json
RUN npx cypress install

CMD ["npx", "cypress", "run"]
