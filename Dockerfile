FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Step 1: Install dependencies and Nginx 1.18
RUN apt-get update && apt-get install -y \
    curl gnupg2 lsb-release ca-certificates systemctl procps nginx=1.18.* && \
    nginx -v

# Step 2: Backup existing Nginx config
RUN cp -r /etc/nginx /etc/nginx-backup

# Step 3: Add Nginx GPG key properly
RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | \
    gpg --dearmor -o /usr/share/keyrings/nginx-archive-keyring.gpg

# Step 4: Add Nginx mainline repository (signed)
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/mainline/ubuntu $(lsb_release -cs) nginx" | \
    tee /etc/apt/sources.list.d/nginx.list

# Step 5: Install specific version (1.25.*)
# Run `apt-cache madison nginx` to verify available versions if needed
RUN apt-get update && apt-get install -y nginx=1.25.* && \
    nginx -v

# Step 6: Expose port and run Nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
