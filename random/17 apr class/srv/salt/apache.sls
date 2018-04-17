apache2:
  pkg.installed

{% set muuttuja = 'oliver' %}

/home/{{ muuttuja }}/public_html:
  file.directory:
    - user: {{ muuttuja }}
    - group: sudo
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - template: jinja

/home/{{ muuttuja }}/public_html/index.html:
  file.managed:
    - source: salt://apache/index.html
    - watch:
      - file: /home/{{ muuttuja }}/public_html

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf
    - require:
      - pkg: apache2

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load
    - require:
      - pkg: apache2

a2dissite 000-default.conf:
  cmd.run

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load

