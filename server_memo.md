# webhook handler development memo

# install Sinatra

## reference

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
