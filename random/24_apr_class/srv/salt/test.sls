/tmp/salttest.txt:
  file.managed:
    - source: salt://files/salttest.txt
    - template: jinja
    - context:
      minion: {{ opts.id }}
