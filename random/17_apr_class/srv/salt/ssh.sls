openssh-server:
  pkg.installed

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/sshd_config
    - template: jinja
    - context:
      port: {{ pillar['portti'] }}

sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
