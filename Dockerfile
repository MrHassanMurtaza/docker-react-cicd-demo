# Fetching base image
FROM node:alpine as builder

# Changing working directory
WORKDIR '/app'

# Copying package.json
COPY package.json .

# Installing packages
RUN npm install 

# Copy remaining files
COPY . . 

# build command
RUN npm run build

FROM nginx

# copying from builder phase
COPY --from=builder /app/build /usr/share/nginx/html
