FROM node

WORKDIR /app

# Optimsing! This is needed so npm install is good to run
COPY package.json /app

RUN npm install

# Copy the contents of the folder containing Dockerfile (but excluding Dockerfile) to the image work directory (/app).
# Moved this as late as possible for optimisations as all steps after a change are no longer cached
COPY . /app

# Expose port 80 to the outside world (the outside world thats outside of the container)
EXPOSE 80

# This only occurs when its a container, the image doesn't run this
CMD ["node", "server.js"]