---
name: start-dev
description: Start the local Docker development environment, opening Docker if needed, and open the app in browser
allowed-tools: Bash(docker:*), Bash(open:*)
---

Start the local development environment:

1. **Check if Docker is running**:
   ```bash
   docker info > /dev/null 2>&1
   ```

2. **If Docker is not running, open it and wait**:
   ```bash
   open -a Docker
   ```
   - Poll `docker info` every 2 seconds until it succeeds (max 30 seconds)

3. **Build and start the services**:
   ```bash
   docker compose build
   docker compose up -d
   ```

4. **Wait for services to be ready** (3-5 seconds)

5. **Open the app in browser**:
   ```bash
   open http://localhost:8080
   ```

6. **Report status**:
   ```bash
   docker compose ps
   ```
   - Confirm services are running
   - Remind user the app is at http://localhost:8080
