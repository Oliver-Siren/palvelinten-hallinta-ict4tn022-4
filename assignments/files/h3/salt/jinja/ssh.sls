# ssh with salt like before, use jinja too

openssh-server:
  pkg.installed


/etc/ssh/sshd_config:
  file.managed:
    - source: salt://jinja/sshd_config
    - template: jinja
    - context:
      port: 8888

sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
