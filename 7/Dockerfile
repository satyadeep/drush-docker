FROM satyadeep/drush-base-old:latest
LABEL MAINTAINER="SATYADEEP G" \
      "GitHub Link"="https://github.com/satyadeep" \
      "Drush Version"="7.4.0"

# Set the Drush version.
ENV DRUSH_VERSION 7.4.0

# Install Drush using Composer.
RUN composer global require drush/drush:"$DRUSH_VERSION" --prefer-dist

# Display which version of Drush was installed.
RUN /tmp/vendor/bin/drush --version