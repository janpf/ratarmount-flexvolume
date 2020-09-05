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
  name: debug
spec:
  containers:
    - name: debug
      image: "ubuntu"
      command:
      - sleep
      - "110000000"
      volumeMounts:
      - name: ratar
        mountPath: /data
      - name: scratch
        mountPath: /scratch
  volumes:
  - name: ratar
    flexVolume:
      driver: "janpf/ratarmount-driver"
      readOnly: true
      options:
        archive: "zehe/archiv/uncategorized/coffee-gui.tgz" # mandatory
        ceph_mount: "scratch" # reference to another volume name from which the archive will be read
        # FIXME: is it False or false?
        recreate-index: "false" # default + optional
        recursive: "false" # default + optional
        debug: "false" # default + optional # could cause issues due to printing to stdout
  - name: scratch
    cephfs:
      monitors:
      - 132.187.14.16,132.187.14.17,132.187.14.19,132.187.14.20
      user: zehe
      path: "/scratch"
      secretRef:
        name: ceph-secret-zehe-hadoop
  nodeSelector:
    kubernetes.io/hostname: vana
```

## dependencies

python:

```
click
ratarmount
```


system:

`[apt-get install] fuse`
