# meteorite-api-scripts

This repository contains two Bash scripts that retrieve and process data from NASA's Meteorite Landings API.

## Included Scripts

### task1_massive_meteorite.sh

- Downloads the full meteorite dataset using pagination (handling more than 45,000 entries).
- Identifies the most massive meteorite.
- Displays the most frequent year based on meteorite impact dates.

### task2_meteorites_prague.sh

- Queries meteorite landings within a 50 km radius of Prague (coordinates: 50.08804, 14.42076).
- Outputs the number of results found.
- Sorts and lists meteorite names by year of impact.

## Requirements

To run the scripts, you need the following installed:

- `bash`
- `curl`
- `jq`

## How to Run

Open a terminal and run:

```bash
bash task1_massive_meteorite.sh
bash task2_meteorites_prague.sh

## Jenkins CI/CD Pipeline

The repository includes a `Jenkinsfile` that defines a basic CI/CD pipeline.

### Pipeline Stages:

1. **Verify Scripts Exist**  
   Ensures that both Bash scripts are present.

2. **Run Scripts**  
   Executes `task1` and `task2` scripts as part of a test run.

3. **Package Scripts**  
   Compresses both scripts into a ZIP artifact.

4. **Simulate Deployment**  
   Simulates a deployment by copying the artifact into `/tmp/meteorite-app/`.

### Notes:

- The pipeline is written in Declarative Jenkins syntax (Groovy).
- It can be executed by a Jenkins pipeline job connected to this repository.
- It does not deploy to a real environment, but simulates the process for educational purposes.

## Requirements

To run the scripts locally, you need:

- bash
- curl
- jq
- unzip (for simulated deployment)

## How to Run Locally

```bash
bash task1_massive_meteorite.sh
bash task2_meteorites_prague.sh
bash deploy.sh  # Optional simulation of deployment
