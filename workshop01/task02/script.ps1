docker network create mynet

docker volume create myvol

docker run -d `
    -v myvol:/var/lib/mysql `
    --network mynet `
    --name mydb `
    stackupiss/northwind-db:v1

docker run -d `
    --network mynet `
    --name myapp `
    --env DB_HOST=mydb `
    --env DB_USER=root `
    --env DB_PASSWORD=changeit `
    -p 8080:3000 `
    stackupiss/northwind-app:v1
