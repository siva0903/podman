# Containerfile
FROM ubi9:latest
MAINTAINER Tux tux@example.com
USER root
# Install
RUN dnf install httpd -y
EXPOSE 80
# Set Environment Variables
ENV HTTPD_APP_ROOT=${APP_ROOT}
HTTPD_CONFIGURATION_PATH=${APP_ROOT}/etc/httpd.d
HTTPD_MAIN_CONF_PATH=/etc/httpd/conf
HTTPD_MAIN_CONF_MODULES_D_PATH=/etc/httpd/conf.modules.d
HTTPD_MAIN_CONF_D_PATH=/etc/httpd/conf.d
HTTPD_VAR_RUN=/var/run/httpd
HTTPD_DATA_PATH=/var/www
HTTPD_DATA_ORIG_PATH=/var/www
HTTPD_LOG_PATH=/var/log/httpd
# Adjust Server Name
RUN sed -i \
's/#ServerName/ServerName/' $HTTPD_MAIN_CONF_PATH/httpd.conf
RUN sed -i \
's/www\.example\.com/localhost/g' $HTTPD_MAIN_CONF_PATH/httpd.conf
# Launch
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
