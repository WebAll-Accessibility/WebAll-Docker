docker build Docker/ -t weball
docker create -v ./ --name weballcontainer weball
