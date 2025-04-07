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
