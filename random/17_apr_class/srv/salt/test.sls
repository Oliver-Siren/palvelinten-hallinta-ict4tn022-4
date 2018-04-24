/tmp/testi.txt:
  file.managed:
    - source: salt://testi.txt
    - template: jinja
    - context:
      muuttuja: {{ salt.cmd.run('whoami') }}


