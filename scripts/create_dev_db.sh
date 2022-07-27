CONTAINER_NAME="${1:-lta_bus_timings_postgres}"

echo "Starting postgres container as $CONTAINER_NAME"
docker run --name $CONTAINER_NAME -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres