sudo apt-get install python-pip python-dev ngnix -y
sudo mkdir /var/www/app
cd /var/www/app
wget https://raw.githubusercontent.com/GoogleCloudPlatform/python-docs-samples/master/appengine/standard/cloudsql/main.py
wget https://raw.githubusercontent.com/GoogleCloudPlatform/python-docs-samples/master/appengine/standard/cloudsql/main_test.py
sudo pip install uwsgi 
sudo echo 'CLOUDSQL_CONNECTION_NAME=abletogcpproject:us-east1:abletogc-database' >> /etc/environment
sudo echo 'CLOUDSQL_USER=root' >> /etc/environment
sudo echo 'CLOUDSQL_PASSWORD=simpletest' >> /etc/environment
export CLOUDSQL_CONNECTION_NAME=abletogcpproject:us-east1:abletogc-database
export CLOUDSQL_USER=root
export CLOUDSQL_PASSWORD=simpletest
