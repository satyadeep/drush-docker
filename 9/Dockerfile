FROM satyadeep/drush-base
LABEL MAINTAINER="SATYADEEP G" \
      "GitHub Link"="https://github.com/satyadeep" \
      "Drush Version"="9.7.2"

# Set the Drush version.
ENV DRUSH_VERSION 9.7.2

# Install Drush using Composer.
RUN composer global require drush/drush:"$DRUSH_VERSION" --prefer-dist

# Display which version of Drush was installed.
RUN /tmp/vendor/bin/drush --version