# Use the official PHP image as the base, running on Alpine Linux for a smaller footprint
FROM php:7.4-apache

# Install necessary PHP extensions for database interaction (MySQL/MariaDB)
# 'pdo_mysql' is crucial for connecting to your MySQL database
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable the Apache Rewrite module (needed for clean URLs if you use them)
RUN a2enmod rewrite

# Copy the entire SAVVY project source code into the Apache default web directory
# The project files (HTML, CSS, JS, PHP) must be in the same directory structure 
# as your local XAMPP htdocs setup.
COPY . /var/www/html/

# Update the Apache configuration (httpd.conf) to allow .htaccess overrides
# This ensures that your application's internal routing works correctly
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Expose the standard web port (port 80)
EXPOSE 80

# The default command runs Apache in the foreground, handled by the base image
# CMD ["apache2-foreground"]