#kubectl get nodes | grep -v kube | grep -v NAME | awk '{print $1 ".informatik.uni-wuerzburg.de";}' | xargs -I {} ssh {} "/usr/bin/env python3 -m pip install --upgrade ratarmount"
#kubectl get nodes | grep -v kube | grep -v NAME | awk '{print $1 ".informatik.uni-wuerzburg.de";}' | xargs -I {} ssh {} "mkdir -p /usr/libexec/kubernetes/kubelet-plugins/volume/exec/krause\~fusezip-driver/"
kubectl get nodes | grep -v kube | grep -v NAME | awk '{print $1 ".informatik.uni-wuerzburg.de";}' | xargs -I {} scp fusezip-driver {}:/usr/libexec/kubernetes/kubelet-plugins/volume/exec/krause\~fusezip-driver/fusezip-driver
kubectl get nodes | grep -v kube | grep -v NAME | awk '{print $1 ".informatik.uni-wuerzburg.de";}' | xargs -I {} scp ratarmount-driver {}:/usr/libexec/kubernetes/kubelet-plugins/volume/exec/janpf\~ratarmount-driver/ratarmount-driver
