ssh:
  pkg:
    - installed

sshd-config:
  file:
    - managed
    - name: /etc/ssh/sshd_config
    - source: salt://linux/states/ssh_linux/sshd_config
    - user: root
    - mode: 644

ssh_restart:
  cmd.run:
    - name: |
       /etc/init.d/ssh restart

