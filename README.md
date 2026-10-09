# Oracle Order Tracking DBMS

A relational database project built with Oracle Database Free and SQL, focused on designing and querying data for an order-tracking workflow.

## Overview

This project is intended to demonstrate practical SQL and relational database skills:
- Relational data modeling for an order-tracking domain
- Writing and executing SQL queries
- Organizing database scripts
- Running Oracle Database locally with Docker
- Using Oracle SQL Developer for Visual Studio Code

**Status:** In progress. Update this README as the schema, constraints, sample data, and query collection evolve.

## Technology Stack

- Oracle Database Free
- SQL
- Docker
- Visual Studio Code with the Oracle SQL Developer extension

## Connect to the Local Database

The local development setup uses port 1521.

| Setting | Value |
| --- | --- |
| Host | localhost |
| Port | 1521 |
| Service name | FREEPDB1 |
| Username | Your configured Oracle username |
| Password | Your configured Oracle password |

Use the credentials configured for your database. Never commit passwords, connection exports containing secrets, or .env files.

If the existing container has already been created, start it with ```bash
docker start oracle-db
```

Check its status with ```bash
docker ps
```

If startup fails because port 1521 is occupied, identify the process or container using that port before changing or removing anything.

## Run SQL in VS Code

1. Start the local Oracle container.
2. Open the repository in VS Code.
3. Open a SQL script.
4. Connect to your saved Oracle connection and attach it to the active worksheet.
5. Execute the current statement or selected SQL.

If VS Code reports that the worksheet has no active connection, confirm that the connection is connected and attached to the active worksheet.

## Example Query

This query lists countries alphabetically, provided the COUNTRIES table and its columns exist in your database:

```sql
SELECT country_id, country_name
FROM countries
ORDER BY country_name;
```

## Suggested Repository Structure

As the project grows, organize SQL scripts by purpose. For example:

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

This is a suggested structure; keep names aligned with the files actually present in the repository.

## Next Steps

- Document the entity-relationship model.
- Add schema creation scripts and clearly named constraints.
- Include representative sample data.
- Add joins, aggregations, subqueries, and reporting queries.
- Document how to initialize a fresh local database.
- Add an ER diagram or screenshots when available.

## Security

Never commit real database passwords, private connection files, or other credentials. Keep secrets out of version control.

## License

No license has been specified yet. Add a LICENSE file if you want to define how others may use, modify, and distribute this project.
