Aria2 with webui
---
This is my fork of XUJINKAI/aria2-with-webui's docker container, which is excellent, but didn't fix my exact use case.
So I removed the file move action on download complete so that tasks containing more than one files can stay in the /data directory. I also removed the 8080 port expose for /data directory since I don't need it on a NAS server.

Only 29Mb.  
Edit config file out of the image.

### Install
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
capedium/aria2-with-webui
```
  
II. Open `http://serverip:6880/` for aria2-webui, open `http://serverip:6800/` to access the Aria2 client.  

### Build:  
`sudo docker build -f Dockerfile -t capedium/aria2-with-webui .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  
https://github.com/acgotaku/BaiduExporter  
https://github.com/XUJINKAI/aria2-with-webui
