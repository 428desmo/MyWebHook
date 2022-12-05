# Run the webhook handler

## Run the handler
```
ruby WebHookReceiver/server.rb -p 4567 -o 0.0.0.0
```

NOTE 1: The listening port 4567 is default, so it is not essential

NOTE 2: By default it binds to localhost only, so change it to bind ANY IPv4 address (0.0.0.0)

## Run the ngrok in background

```
nohup ngrok http 4567 &
```

## Setup the webhook

```
ruby setupWebHook.rb
```

NOTE 1: It sets the webhook to notify the new repository creation in the organization to the ngrok dynamic URL.

NOTE 2: The existing (old) configuration is overwritten by this script.


## How it is expected to work

1. A new repository is created in the target organization.

2. The new repository creation in the organization is notified to `WebHookReceiver/server.rb` via ngrok.

3. The handler `WebHookReceiver/server.rb` executes GitHub API with GitHub CLI `gh`, to create an issue on the target repository.

