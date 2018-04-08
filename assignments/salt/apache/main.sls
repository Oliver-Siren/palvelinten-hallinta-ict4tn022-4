apache2:
  pkg.installed

/home/xubuntu/public_html:
  file.directory:
    - user: xubuntu
    - group: sudo
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

/home/xubuntu/public_html/index.php:
  file.managed:
    - source: salt://apache/index.php
    - watch:
      - file: /home/xubuntu/public_html

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load



/var/www/html/www.vhost1.com/:
  file.directory:
    - dir_mode: 755
    - file_mode: 644

/var/www/html/www.vhost2.com/:
  file.directory:
    - dir_mode: 755
    - file_mode: 644

/var/www/html/www.vhost1.com/index.html:
  file.managed:
    - source: salt://apache/default1-index.html
    - require:
      - file: /var/www/html/www.vhost1.com/

/var/www/html/www.vhost2.com/index.html:
  file.managed:
    - source: salt://apache/default2-index.html
    - require:
      - file: /var/www/html/www.vhost2.com/


/etc/apache2/sites-available/www.vhost1.com.conf:
  file.managed:
    - source: salt://apache/www.vhost1.com.conf

/etc/apache2/sites-available/www.vhost2.com.conf:
  file.managed:
    - source: salt://apache/www.vhost2.com.conf

a2ensite www.vhost1.com.conf:
  cmd.run:
    - require:
      - file: /etc/apache2/sites-available/www.vhost1.com.conf

a2ensite www.vhost2.com.conf:
  cmd.run:
    - require:
      - file: /etc/apache2/sites-available/www.vhost2.com.conf


chown -R www-data:www-data /var/www/html/www.vhost1.com/:
  cmd.run

chown -R www-data:www-data /var/www/html/www.vhost2.com/:
  cmd.run

chmod -R 755 /var/www/html:
  cmd.run

a2dissite 000-default.conf:
  cmd.run

/etc/hosts:
  file.append:
    - name: /etc/hosts
    - text:
      - \n
      - 172.20.10.2 www.vhost1.com
      - \n
      - 172.20.10.2 www.vhost2.com

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
