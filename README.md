# Home Test API Karate Tests

## Prerequisites
- Java 21
- Maven 3.8+
- Docker image `automaticbytes/demo-app` running locally (the API should be reachable at `http://localhost:3100/api`)

## How to Run
1. Start the API (if not already running):
   ```bash
   docker run -p 3100:3100 automaticbytes/demo-app
   ```

2. From the project root, execute the Karate suite:
   ```bash
   mvn test
   ```

The tests default to `http://localhost:3100/api`. To target a different host, set the `BASE_URL` environment variable or pass `-DbaseUrl=<url>` to Maven.

> **Note:** The test suite assumes the inventory starts without an item that uses `id = "10"`. If you re-run the suite without restarting the container, restart the Docker container to restore the initial data set before executing the tests again.
