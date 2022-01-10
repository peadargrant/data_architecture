% E-R modelling

Required reading
================

1.  Wikipedia articles on [Entity-Relationship
    models](https://en.wikipedia.org/wiki/Entity_relationship_model).

2.  Textbook [@connolly:2015:database] chapters 12 (ER).

E-R models
==========

An Entity-Relationship Model represents the data requirements for a
system. It is important to note that ER models are a tool, not a rule.
Just like language, the same system may be adequately described by
multiple differing ER models which are all equally valid.

Diagrammatic forms
------------------

An Entity-Relationship Diagram is a visual presentation of the
entity-relationship model for a system. There are several different
styles of diagram used:

Crow’s foot

:   named due to similarity of the “many” symbol to a bird’s foot.

Unified Modelling Language (UML)

:   used in non-database

The one we will study is the “crow’s foot” notation.

Synthesis
---------

Synthesis is the transformation of an ER diagram to a relational (or
other) database or a combination of persistence technologies. Some
specific items need to be dealt with the context of synthesising ER
diagrams to relational databases.

Entities
========

Entitiy types and their occurrence are defined by
[@connolly:2015:database] as:

Entity type:

:   A group of objects with the same properties, wwhich are identified
    by the enterprise as having an independent existence.

Entity occurrence:

:   A uniquely identifiable object of an entity type.

Often use “Entity” for both type and occurrence, although ambiguous,
where meaning is obvious. Entities are represented by boxes in ER
diagrams.

![Entities as boxes<span
data-label="fig:entities-as-boxes"></span>](entities_as_boxes)

Attributes
==========

[@connolly:2015:database] defines attribute types as:

Attribute type:

:   a property of an entity type or relationship type.

Attribute domain:

:   set of allowable values for attribute.

Simple / complex attributes
---------------------------

Simple attribute

:   composed of single component with independent existence
    (e.g postcode)

Composite attribute

:   composed of multiple components, each with independent existence.
    (e.g. address)

Single / multi-valued attributes
--------------------------------

Derived attributes
------------------

Keys
----

Relationships
=============

Entities are linked together by relationships. A relationship is an
association between two entities that is important to the system of
interest. [@connolly:2015:database] define relationship types and their
occurences as:

Relationship type

:   A set of meaningful associations among entity types

Relationship occurrence

:   A uniquely identifiable association that includes one occurrence
    from each participating entity type.

Often use “Relationship” for both type and occurrence, although
ambiguous, where meaning is obvious.

Representation of a relationship
--------------------------------

Relationships between entities are represented in an E-R diagram by a
line connecting both entities. It can sometimes be helpful to write the
verb beside the line, but it’s not required. Also if the verb makes
sense in one direction, an arrow is drawn from subject to object.

![Relationship<span data-label="fig:relationship"></span>](relationship)

Degree of Relationship
----------------------

The degree of a relationship type is the number of participating entity
types in a relationship [@connolly:2015:database].

Binary relationship

:   has exactly 2 participating entities.

Complex relationship

:   has degree greater than 2.

Cardinality
-----------

The cardinality of a relationship specifies how many related entity
occurrences that an entity occurrence maps to, such as:

  **Abbreviation**   **Meaning**
  ------------------ --------------
  1:m                One-to-Many
  m:1                Many-to-one
  1:1                One-to-one
  m:n                Many-to-many

  : Cardinalities<span data-label="tab:cardinalities"></span>

Symbols for drawing cardinalities are shown in :

![Representation of cardinality in Crow’s Foot notation<span
data-label="fig:crows-foot-cardinality"></span>](crows_foot_cardinality)

If a NULL is allowed on one side of the relationship, then the minimum
cardinality is zero on the other side. The relationship becomes
zero-or-one-to-many, or zero-or-many-to-one etc.

![Cardinality zero<span
data-label="fig:cardinality-zero"></span>](cardinality_zero)

Synthesising m:n relationships
------------------------------

Many-to-many relationships can’t be directly implemented on a relational
database. Instead, they have to be decomposed into two simpler
relationships and a new entity has to be created:

1.  Introduce a new linking entity.

2.  Form two 1:m relationships.

![Synthesis of many-to-many relationship<span
data-label="fig:synthesising-many-to-many"></span>](synthesising_many_to_many)

Implementation
--------------

Roughly speaking:

-   Entities become tables

-   Attributes become columns

-   1-to-many / Many-to-1 Relationships are represented as foreign keys.
    The foreign key is set on the “many” table pointing to the
    “1” table.

Relationship participation
--------------------------

Participation determines “whether all or only some entity occurrences
particiate in a relationship”. In this respect a relationship can be
optional, mandatory or contingent.

### Optional

An optional relationship is one where the minimum cardinality on both
sides is zero.

Consider a car dealership:

-   A customer may exist without a car. There may be customers on the
    books who have not purchased, but may purchase at a later date.

-   A car may exist without a customer. There are cars that have not
    been purchased yet.

### Mandatory

A mandatory relationship is one where the minimum cardinality on both
sides is 1. For example, a doctor must have patients and patients must
have a doctor.

### Contingent

A contingent relationship is one where:

1.  On one side, the minimum cardinality is zero.

2.  On the other side, the minimum cardinality is one.

Consider a trading business: A sales order must be associated with a
customer, but at any point in time there may be no outstanding sales
orders for some customers.

Exclusive relationship
----------------------

An exclusive relationship is said to exist when the existence of one
relationship precludes the existence of another.

For example, a patient may not be a patient in a ward and a patient in
the outpatient department.

![Exclusive relationship<span
data-label="fig:exclusive-relationship"></span>](exclusive_relationship)

Recursive relationship
----------------------

Relationship where same entity type participates more than once
[@connolly:2015:database].

![Recursive relationship<span
data-label="fig:recursive-relationship"></span>](recursive_relationship)

E-R model issues
================

Fan traps
---------

Chasm traps
-----------


