# Use official Apache base image
FROM httpd:2.4

# Copy our custom webpage into Apache's web root
COPY index.html /usr/local/apache2/htdocs/index.html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Default CMD from the base image will start Apache automatically

