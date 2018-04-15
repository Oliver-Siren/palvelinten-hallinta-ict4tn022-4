# jinja for/in loop

{% for tiedosto in ['first.txt', 'second.txt', 'third.txt', 'fourth.txt'] %}

/tmp/fool/{{ tiedosto }}:
  file.managed:
    - source: salt://jinja/fool.txt
    - makedirs: True
    - template: jinja
    - context:
      file: {{ tiedosto }}

{% endfor %}
