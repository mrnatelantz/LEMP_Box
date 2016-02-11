# LEMP Box
Vagrant box with Linux, Nginx, MySql, PHP

## Stack

- Ubuntu 14.04
- Nginx
- PHP v7
- MySql v5.5
- Nodejs (Whatever is stable in PPA)
- PHPUnit
- Composer


## Use
- Install [Vagrant](https://www.vagrantup.com/)
- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- From the terminal: Navigate to your project folder
- Clone it ``` $ git clone https://github.com/mrnatelantz/LEMP_Box.git . ```
- Start it ``` $ vagrant up ```
- It will take a minute to import the base box and run the provisioning scripts. After that it will be ready to use.
- Navigate to [http://192.168.33.10](http://192.168.33.10) you should see phpinfo() results.
- Put your app files in the site folder.
    - Web root points to ``` site/public ```.
    - In the vagrant box that will be ``` /var/www/site/public ``` .


## Nginx
- Webroot
	- Host machine ``` <project/path>/site/public ```
	Vagrant box ``` /var/www/site/public ```
- virtual host file ``` /etc/nginx/sites-available/mysite ```

## MySql
- Credentials
	- User : ``` root ```
	- Pass : ``` root ```
- Connection Example
	- ``` $ mysql -h localhost -u root -p root ``` .

## PHP
- Type ``` $ php -m ``` to see available modules.
- If you need to install another module make sure to use ``` $ php7.0-<module-name> ```
- Since we are using Nginx php7.0-fpm is installed, not php7.0

## Composer
- Composer is installed globally 
- Use ``` $ composer <command> ```

## PHPUnit
- PHPUnit is installed globally
- Use ``` $ phpunit <command> ```


## Scripts
We are just using the plain ubuntu/trusty64 box as a base, then running provising scripts to setup the server. With that said you can swap out pieces of the stack as you wish.

- Add your script to the scripts folder.
	- Make sure ``` #!/bin/bash ``` is at the top of the script, the very first line!
	- Scripts get ran as root so sudo is not needed. Keep in mind if you try to do something as a normal user (vagrant), it might not work out.
- Add your script to the Vagrant file
	- ``` config.vm.provision :shell, path: "scripts/<your-script>.sh" ``` .
- Goto vagrant docs for more help. 
	- [https://www.vagrantup.com/docs/provisioning/](https://www.vagrantup.com/docs/provisioning/)