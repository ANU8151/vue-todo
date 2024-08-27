# Multi-stage
# 1) Node image for building frontend assets
# 2) nginx stage to serve frontend assets

# Name the node stage "builder"
FROM node:latest AS builder

# Set working directory
WORKDIR /app

# Copy all files from current directory to working dir in image
COPY . .

# install node modules and build assets
RUN yarn install && yarn build


# nginx state for serving content
FROM nginx:stable-alpine

ARG USERNAME=nginx

# # Create the user
RUN groupadd -r $USERNAME && useradd --no-log-init -r -g $USERNAME $USERNAME 
    
USER $USERNAME

# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy static assets from builder stage
COPY --from=builder /app/dist .

# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
