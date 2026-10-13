# Oracle Order Tracking DBMS

A hands-on Oracle SQL portfolio project for learning database fundamentals through practical queries, schema exploration, integrity rules, triggers, transactions, concurrency, and query optimization.

The project uses an order-tracking database as its working dataset. SQL scripts are grouped by topic, with separate exercises for practicing database behavior and explaining why it works—not just memorizing syntax.

## Project goals

- Build confidence writing and debugging Oracle SQL.
- Understand how relational tables, keys, and constraints protect data.
- Practice queries that answer realistic operational and reporting questions.
- Explore database behavior involving triggers, transactions, and concurrent sessions.
- Keep the work reproducible and organized as a public learning portfolio.

## Technology

- **Database:** Oracle Database Free (local Docker container)
- **Language:** Oracle SQL and PL/SQL where required by trigger exercises
- **Tools:** Docker, Visual Studio Code with the Oracle SQL Developer extension; DBeaver can also be used
- **License:** MIT

## Repository structure

```text
oracle-order-tracking-dbms/
├── exercise_01_integrity_constraints/
│   └── exercise_01.sql
├── exercise_02_salary_trigger/
│   └── exercise_02.sql
├── exercise_03_reservation_triggers/
│   └── exercise_03.sql
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

The topic folders are a learning roadmap. Some scripts are intentionally placeholders or still in progress, so a folder or filename does not necessarily mean that topic is complete. The standalone `exercise_*` directories contain focused exercises.

## What is covered

### Implemented practice

- Exploring tables and inspecting column structure
- Filtering rows, working with expressions and `NULL` values
- Data profiling and sorting/pagination
- Aggregation with `GROUP BY` and `HAVING`
- Conditional aggregation and date formatting in reports
- Multi-table join practice (initial work)
- Integrity-constraint exercises
- Row-level trigger exercises, including salary rules and reservation-related validation/auditing concepts

### Planned or in progress

- More joins and sales analysis
- Scalar and correlated subqueries
- `CASE` expressions, analytic functions, and common table expressions (CTEs)
- Data dictionary and metadata queries
- Views and object privileges
- Transactions, savepoints, and recovery concepts
- Multi-session concurrency, locking, and isolation behavior
- Indexes and execution-plan-based optimization

This list distinguishes current practice from planned work; it is not a claim that every topic is already complete.

## Database setup

The scripts expect an Oracle database and the relevant schema/tables to exist. The main database SQL file is:

- [`sql/mydatabase.sql`](sql/mydatabase.sql)

Review the script before running it, and execute it in a suitable development schema. It may create or populate database objects, so do not run it against a database containing data you need to preserve.

### Start an existing Docker container

If you have already created the local container named `oracle-db`, start it with:

```bash
docker start oracle-db
docker ps
```

This repository does not currently include a `docker-compose.yml` that provisions Oracle automatically. For a new installation, follow Oracle's official container-image instructions to create and configure an Oracle Database Free instance first.

Typical connection settings for the existing local setup:

| Setting | Value |
|---|---|
| Host | `localhost` |
| Port | `1521` |
| Service name | `FREEPDB1` |
| Username | Your configured database user |
| Password | Your configured local password |

Your configuration may differ. Keep passwords and other private connection details out of the repository.

## Running the scripts

1. Start your Oracle Database Free instance.
2. Open the repository in VS Code or your preferred Oracle SQL client.
3. Connect to the correct service and schema.
4. Open a SQL file and read its comments and prerequisites.
5. Run the statements in the order required by the exercise.
6. Inspect the result sets, constraints, trigger behavior, and Oracle errors.
7. Reset or roll back test data when needed before repeating an exercise.

For concurrency exercises, use two separate database sessions and follow the session order in the scripts. The result can depend on when each session executes and commits or rolls back.

## Suggested learning path

1. Start with `sql/mydatabase.sql` to understand the schema and available data.
2. Work through `sql/01_exploration/` and `sql/02_basic_queries/`.
3. Continue with joins, subqueries, and advanced SQL.
4. Study the integrity-constraint and trigger exercises.
5. Move to metadata, views, privileges, and transaction handling.
6. Finish with multi-session concurrency and query optimization.

Some scripts are incomplete, so use the path as a guide rather than assuming every step is ready to run.

## Project status

This is an evolving, exercise-driven learning project. New scripts and exercises are added as topics are studied and tested. The README is intended to reflect what is present without presenting planned topics as finished implementations.

## License

Distributed under the [MIT License](LICENSE).
