#web:
#  pkg:
#  {% if grains.os_family == 'Debian' %}
#  {% set name = 'apache2' %}
#  {% elif grains.os_family == 'Windows' %}
#  {% set name = 'Web-Server' %}
#  {% endif %}
#     - installed

{% if grains["os"] == 'Windows' %}
copy_win_index.php:
  file.managed:
    - source: salt://linux/states/apache2_linux/index.php
    - name: C:/inetpub/wwwroot/index.php
  cmd.run:
    - name: |
        iisreset /noforce hostname

{% elif grains["os"] == 'Debian' %}

copy_linux_index.php:
  file.managed:
    - source: salt://linux/states/apache2_linux/index.php
    - name: /var/www/index.php

  cmd.run:
    - name: |
        cd /var
#        rm index.html

{% endif %}
     

