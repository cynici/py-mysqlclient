# Bottle web server

This repo builds a web server using [bottle.py python web framework](http://bottlepy.org/docs/dev/index.html). It contains the MySQL client with Python binding and Shapely.

MySQL client is hardcoded to version 5.5 because newer releases include breaking changes in the protocol resulting in client unable to connect to pre-5.7 servers with [Error 2027 (HY000) Malformed packet](http://dba.stackexchange.com/questions/135343/server-responds-with-empty-packet-during-session-negotiation-resulting-in-client)
