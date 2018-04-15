# jinja template testing etc

{% if grains['os'] == 'Ubuntu' %}
/tmp/initial.txt:
  file.managed:
    - source: salt://jinja/initial.txt
    - template: jinja
    - context:
      hilavitkutin: Jinja taitaa toimia oikein

{% endif %}
