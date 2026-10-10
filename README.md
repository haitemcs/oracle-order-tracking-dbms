# Oracle Order Tracking DBMS

An exercise-driven Oracle SQL project for practicing database exploration, querying, reporting, and database concepts against an Oracle Database Free environment. The repository is organized into topic-based SQL scripts rather than a single planned `database.sql` file.

## Repository structure

```text
oracle-order-tracking-dbms/
├── sql/
│   ├── 01_exploration/
│   ├── 02_basic_queries/
│   ├── 03_joins/
│   ├── 04_subqueries/
│   ├── 05_advanced_sql/
│   ├── 06_integrity/
│   ├── 07_metadata/
│   ├── 08_views_privileges/
│   ├── 09_transactions_recovery/
│   ├── 10_concurrency/
│   ├── 11_optimization/
│   └── mydatabase.sql
├── LICENSE
└── README.md
```

The topic directories are organized as a learning curriculum. Some scripts are still empty or unfinished, so the presence of a topic folder does not mean every topic has been implemented.

## Topics

The existing scripts currently include examples of:

- Inspecting tables and describing their columns
- Filtering and profiling data
- Handling NULL values and expressions
- Sorting results and limiting/paginating rows
- Aggregation, `GROUP BY`, and `HAVING`
- Conditional aggregation
- Formatting dates in aggregate queries

Other directories reserve space for joins, subqueries, advanced SQL, integrity constraints, metadata, views and privileges, transactions, concurrency, and query optimization as the project develops.

## Technology

- Oracle Database Free
- Oracle SQL
- Docker for the local database container
- Visual Studio Code with the Oracle SQL Developer extension

## Connect to the local Oracle database

The existing local setup has used a Docker container named `oracle-db`. If that container already exists, start it with:

```bash
docker start oracle-db
docker ps
```

If you have not created the container, create an Oracle Database Free container using the official Oracle container image and its documented setup instructions first. This repository does not currently include a `docker-compose.yml` file that creates the database automatically.

Typical connection settings for the existing local setup:

| Setting | Value |
|---|---|
| Host | `localhost` |
| Port | `1521` |
| Service name | `FREEPDB1` |
| Username | Your configured Oracle database user |
| Password | Your configured local password |

Your local credentials may differ. Do not commit passwords or private connection settings.

## Run SQL scripts in VS Code

1. Start the Oracle container.
2. Open this repository in VS Code.
3. Open a script under `sql/`.
4. Select your saved Oracle connection and attach it to the SQL worksheet.
5. Execute the selected statement or script.
6. Inspect the results and any Oracle errors.

Run scripts in the order required by their dependencies. The scripts assume that the referenced schema and tables—such as `CUSTOMERS` and `PRODUCTS`—already exist in the connected database.

## Learning approach

Each script is a small practice unit. The goal is to write queries, execute them against the database, inspect results, debug errors, and improve the SQL based on observed behavior. As more exercises are completed, this README will be updated to reflect the implemented material.

## License

Distributed under the MIT License. See [LICENSE](LICENSE).
