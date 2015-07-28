mysql-server:
  pkg.installed

service-mysql:
  service.running:
    - name: mysql
    - enable: True
