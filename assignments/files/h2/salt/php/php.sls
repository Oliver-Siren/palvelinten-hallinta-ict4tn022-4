libapache2-mod-php:
  pkg.installed: []
  require:
    - pkg: apache2

/etc/apache2/mods-enabled/php7.0.conf:
  file.managed:
    - source: salt://php/php7.0.conf

/etc/apache2/mods-enabled/dir.conf:
  file.managed:
    - source: salt://php/dir.conf

/var/www/html/info.php:
  file.managed:
    - source: salt://php/info.php
