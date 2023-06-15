# ratarmount-flexvolume

## usage

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: &name debug
spec:
  containers:
    - name: *name
      image: "ubuntu"
      command:
      - sleep
      - "110000000"
      volumeMounts:
      - name: &ratar_volume_name ratar
        mountPath: /data
      - name: &ceph_scratch_volume_name scratch
        mountPath: /scratch
  volumes:
  - name: *ratar_volume_name
    flexVolume:
      driver: "janpf/ratarmount-driver"
      readOnly: true
      options:
        # multiple archives can be mounted by separating them with a ";"
        archive: "zehe/archiv/uncategorized/coffee-gui.tgz;zehe/archiv/uncategorized/coffee-gui2.tgz" # mandatory.
        ceph_mount: *ceph_scratch_volume_name # reference to another volume name from which the archive will be read
        recreate-index: "false" # default: false # optional
        recursive: "false" # default: false # optional
        debug: "false" # default: false # optional
  - name: *ceph_scratch_volume_name
    cephfs:
      monitors:
      - 132.187.14.16,132.187.14.17,132.187.14.19,132.187.14.20
      user: zehe
      path: /scratch
      secretRef:
        name: ceph-secret
```

## relevant flexvolume documentation

[openshift](https://docs.openshift.com/container-platform/3.11/install_config/persistent_storage/persistent_storage_flex_volume.html)

[leebriggs](http://leebriggs.co.uk/blog/2017/03/12/kubernetes-flexvolumes.html)

[flexvolume example](https://github.com/almonteb/k8s-flexvol-archive/blob/master/archive)

[flexvolume examples incl. yaml](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-storage/flexvolume.md)

## dependencies

python:

```
click
ratarmount
```

system:

`[apt-get install] fuse fuse-zip`

`[yum install] fuse fuse-zip python3-devel zlib-devel libzstd-devel gcc-c++`
