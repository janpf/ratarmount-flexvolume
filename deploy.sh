#kubectl get nodes | grep -v kube | grep -v NAME | awk '{print $1 ".informatik.uni-wuerzburg.de";}' | xargs -I {} ssh {} "/usr/bin/env python3 -m pip install --upgrade ratarmount"
kubectl get nodes | grep -v kube | grep -v NAME | awk '{print $1 ".informatik.uni-wuerzburg.de";}' | xargs -I {} scp ratarmount-driver {}:/usr/libexec/kubernetes/kubelet-plugins/volume/exec/janpf\~ratarmount-driver/ratarmount-driver
scp fusezip-driver ulmo.informatik.uni-wuerzburg.de:/usr/libexec/kubernetes/kubelet-plugins/volume/exec/krause\~fusezip-driver/fusezip-driver
