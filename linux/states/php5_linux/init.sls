php5:
  pkg.installed:
    - name: php5
  service.running:
    - name: apache2
    - enable: True
    - reload: True
#    - watch:
#      - pkg: apache2


#    - require:
#      - pkg: php5-fpm
#      - pkg: php5-mcrypt
#      - pkg: php5-curl
#      - pkg: php5-mysql
#      - pkg: php5-cli
