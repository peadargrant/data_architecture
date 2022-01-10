Normal forms

Required reading
================

1.  Wikipedia article on [database
    normalisation](https://en.wikipedia.org/wiki/Database_normalization).

2.  Textbook [@connolly:2015:database] Chapter 14 (Normalisation).

3.  Original paper by Codd.

Unnormalised data
=================

Normalisation
=============

@connolly:2015:database defines normalisation as:

> A technique for producing a set of relations with desirable
> properties, giving the data requirements f an enterprise.

The desireable properties are:

-   Minimise the number of attributes

-   Attributes with close logical relationship (functionally dependent)
    should be in same relation (table)

-   Minimal redundancy: data represented once, except for enabling joins
    on primary keys / foreign keys.

Benefits to minimising redundancy:

-   Minimdal redundancy means updates affect fewer attributes and
    relations meaning reduced number of operations.

-   Reduction in disk storage.

-   Avoidance of anomalies

Anomalies
=========

Redundant data causes anomalies where data manipulation operations are
not applied to all instances of the data.

Update
------

An update anomaly arises where an update does not modify all instances
of specific data, .

![Update anomaly (Wikipedia)<span
data-label="fig:update-anomaly"></span>](update_anomaly)

Insertion
---------

An insertion anomaly arises where an insert causes either nulls to be
required to create a dummy record, .

![Insertion anomaly (Wikipedia)<span
data-label="fig:insertion-anomaly"></span>](insertion_anomaly)

An insert that causes inconsistency with existing data also is
identified as an insertion anomaly.

Deletion
--------

A deletion anomaly arises where data is lost about one entity when
another entity is deleted, .

![Deletion anomaly (Wikipedia)<span
data-label="fig:deletion-anomaly"></span>](deletion_anomaly)

Functional dependency
=====================

If $A$ and $B$ are attributes of a relation $R$, $B$ functionally
depends on $A$ if every value of $A$ is associated with one value of
$B$.

-   Can say $A$ functionally determines $B$.

-   Would say $A$ is the determinant in the relationship

Full / partial functional dependency
------------------------------------

Let $A$ and $B$ be attributes of a relation $R$:

Full functional dependency

:   is where $B$ functionally depends on $A$, but not any proper subset
    of $A$.

Partial functional dependency

:   exists where $B$ functionally depends on $A$ and on one or more
    proper subsets of $A$.

Characteristics
---------------

When normalising, functional dependencies should:

1.  Have 1:1 relationship between determinant and the
    functional dependent.

2.  Hold for all time.

3.  Be full (not partial), i.e. have minimum number of attributes
    necessary

Transitive dependency
---------------------

Let $A, B, C$ be attributes of a relation $R$. Assume that $A$ isn’t
functionally dependent on $B$ or $C$.

If $A \Rightarrow B$ and $B \Rightarrow C$ then $C$ is transitively
dependent on $A$.


Primary key
===========

A primary key must be UNIQUE and NOT NULL.

Simple
------

Simple primary key is one that involves only ONE column.

Any column directly defined as a `PRIMARY KEY` will be a simple primary key.


Compound
--------

A compound key is a primary key composed of more than 1 column.


Candidate keys
==============

In practice there may be a number of possible columns and groups thereof that could be used as a primary key.
Each column or combination of columns is termed a candidate key.


Normal forms
============

1NF
---

The first normal form (1NF) requires atomic values (i.e. no repeating
groups or multi-valued attributes) in each row of a table.

Approaches to achieving:

1.  Flattening table: duplicate rows

    -   Vulnerable to anomalies

2.  Repeating groups using multiple columns

    -   Limited by number of columns

3.  Separate relations to represent repeating data

    -   Most flexible form

2NF
---

2NF requires that:

-   The relation is in 1NF

-   every non-candidate-key attribute is fully functionally dependent on
    any candidate key.

A 1NF relation will be automatically 2NF if its primary key is a simple
(non-compound key).

3NF
---

3NF requires that:

-   The relation is in both 1NF and 2NF

-   No non-candidate-key attribute is transitively dependent on any
    candidate key

A relation in 2NF can be transformed to 3NF by removing transitive
dependencies.

Boyce-Codd Normal Form
----------------------

Higher normal forms
-------------------
