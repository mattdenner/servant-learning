# servant-learning
## Purpose
Continuing my Haskell learning (see [haskell-echo](https://github.com/mattdenner/haskell-echo)), I'm 
throwing this together to test out Servant.  This is a very very very simple server that just helps
me understand a few of the core concepts: yes, I could have followed the tutorial, but I'm a bit
better at grasping things when I have my own goal.

## Building & Installing
```
$ stack build
$ stack install
```

## Running & Examples
In one terminal start the service:
```
$ servant-learning-exe
Starting server ...
```

In another you can try `curl`:
```
$ curl --silent --include http://localhost:8080/hello
HTTP/1.1 200 OK
Transfer-Encoding: chunked
Date: Mon, 25 Mar 2019 09:06:38 GMT
Server: Warp/3.2.26
Content-Type: text/plain;charset=utf-8

hello

$ curl --silent --include http://localhost:8080/goodbye\?name=\=foo
HTTP/1.1 200 OK
Transfer-Encoding: chunked
Date: Mon, 25 Mar 2019 09:07:04 GMT
Server: Warp/3.2.26
Content-Type: text/plain;charset=utf-8

goodbye foo
```
