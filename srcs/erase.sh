docker stop $(docker ps -qa) 2>/dev/null
docker rm $(docker ps -qa) 2>/dev/null
docker rmi -f $(docker images -qa) 2>/dev/null
docker volume rm $(docker volume ls -q) 2>/dev/null
docker network rm $(docker network ls -q) 2>/dev/null
rm -rf ~/data/*
docker-compose down
docker system prune
service docker restart
