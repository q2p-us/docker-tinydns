# docker-tinydns

### TinyDNS container provide:
- Simple fault tolerance
- Primitive geolocation/balancing

It is assumed for docker stack deployment and autobuild by drone

Thanks to @etix for [idea](https://blog.l0cal.com/2015/04/30/using-dns-as-a-cheap-failover-and-load-balancer/).

#### Example of data.tmpl:
```
.example.com:::300
+dynamic.example.com:{ADDRESS}:300
+static.example.com:1.2.3.4:300
```

#### Manual build, publish to gray registry and deploy as swarm service: 
```
docker build --no-cache -t 127.0.0.1:5000/tinydns ./
docker push 127.0.0.1:5000/tinydns
docker service create \
  --mode global \
  --publish mode=host,target=53,published=53,protocol=tcp \
  --publish mode=host,target=53,published=53,protocol=udp \
  --with-registry-auth --name tinydns 127.0.0.1:5000/tinydns
```
