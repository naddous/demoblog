
# ---- Base Node ----
FROM node:alpine AS appbuild
# Copy project file
COPY . .
# Build project
#
RUN npm run build
# leverage multisgae Docker build process to creat a smaller final image 
FROM nginx
# Copy needed files
COPY nginx.config /etc/nginx/conf.d/default.conf
COPY --from=appbuild build /usr/share/nginx/html