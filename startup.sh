echo "WebAll Docker Container"

echo "Starting MySQL..."
systemctl start mysql > /dev/null 2>&1

echo "Starting Apache Web Server..."
systemctl start apache2 > /dev/null 2>&1

if [ ! -d ./WebAll-Widget-Server ]
then
    echo "Setting MySQL root user..."
    mysql -u root < setup-files/init.sql > /dev/null 2>&1
    echo "Downloading NodeJS version manager (n)..."
    npm i -g n > /dev/null 2>&1
    echo "Downloading latest NodeJS version..."
    n latest > /dev/null 2>&1
    echo "Cleaning /var/www/html..."
    rm -rf /var/www/html > /dev/null 2>&1
    echo "Cloning WebAll Widget Server git repository..."
    git clone https://github.com/WebAll-Accessibility/WebAll-Widget-Server > /dev/null 2>&1
fi

echo "Cloning WebAll Website git repository..."
rm -rf /var/www/html > /dev/null 2>&1
git clone https://github.com/WebAll-Accessibility/WebAll-Website /var/www/html > /dev/null 2>&1
ln -s /var/www/html ./WebAll-Website

cd WebAll-Widget-Server
if [ ! -f db/created ]
then
    echo "Creating database..."
    bash setup.sh root > /dev/null 2>&1
    echo "Installing NodeJS packages..."
    cd src/
    npm i > /dev/null 2>&1
    cd ..
fi

echo "Copying ENV file to destination..."
cp ../setup-files/wws-env ./src/.env

echo "Starting Weball Widget Server..."
bash run.sh
cd ..

echo "All done!"

bash
