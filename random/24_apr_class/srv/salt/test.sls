/tmp/salttest.txt:
  file.managed:
    - source: salt://files/salttest.txt
    - template: jinja
    - context:
      minion: {{ opts.id }}

/tmp/secret/topsecret.txt:
  file.managed:
    - source: salt://files/salainen.txt
    - makedirs: True
    - template: jinja
    - context:
      secretinfo: {{ pillar.get('secretinfo', "REDACTED") }}
