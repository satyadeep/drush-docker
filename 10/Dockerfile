FROM satyadeep/drush-base
LABEL MAINTAINER="SATYADEEP G" \
      "GitHub Link"="https://github.com/satyadeep" \
      "Drush Version"="10.3.4"

# Set the Drush version.
ENV DRUSH_VERSION 10.3.4

# Install Drush using Composer.
RUN composer global require drush/drush:"$DRUSH_VERSION" --prefer-dist

# Display which version of Drush was installed.
RUN /tmp/vendor/bin/drush --version
