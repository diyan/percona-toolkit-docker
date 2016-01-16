# percona-toolkit-docker
Percona Toolkit in a tiny Docker image powered by Alpine Linux

# How to use this image

Print help:
```
$ docker run --rm -ti percona-toolkit pt-query-digest --help
$ docker run --rm -ti percona-toolkit pt-variable-advisor --help
...
```

List all installed tools:
```
$ docker run --rm -ti percona-toolkit sh -c 'ls /usr/local/bin/pt-*'
```

TODO
