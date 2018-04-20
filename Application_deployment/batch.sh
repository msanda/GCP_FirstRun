sudo apt-get install python-pip python-dev python-mysqldb nginx -y
 
sudo mkdir /var/www/app
cd /var/www/app
wget https://raw.githubusercontent.com/GoogleCloudPlatform/python-docs-samples/master/appengine/standard/cloudsql/main.py
wget https://raw.githubusercontent.com/GoogleCloudPlatform/python-docs-samples/master/appengine/standard/cloudsql/main_test.py
sudo pip install uwsgi 
sudo pip install WebOb
sudo pip install Paste
sudo pip install webapp2
sudo echo 'CLOUDSQL_CONNECTION_NAME=abletogcpproject:us-east1:abletogc-database' >> /etc/environment
sudo echo 'CLOUDSQL_USER=root' >> /etc/environment
sudo echo 'CLOUDSQL_PASSWORD=simpletest' >> /etc/environment
export CLOUDSQL_CONNECTION_NAME=abletogcpproject:us-east1:abletogc-database
export CLOUDSQL_USER=root
export CLOUDSQL_PASSWORD=simpletest

./cloud_sql_proxy -instances=abletogcpproject:us-east1:abletogc-database=tcp:3306 &

sudo service nginx restart
