/etc/skel/public_html:
  file.directory

/etc/skel/public_html/index.html:
  file.managed:
    - source: salt://skelindex.html
    - require:
      - file: /etc/skel/public_html
