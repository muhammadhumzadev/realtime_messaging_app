echo ""
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   MessagingApp   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sudo docker rm -f messagingapp
bash setup.sh
bash docker-pull.sh
bash container-create.sh
echo "<external-ipaddress>:8000"
