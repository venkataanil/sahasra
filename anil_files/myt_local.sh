#IFS=','

x=[1]
ct_mgmt=`echo ["172.17.1.160", "172.17.1.161", "172.17.1.162"]`
ct_inter=`echo ["10.131.0.10", "10.131.0.11", "10.131.0.12"]`

#echo $y
#abc='["172.17.1.160", "172.17.1.161", "172.17.1.162"]'
ct_st=(`echo $mgmt | cut -d[ -f2 | cut -d] -f1 | sed 's/[",",\,]//g'`)
ct_ir=(`echo $inter | cut -d[ -f2 | cut -d] -f1 | sed 's/[",",\,]//g'`)
echo $st
for (( i=0; i<${#ct_st[@]}; i++)); do
        echo "ip is ${ct_st[i]} ${ct_ir[i]}== "
        #echo "ovs-vsctl add-port br0 vxlan_$ip --set interface vxlan_$ip type=vxlan options:remote_ip=$ip"
done

# working one
#for ip in "172.17.1.160" "172.17.1.161" "172.17.1.162"; do

