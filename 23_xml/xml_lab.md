% XML lab

**Important references**

- [W3Schools XML tutorials](https://www.w3schools.com/xml/xml_whatis.asp)
- [LXML tutorial](https://lxml.de/tutorial.html)
- [LXML parsing](https://lxml.de/parsing.html)
- **Manpages** for utilities mentioned in class using `man` command


# Connecting

## Remote or laptop students

*Skip if on a lab machine*

[Connect to the VPN](https://dkitvpn.dkit.ie) at the beginning of this class.


## Login to the shared server

As per last week, we'll login to the shared lab server.

```bash
ssh yourname@10.200.172.60
```


# XML

[Extensible Markup Language (XML)](https://en.wikipedia.org/wiki/XML) is a markup language that defines a set of rules for encoding documents in a format that is both human-readable and machine-readable.

On a practical level it's best to think of XML as a more cumbersome and verbose substitute for JSON.


## Usage

As a document format, XML turns up on in couple of contexts:

- When stored on disk XML documents normally have the extension `.xml`.
- A significant minority of APIs provide content (or accept requests) in XML format. 


## Origins: SGML

[Standard Generalised Markup Language (SGML)](https://en.wikipedia.org/wiki/Standard_Generalized_Markup_Language) originated as a means to store and transfer US government and military documents in machine-readable form, over a timespan of several decades.
SGML uses *tags* to mark up a document.

One of the best known examples of SGML is [HTML](https://en.wikipedia.org/wiki/HTML).

For many applications, SGML became too complicated, and so XML was designed.
Apart from HTML and [Document Type Declarations](https://en.wikipedia.org/wiki/Document_type_declaration), you are unlikely to encounter SGML in its non-XML form very frequently.
XML documents themselves are valid SGML, but have additional restrictions on their layout.


# XML document structure

XML has a Directed Acyclic Graph tree structure, built from **nested** tree of **Elements** delimited by **tags**.

```xml
<?xml version="1.0" ?>
<doc>

  <!-- CLOSED ELEMENTS -->
  <!-- a closed element's content is placed between start and end tags -->
  <element_name>Content</element_name>

  <!-- for example: -->
  <artist>Nine Inch Nails</artist>


  <!-- EMPTY ELEMENTS -->
  <!-- an empty element is composed of a single tag -->
  <element_name />
  
  <!-- for example: the empty element -->
  <artist />
  <!-- is just a shorthand for -->
  <artist></artist>

  
  <!-- NESTING ELEMENTS -->

  <!-- an element may contain one or more child elements -->
  <parent>
    <child>...</child>
    <child />
    <anotherchild>...</anotherchild>
    <child>
      <grandchild>...</grandchild>
    </child>
  </parent>

  <!-- for example: -->
  <band>
    <name>Pink Floyd</name>
    <member>David Gilmour</member>
    <member>Roger Waters</member>
    <member>Nick Mason</member>
    <member>Richard Wright</member>
  </band>

</doc>
```

Elements are
**case-sensitive**.


## XML declaration

The XML declaration is always the first line of code in an XML document,
and tells the **processor** that what follows is XML. It can also
provide information about how the parser should interpret the document.

```xml
<?xml version="1.0" ?>
```

For now, the version is always 1.0. This attribute allows the program
(or person) reading the document to read older versions if
specifications change.


## Nesting rules

-   Elements nested inside a *parent* element are called *child* elements.

-   Elements must be nested correctly. Child elements must be enclosed within their parent elements.

-   All elements must be nested within a single document or root element.

-   There can be only one **root** element in a document.

-   Indentation, while helpful, is just visual.


## XML comments

Comments may appear anywhere after the declaration. The syntax for
comments is:

```xml
<!-- this is a comment -->
```

Two or more dashes should not appear one after the other in a comment.


## Free-format

XML documents are free-format. For example, the document:

```xml
<?xml version="1.0" ?><result><student>28191800</student><mark>20</mark></result>
```

is the exact same as:

```xml
<?xml version="1.0" ?>
<result>
  <student>28191800</student>
  <mark>20</mark>
</result>
```


## Attributes

An attribute is a feature or characteristic of an element. Attributes
are text strings and must be placed in single or double quotes.



### Mixing elements and attributes

Attributes and elements can be mixed:

```xml
<bookstore>
  <book category="CHILDREN">
    <title>Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
  <book category="WEB">
    <title>Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
  </book>
</bookstore>
```

As with JSON documents the structure of XML is arbitary and application-specific.
If you are designing an XML document you should do so to capture the information you want in as easy to report a format as possible.
(Though you should really be thinking about using JSON instead in my opinion!)

If you're consuming an XML document generated elsewhere you'll have to put up with the format given (unless you use something called an XSL Transform (see later!).

## Empty elements

An empty element (as distinct from not existing) can be written in two ways:

```xml
<!-- empty element written in full -->
<note></note>

<!-- shorthand for empty element -->
<note />
```


# Well-formed XML

As you're probably already aware, most JSON parsers will throw an error if a JSON document is not *well formed*.

**Discussion point:** what are the structural rules for JSON, and what happens if they're broken.

Factors leading to non-well-formed JSON:

- Writing JSON manually especially without syntax-aware editor
- Constructing JSON in code yourself as opposed to using libraries like Python's json library.

The same factors apply in the case of XML.


## Syntactic rules

When XML text satisfies the syntactic rules as laid out in the XML specification, we say that it is well-formed.
To be well formed:

1.  All XML elements must have a closing tag, except empty elements.

2.  Tags are case sensitive.

3.  All elements must be properly nested.

4.  Documents must have one single root element.

5.  Attribute values must be quoted.

6.  Certain characters must be replaced with *Entity References* (see next).


## Entity references

Entity references are used to encode character literals that could be problematic in XML: 
                         
- < (less than) `&lt;`
- (greater than) > `&gt;`
- & (ampersand) `&amp;`
- ' apostrophe `&apos;`
- " quotation mark `&quot;`


## Non well-formed XML

Non well-formed XML will cause errors in applications and parsers that expect strict XML syntax.


## Testing well-formedness

XML libraries and utilities built on them will not normally parse a document that isn't well formed.

### Powershell

### Linux / Unix

The reference utility is `xmllint`.

```bash
xmllint nameOfFile.xml
```

## Exercises

Try to fix `hits.xml` and `bathe_cat.xml`. 


# XML document design

We are going to view XML in this module as a legacy and undesirable document format, so we will not focus too much on how to design "good" XML documents.

The same overall structural considerations would apply as in the case of JSON but there are a couple of additional aspects:

- Do "list" items need an enclosing element?
- Attributes vs element content


# Reading and writing XML

As we're treating XML as a legacy format that we don't use except when forced to, these notes will largely concentrate on reading in XML rather than writing it.

## Manual editing

If you are editing XML by hand, first think "Should I be doing this?"

Next, make sure you have an editor (like emacs, VSCode) that supports syntax highlighting and well-formedness checking. 
(Later on, may be good if it can do schema checking, more complex!)


## Programmatic usage

Seriously, don't attempt to parse XML by writing your own parsing code. 

Although not as difficult, don't be tempted to write your own XML writing code either if a library exists for the language you are using.

The only exception to this rule would be if you are adapting an old piece of software written in a language lacking an XML library to output XML.
(However, you should consider if a simpler format like JSON would suffice in this instance too!)


## Powershell

Powershell (on any OS) can read XML documents in to a powershell object.
This can be navigated by the usual dot syntax in PowerShell.

```powershell
# reading an XML file on disk
$doc = [xml](Get-Content bathe_cat_solution.xml)

# then access the contents using the dot syntax
Write-Host $doc.PROCEDURE.TITLE

# can loop over multiple same-type elements in a list
foreach ( $step in $doc.PROCEDURE.INSTRUCTIONS.STEP ) {
	Write-Host $step
}
```

As you can see the conversion will be quite dependent on the original document structure, and the resulting PowerShell object structure might not make sense in all cases!


# Python XML functions

There are a number of options for dumping / loading XML in Python.
Let's start by opening a new TMUX window and running `ipython3`.

Technically there are two types of parsers (in any language):

1. Parsers that build a document object model (DOM), essentially a tree structure in memory of the document. (This is the type we'll use.)

2. Streaming parsers that trigger an action when they encounter each element. These can parse documents larger than availabile system memory. (We won't cover these.)

DOM parsers turn a text-based XML representation into an XML document structure in memory.


## Obtaining XML document

Like JSON, XML documents can originate from files, APIs or many other sources. 
To get a suitable XML document let's get Irish Rail's list of stations using their realtime API via the `requests` library in Python.

```python
# import requests library
import requests

# get content from URL
response = requests.get('https://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML')

# get text content (i.e. the XML doc)
print(response.content)
```


## Parsing XML document

I recommend the `lxml` library which has a so-called ElementTree compatible interface to its document object model.

Unlike the `json` functions in Python, it doesn't directly return a standard Python dictionary / list structure.
Instead we have to work with the functions to get the element and attribute values we need. 


```python
# import the library
from lxml import etree

# create document tree from the response content
root = etree.fromstring(response.content)
# note: need to use content (not text) attribute

# use the dynamic help to discover available methods
help(root)

```


## Navigation

Exploring is reasonably easy once you know the document structure and some important methods:

```python
# get all child nodes
stations = root.getchildren()

# can then iterate over them (Usually)
for station in stations:
	print(station)

# (new, more Pythonic) alternative: just iterate over the root object
for station in root:
	print(station)

```

The elements in each child object are then accessible in the same way.


## Finding a child element

If an element has a child element, we can get it using the `find` and `findall` methods:

```python
# get a single element from doc
station = stations.getchildren()[0]

# look at the child elements
station.getchildren()

# find the one called StationDescription
station.find('StationDesc')
desc = station.find('{*}StationDesc') # if has namespaces
```

## Getting element content

Use the `.text` attribute to get/set the text content.

```python
# get a particular station element
desc = station.find('{*}StationDesc') # if has namespaces

# get text value from the element
print(desc.text)
```


# Altering XML documents in Python

Although I've made repeated recommendations *not* to generate XML voluntarily where possible, sometimes you may want to alter a document and re-write it.
Or you may be required by management / clients to supply XML.

This is by no means exhaustive, but it should be enough to get you able to make basic modifications to an existing XML document. 

## Changing element text content

To change text content of an element, we can simply change the `text` attribute:

```python
# re-set the text attribute
station.find('{*}StationDesc').text = 'Belfast Central'
```


## Adding / deleting child elements

By example.


## Outputting XML document

Outputting an XML document requires us to get its string representation from element tree.
To do this we can use the `tostring` methods:

```python
help(etree.tostring) # for info

# XML tree as string
etree.tostring(root)

# w/ pretty printing
etree.tostring(root, pretty_print=True)

```


# XPath navigation


XPath expressions allow us to easily retrieve the contents of elements
and attributes in an XML document, by writing XPath expressions.

The XPath expression language is standardised and works similarly in
many languages - Java, C#, C++/libxml/JavaScript etc.

XPath uses **expressions** and standard **functions** to return
**nodes** that are **related** to other nodes.

Rather than laboriously going through its theory, it's easy to get started practically using the `.xpath` method in `lxml` on any Node object. 


### Nodes

In XPath, there are seven kinds of nodes:


1.  **Element**
2.  **Attribute**
3.  **Text**
4.  Namespace (see later)
5.  Processing instruction
6.  Comment (XML oddly does read comments rather than just pass over them)
7.  **Document**





### Relationships

Effective use of XPath requires a firm understanding of the
relationships present between various nodes:

- **Parent:** Each element and attribute has one parent.
- **Children:** Element nodes may have zero, one or more children.
- **Siblings:** Nodes that have the same parent.
- **Ancestors:** A node's parent, parent's parent, etc.
- **Descendants:** A node's children, children's children, etc.


### Predicates

A predicate imposes additional selectivity on which nodes to return for
a given expression, usually based on their or their child node's values.



### Axes

Axes are used to select nodes based on their relationship to other
nodes.



## Basic selection expressions

XPath uses path expressions to select nodes or node-sets in an XML
document. The node is selected by following a path or steps. The most
useful path expressions are:

-  `elementname`   all "elementname" elements
-  `/`               from root node / previous node
-  `//`              from anywhere in the document
-  `..`              parent of the current node
-  `@attribname`    attribute "attribname"
- `text()`          text content of current node


### Writing path expressions

A location path can be absolute or relative. An absolute location path
starts with a slash `/`  and a relative location path does not. In both
cases the location path consists of one or more steps, each separated by
a slash.

Each step is evaluated against the nodes in the current node-set.


# Out of scope

We won't be convering:

- Styling XML using CSS (not done really anymore).
- Using XSLT in the browser (not really done often).
- Document Type Declaration (DTD) as XML schemas cover most of these instead. Same idea.

