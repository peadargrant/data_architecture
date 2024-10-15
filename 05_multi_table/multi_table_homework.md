# Homework exercise

Consider a simple task manager application using two tables for
projects, tasks (linked to projects) and notes (linked to tasks)

Projects

:   have auto-incrementing ID, name, creation timetstamp.

Tasks

:   have auto-incrementing ID, description, project, due date, creation
    timestamp, status (pending, in-progress, complete).

Notes

:   have auto-incrementing ID, task, note, creation timestamp

1.  On paper, plan out the table definitions.

    1.  Every table should have appropriate data types, NULL/NOT NULL,
        PRIMARY KEY, UNIQUE KEYs.

    2.  You should try to make use of enumerated types and domains.

    3.  Tables should be linked using foreign keys with correct ON
        DELETE / ON UPDATE behaviours chosen.

2.  Implement your design as tables.

3.  Insert test data for at least 3 projects with 3 tasks each.

4.  Create a view that encapsulates a query involving at least two
    tables and provides at least one computed column using the CASE
    clause.
