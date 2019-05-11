    local_ip=`echo 172.17.1.160/24 | cut -d / -f1`
    if [ 172.17.1.170 == $local_ip ]; then
       # compute role
       for ip in ["172.17.1.160", "172.17.1.161", "172.17.1.162"]; do
           echo "ovs-vsctl add-port br0 vxlan_$ip --set interface vxlan_$ip type=vxlan options:remote_ip=$ip"
       done
    else
       # controller
       echo "local ip $local_ip"
       echo "ovs-vsctl add-port br0 vxlan_172.17.1.170 --set interface vxlan_172.17.1.170 type=vxlan options:remote_ip=172.17.1.170"
       for ip in ["172.17.1.160", "172.17.1.161", "172.17.1.162"]; do
           echo "ip --- $ip"
           if [ $ip != $local_ip ]; then
               echo "ovs-vsctl add-port br0 vxlan_$ip --set interface vxlan_$ip type=vxlan options:remote_ip=$ip"
           fi
       done
    fi

