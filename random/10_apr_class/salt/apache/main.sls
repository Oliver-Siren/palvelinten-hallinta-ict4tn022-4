apache2:
  pkg.installed

/home/oliver/virtualhost1:
  file.directory:
    - user: oliver
    - group: sudo
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

/home/oliver/virtualhost2:
  file.directory:
    - user: oliver
    - group: sudo
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode


/home/oliver/virtualhost1/index.html:
  file.managed:
    - source: salt://apache/vhostindex1.html

/home/oliver/virtualhost2/index.html:
  file.managed:
    - source: salt://apache/vhostindex2.html

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

/etc/apache2/sites-available/virtualhost1.com.conf:
  file.managed:
    - source: salt://apache/virtualhost1.com.conf

/etc/apache2/sites-enabled/virtualhost1.com.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/virtualhost1.com.conf

/etc/apache2/sites-available/virtualhost2.com.conf:
  file.managed:
    - source: salt://apache/virtualhost2.com.conf

/etc/apache2/sites-enabled/virtualhost2.com.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/virtualhost2.com.conf

a2dissite 000-default.conf:
  cmd.run

/etc/hosts:
  file.append:
    - name: /etc/hosts
    - text:
      - 172.28.172.116 www.virtualhost1.com
      - 172.28.172.116 www.virtualhost2.com

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/sites-enabled/virtualhost1.com.conf
      - file: /etc/apache2/sites-enabled/virtualhost2.com.conf
