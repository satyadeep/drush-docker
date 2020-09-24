FROM satyadeep/drush-base-old
LABEL MAINTAINER="SATYADEEP G" \
      "GitHub Link"="https://github.com/satyadeep" \
      "Drush Version"="6.7.0"

# Set the Drush version.
ENV DRUSH_VERSION 6.7.0

# Install Drush using Composer.
RUN composer global require drush/drush:"$DRUSH_VERSION" --prefer-dist

# Display which version of Drush was installed.
RUN /tmp/vendor/bin/drush --version
