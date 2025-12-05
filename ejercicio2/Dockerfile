FROM matomo:apache

ENV PHP_MEMORY_LIMIT=512M

RUN echo "memory_limit = 512M" > /usr/local/etc/php/conf.d/zzz-matomo.ini && \
    echo "upload_max_filesize = 512M" >> /usr/local/etc/php/conf.d/zzz-matomo.ini && \
    echo "post_max_size = 512M" >> /usr/local/etc/php/conf.d/zzz-matomo.ini
