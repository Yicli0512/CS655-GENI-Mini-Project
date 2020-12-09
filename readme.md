README
=============================

Step 1 -- reserve rspec from Geni 
-----------------------------

Use the rspec in the repository.

Step 2 -- some basic configurations on client and run experiment without cache
-----------------------------

On client node, run: 

    
    sudo wget https://raw.githubusercontent.com/Yicli0512/CS655-GENI-Mini-Project/master/withoutCache_client.sh
    chmod +x withoutCache_client.sh
    sudo ./withoutCache_client.sh
If you can not change the permission of the file, just download the file from the github and upload the file to the node, then run:
  
    chmod +x withoutCache_client.sh
    sudo ./withoutCache_client.sh

Or you can run following commands directly on the client node:

    sudo apt-get update
    sudo apt-get install python-pip
    sudo apt-get install python-tk
    pip install requests
    pip install matplotlib
    sudo wget https://raw.githubusercontent.com/Yicli0512/CS655-GENI-Mini-Project/master/withoutCache.py
    python withoutCache.py


Step 3 -- some basic configurations on cache node
---------------------------

On cache node, run:

    sudo apt-get update
    sudo apt-get install trafficserver
    cd /var/run
    sudo mkdir trafficserver
    cd /etc/trafficserver/
    sudo vi records.config

Then we go into the file, move the cursor to the bottom and press ‘a’ to edit the file. Add the following sentence into the file to set up a forward proxy. The default port is 8080.

    CONFIG proxy.config.url_remap.remap_required INT 0
    CONFIG proxy.config.reverse_proxy.enabled INT 0

Then press ‘Esc’ to stop editing. And input _:wq_ to quit the file. 

Step 4 -- run experiment with cache 
---------------------------

On cache node, run the following command to start the cache server.

    cd /usr/bin
    sudo ./traffic_server start
 If you cannot acquire lock file, run the following command:

    cd /var/run/trafficserver/
    sudo rm server.lock  
Then repeat the command which starts the cache server.   

On client node, download _withCache.py_ and run it.

    sudo wget https://raw.githubusercontent.com/Yicli0512/CS655-GENI-Mini-Project/master/withCache.py
    python withCache.py
