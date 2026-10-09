# Oracle Order Tracking DBMS

A practical SQL learning project built with **Oracle Database Free**. I'm using this repository to strengthen my SQL skills through hands-on practice: working directly with a real database, writing and running SQL statements, exploring the schema, and learning by doing.

The main goal is not just to store SQL notes. It is to build and inspect a database implementation, understand how its pieces work together, and gain practical experience that I can demonstrate in my software engineering portfolio.

## Why This Project Exists

I'm using this project to turn SQL concepts into practical skills. Instead of only reading about database topics, I practice them by working with the database and its SQL scripts.

The project is intended to help me learn and practice:

- **DDL (Data Definition Language):** creating and changing tables and other database objects.
- **DML (Data Manipulation Language):** inserting, updating, and deleting records.
- **Querying data:** using `SELECT`, filtering, sorting, joins, subqueries, and set operations.
- **Aggregation and reporting:** using functions such as `COUNT`, `SUM`, `AVG`, `GROUP BY`, and `HAVING`.
- **Database integrity:** primary keys, foreign keys, unique constraints, check constraints, and relationships.
- **More advanced SQL:** views, indexes, sequences, functions, procedures, triggers, and transaction handling as I work through them.
- **Database design:** understanding how tables relate and how schema choices affect data integrity and queries.
- **Debugging:** reading Oracle errors, fixing incorrect statements, and verifying results.
- **Database tooling:** connecting to Oracle, running scripts, and inspecting database objects through VS Code.

The exact topics covered will depend on the SQL statements and database objects included in the scripts.

## Inspect the SQL Work

The SQL source is the main part of this repository. I intend to include the database implementation in a committed `.sql` file so that anyone can open it on GitHub and review the actual SQL—not just screenshots or a description of the work.

The database script may contain thousands of lines. That is fine: a reviewer can browse it directly on GitHub, use the file's outline or search to navigate it, and inspect the schema, statements, and implementation.

**Planned main script:** `database.sql`

I'll create and add this file myself. Once it exists in the repository, this section can link directly to it.

When reviewing the code, the most useful things to look for are the table definitions, relationships and constraints, data operations, queries, and any advanced SQL objects included in the script.

## Technology Stack

- **Database:** Oracle Database Free
- **Language:** SQL
- **Database environment:** Docker
- **Editor:** Visual Studio Code
- **SQL tooling:** Oracle SQL Developer extension for VS Code

## Run the Database Locally

This project currently uses a local Oracle container named `oracle-db`.

Start the existing container:

```bash
docker start oracle-db
```

Check that it is running:

```bash
docker ps
```

### Connection settings

| Setting | Value |
| --- | --- |
| Host | `localhost` |
| Port | `1521` |
| Service name | `FREEPDB1` |
| Username | Your configured Oracle username |
| Password | Your configured Oracle password |

Use your own local credentials. Never put database passwords or other secrets in this repository.

### Execute SQL in VS Code

1. Start the Oracle container.
2. Open the repository in VS Code.
3. Open the SQL script.
4. Connect to your saved Oracle connection.
5. Attach the connection to the active SQL worksheet.
6. Execute the selected SQL or statement and inspect the result.

Some scripts depend on database objects being created first. Run statements in the required order and read any comments included in the script.

## Project Status

This is an ongoing learning and portfolio project. I'm building practical experience by writing, executing, reviewing, and improving SQL code.

As the work develops, this README and the repository structure will be updated to reflect what is actually implemented. The goal is to make the work easy for another developer, reviewer, or internship recruiter to inspect.

## Repository Structure

The central file will be the main SQL script. Supporting documentation can be added as needed, for example:

```text
oracle-order-tracking-dbms/
├── README.md
├── database.sql       # Main SQL implementation (to be added)
└── docs/              # Optional diagrams or notes
```

This describes the intended structure; it does not imply that files marked as planned already exist.

## Security

- Do not commit passwords, tokens, or private connection configuration.
- Do not include real personal or customer data.
- Review files before committing to ensure that credentials and other secrets are not included.

## License

No license has been added yet.
