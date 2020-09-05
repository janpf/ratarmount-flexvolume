# ratarmount-flexvolume

## relevant documentation:

[openshift](https://docs.openshift.com/container-platform/3.11/install_config/persistent_storage/persistent_storage_flex_volume.html)

[leebriggs](http://leebriggs.co.uk/blog/2017/03/12/kubernetes-flexvolumes.html)

[example](https://github.com/almonteb/k8s-flexvol-archive/blob/master/archive)

[offical examples incl. yaml](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-storage/flexvolume.md)

## usage:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: dummy
spec:
  containers:
  - name: dummy
    image: nginx
    volumeMounts:
    - name: ratar
      mountPath: /data
  volumes:
  - name: ratar
    flexVolume:
      driver: "janpf/ratarmount-driver"
      readOnly: true
      options:
        archive: "/scratch/big.tar" # mandatory
        recreate-index: False # default + optional
        recursive: False # default + optional
        debug: False # default + optional # could cause issues due to printing to stdout
```

## dependencies

python:

```
click
ratarmount
```


rarely:

`[apt-get install] fuse`
