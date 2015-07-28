# Apps de base

base:
  'os:debian':
    - match: grain
    - linux.states.hostname
    - linux.states.ssh_linux
    - linux.states.zabbix_agent_linux
    - linux.states.clamav-evo_linux
    - linux.states.webmin_linux
    - linux.states.Scripts-Auto-Test

	
# parti ciblage avec les grains 
webserver-lamp:
  'roles:webserver-lamp':
    - match: grain
    - linux.states.apache2_linux
    - linux.states.php5_linux
    - linux.states.mysql-server_linux
    - linux.states.openssl_linux
	
# ce state permet de copier les fichiers de configuration pour apache et IIS dans diff environnement Windows et Linux 
webserver-tuning:
  'roles:webserver-tuning':
    - match: grain
    - linux.states.webserver_tuning_linux	
	
# parti Apps de base Windows

  'os:Windows':
    - match: grain
    - win.repo.bginfo-config_windows 
    - windows.states.zabbix_windows
    - windows.states.7zip_windows
    - windows.states.git_windows
    - windows.states.iSheriff_windows




# ajouter states php 
webserver-IIS:
  'roles:webserver-IIS':
    - match: grain
    - win.repo.IIS_windows 
