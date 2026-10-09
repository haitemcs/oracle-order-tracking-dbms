# Oracle Order Tracking DBMS

A hands-on relational database project for an order-tracking workflow, built with Oracle Database Free and SQL. The project is being developed to practice relational modeling, SQL querying, database constraints, and local database administration.

## Project Goals

- Model an order-tracking domain using relational tables and relationships.
- Write readable SQL queries for retrieving and summarizing data.
- Practice primary keys, foreign keys, constraints, and indexes.
- Run Oracle Database locally with Docker.
- Develop and execute SQL using Visual Studio Code and the Oracle SQL Developer extension.

> **Project status:** In progress. This README describes the project goals and local development setup; update the implementation checklist as database scripts and features are added.

## Tech Stack

- **Database:** Oracle Database Free
- **Query language:** SQL
- **Local environment:** Docker
- **SQL editor:** Visual Studio Code + Oracle SQL Developer extension

## Local Database Connection

The current local setup is configured to use the following connection details:

| Setting | Value |
| --- | --- |
| Host | `localhost` |
| Port | `1521` |
| Service name | `FREEPDB1` |
| Username | Your configured Oracle username |
| Password | Your configured Oracle password |

Use your own saved credentials. **Never commit database passwords, secret connection exports, or files containing credentials.**

### Start the existing container

If the `oracle-db` container has already been created:

```bash
docker start oracle-db
```

Check whether it is running:

```bash
docker ps
```

If startup fails because port `1521` is already in use, inspect the process or container holding that port before stopping or removing anything. Do not delete the database container or its volume as a first troubleshooting step.

## Run SQL in VS Code

1. Start the Oracle container.
2. Open this repository in VS Code.
3. Open the SQL script you want to run.
4. Connect using your saved Oracle connection.
5. Attach that connection to the active SQL worksheet.
6. Run the current statement or selected SQL.

If VS Code reports that there is no active session, verify that the connection is connected and attached to the worksheet currently open.

## Example Query

The following example lists countries alphabetically, assuming a `COUNTRIES` table with `COUNTRY_ID` and `COUNTRY_NAME` columns exists in your database:

```sql
SELECT country_id, country_name
FROM countries
ORDER BY country_name;
```

## Suggested SQL Organization

As the project expands, SQL scripts can be organized by responsibility. For example:

```text
oracle-order-tracking-dbms/
├── README.md
├── sql/
│   ├── 01_schema.sql
│   ├── 02_constraints_indexes.sql
│   ├── 03_sample_data.sql
│   └── 04_queries.sql
└── docs/
    └── er-diagram.png
```

This is a suggested structure, not a guarantee of the repository's current files. Keep the structure in sync with what is actually committed.

## Development Checklist

- [ ] Document the order-tracking requirements and entities.
- [ ] Create the relational schema and relationships.
- [ ] Add named primary-key, foreign-key, and validation constraints.
- [ ] Add representative sample data.
- [ ] Write example queries using joins, filtering, aggregation, and subqueries.
- [ ] Document how to initialize the database from a clean environment.
- [ ] Add an ER diagram and example query results.

## Security

- Do not commit passwords, tokens, or private connection configuration.
- Use local environment configuration for secrets and keep it out of version control.
- Avoid including real customer or personal data in sample records.

## License

No license has been specified. Until a license is added, others should not assume they have permission to redistribute or reuse this project.
