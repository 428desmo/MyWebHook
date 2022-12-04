# webhook handler development memo

## install Sinatra

### reference

https://haronoid.hatenablog.com/entry/20100714/1279092118

```
sudo gem install sinatra 
```

```
% ruby HelloWorld/server.rb
[2022-12-04 15:11:50] INFO  WEBrick 1.4.4
[2022-12-04 15:11:50] INFO  ruby 2.6.8 (2021-07-07) [universal.arm64e-darwin21]
== Sinatra (v3.0.3) has taken the stage on 4567 for development with backup from WEBrick
[2022-12-04 15:11:50] INFO  WEBrick::HTTPServer#start: pid=39255 port=4567
```

```
% curl http://localhost:4567
Hello, world!
```


## install and run nginx

```
% brew install nginx
% nginx
% netstat -an|grep 8080
tcp4       0      0  *.8080                 *.*                    LISTEN
```

nginx will be terminated by `nginx -s stop`



## ngrok

### refrence
https://docs.github.com/en/developers/webhooks-and-events/webhooks/creating-webhooks


### sign up ngrok

https://dashboard.ngrok.com/signup

1. create account and download the zip file
2. follow the instruction for setup ngrok
   (Additionally I moved ngrok into /usr/local/bin)


## test nginx via ngrok

the corresponding URL on ngrok is found as below
```
% ngrok http 80

ngrok                                                           (Ctrl+C to quit)

Check which logged users are accessing your tunnels in real time https://ngrok.c

Session Status                online
Account                       Shibuya (Plan: Free)
Version                       3.1.0
Region                        Japan (jp)
Latency                       4ms
Web Interface                 http://127.0.0.1:4040
Forwarding                    https://9ece-122-212-17-136.jp.ngrok.io -> http://

Connections                   ttl     opn     rt1     rt5     p50     p90
                              0       1       0.00    0.00    0.00    0.00

HTTP Requests
-------------

GET /                          200 OK
```


## access Sinatra via ngrok

### run Sinatra on a terminal
```
% ruby WebHookReceiver/server.rb -p 80 -o 0.0.0.0
```

### start forwarding by ngrok
```
% ngrok http 80
``` 

