NETWORK_ID="12ac4a1e71a8c4ef"

echo "Starting containers..."
docker compose up -d

sleep 10

NODE_ID=$(docker exec minecraft-zerotier zerotier-cli info | awk '{print $3}')
echo "Node ID: $NODE_ID"

echo "Joining network $NETWORK_ID..."
docker exec minecraft-zerotier zerotier-cli join $NETWORK_ID
sleep 5

echo ""
echo "--- ACTION REQUIRED ---"
echo "Authorize your Node ID on the ZeroTier web console: $NODE_ID"
echo ""
read -p "Press ENTER after authorizing..."

sleep 3
ZT_IP=$(docker exec minecraft-zerotier zerotier-cli listnetworks | grep $NETWORK_ID | awk '{print $NF}' | cut -d'/' -f1)

echo ""
echo "--- SERVER READY ---"
echo "ZeroTier IP: $ZT_IP"
echo "Network ID: $NETWORK_ID"
echo ""
