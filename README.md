# Automate Apache website creation and WordPress Deployment 
This is just a demo project to automate folowing 2 System Administrator's tasks  

# 1 - Add new website configuration in existing Apache web server
As this project have 2 files; 1st is template.conf and 2nd is apacheconfig.sh
just pass 2 arguments domainname and email address (./apacheconfig.sh abc.com xyz@abc.com) and this script will create apache configuration and apply SSL certificate from Let's encrypt.   

# 2 - Create website root directory
Also it will create website's root directory and download WordPress. Once eveything will be successful it will show WordPress installation page.

