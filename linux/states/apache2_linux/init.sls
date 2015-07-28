apache2:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: apache2

# activation SSL 
  cmd.run:
    - name: |
          a2enmod ssl
          a2ensite default-ssl
          service apache2 restart


/etc/apache2/sites-enabled/default-ssl:
  file.managed:
    - source: salt://linux/states/apache2_linux/default-ssl

  cmd.run:
    - name: |
          cd /var/www
          rm index.html 
          sed -i '1iServerName localhost' /etc/apache2/apache2.conf
          cd /etc/apache2
          openssl req -new -x509 -days 365 -sha1 -newkey rsa:1024 -nodes -keyout server.key -out server.crt -batch
           
service-apache2:
  service.running:
    - name: apache2

