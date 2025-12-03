echo "Stoping server..."
docker exec minecraft-server rcon-cli stop
sleep 10
docker compose down
