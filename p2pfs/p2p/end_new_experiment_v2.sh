EXP_NUM=$1
USER="mkunal"
# KEY="/home/bw2387/.ssh/vmtorrent_key"
IPstring=`cat ../vmtorrent/p2pfs/p2p/dest_ips.txt`
IPS=' ' read -r -a array <<< "$IPstring"
# SRC_IP="10.142.0.2"

mkdir test_data_$EXP_NUM;

echo "SENDING DEST IPS";
MACHINE_NUM=1
for element in "${array[@]}"
do
    echo "$element";
    scp $USER@$element:~/\{scp_logfile_$MACHINE_NUM.txt,scp_tar_logfile_$MACHINE_NUM.txt,rsync_logfile_$MACHINE_NUM.txt,test_scripts/log_testp2p_$MACHINE_NUM.txt\} test_data_$EXP_NUM;
    let "MACHINE_NUM=MACHINE_NUM+1"
done

echo "RUNNING on SRC"
# cd test_scripts;
cp logtime.txt scp_logtime.txt scp_tar_logtime.txt rsync_logtime.txt test_data_$EXP_NUM;

