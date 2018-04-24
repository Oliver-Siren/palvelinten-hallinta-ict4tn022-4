{% set username = pillar ['username'] %}

apache2:
  pkg.installed

/home/{{ username }}/public_html:
  file.directory:
    - user: {{ username }}
    - group: sudo
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - template: jinja
    - context:
      username: {{ pillar ['username'] }}

/var/www/html/index.html:
  file.managed:
    - source: salt://files/replacement.html

/home/{{ username }}/public_html/index.html:
  file.managed:
    - source: salt://files/index.html
    - template: jinja
    - context:
      id: {{ opts.id }}
      username: {{ pillar ['username'] }}
    - watch:
      - file: /home/{{ username }}/public_html

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

/etc/apache2/sites-available/public.conf:
  file.managed:
    - source: salt://files/public.conf
    - template: jinja
    - context:
      username: {{ pillar ['username'] }}

/etc/apache2/sites-enabled/public.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/public.conf

a2dissite 000-default.conf:
  cmd.run

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
