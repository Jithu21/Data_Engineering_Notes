# Python Fundamentals — My Learning Notes

## Overview
#### Date : 17 Aug, 18 Aug and 19 Aug

These are my Python learning notes from my initial learning phase.

The goal is to build a strong Python foundation before moving into advanced concepts and applying Python to Data Engineering.

---

## Topics Covered

### 1. What is Python?

Python is a high-level, general-purpose programming language used to give instructions to a computer.

Computers ultimately execute instructions at the machine level, represented internally using binary (`0` and `1`).

Python allows us to write instructions in a human-readable way instead of directly writing machine-level instructions.

---

### 2. Variables

A variable is a **name/reference that points to an object**.

```python
name = "Hari"
```

Here:

```text
name → variable/reference
"Hari" → string object
```

The object has an identity, which can be checked using:

```python
id(name)
```

**Key point:**

> A variable is a name/reference that points to an object. The object has a value and an identity.

---

### 3. Data Types

Python provides different data types to represent different kinds of values.

- `int` — Integer
- `float` — Decimal values
- `str` — Text
- `bool` — `True` / `False`

---

### 4. Type Casting

Type casting means converting a value from one data type to another.

```python
age = "30"
age = int(age)
```

Common type casting functions:

```python
int()
float()
str()
bool()
```

---

### 5. Naming Rules & Reserved Keywords

Python has specific rules for naming variables.

#### Naming Rules

- Can contain letters, numbers and `_`
- Cannot start with a number
- Cannot contain spaces
- Python is case-sensitive
- Cannot use reserved keywords

Examples of reserved keywords:

```text
if
else
for
while
class
def
return
import
True
False
None
```

Example:

```python
if = 10
```

This is invalid because `if` is a Python reserved keyword.

---

### 6. Collection Data Types

Python provides different collection data types for storing multiple values.

#### List

```python
fruits = ["apple", "banana", "orange"]
```

- Ordered
- Mutable
- Allows duplicate values

#### Tuple

```python
numbers = (10, 20, 30)
```

- Ordered
- Immutable
- Allows duplicate values

#### Set

```python
numbers = {10, 20, 30}
```

- Stores unique values
- Duplicate values are removed

#### Dictionary

```python
student = {
    "name": "Hari",
    "age": 30
}
```

- Stores data as **key-value pairs**

### Quick Comparison

| Collection | Syntax | Main Concept |
|---|---|---|
| List | `[]` | Ordered and mutable |
| Tuple | `()` | Ordered and immutable |
| Set | `{}` | Unique values |
| Dictionary | `{key: value}` | Key-value pairs |

---

### 7. f-Strings

f-Strings are used to insert variables directly into a string.

```python
name = "Hari"
age = 30

print(f"My name is {name} and I am {age} years old.")
```

Output:

```text
My name is Hari and I am 30 years old.
```

**Why use f-Strings?**

They make formatted output easier to write and read.

---

### 8. Multiple Inputs

Multiple values can be taken from the user using `input()` and `split()`.

```python
a, b = input("Enter two numbers: ").split()
```

For integer values:

```python
a, b = map(int, input("Enter two numbers: ").split())
```

The `split()` method separates the input into multiple parts, usually using spaces.

For example, if the user enters:

```text
10 20
```

`split()` produces:

```python
["10", "20"]
```

Then `map(int, ...)` converts each value from a string to an integer:

```text
"10" → 10
"20" → 20
```

Finally:

```text
a = 10
b = 20
```

---

### 9. Operators

Operators are symbols or keywords used to perform operations on values.

#### Arithmetic Operators

Used for mathematical calculations.

```text
+   Addition
-   Subtraction
*   Multiplication
/   Division
//  Floor Division
%   Modulus
**  Exponent
```

#### Comparison Operators

Comparison operators compare two values and return a **Boolean result: `True` or `False`**.

```python
a = 10
b = 20

print(a == b)   # False
print(a < b)    # True
print(a > b)    # False
print(a != b)   # True
```

| Operator | Meaning | Result |
|---|---|---|
| `==` | Equal to | `True` / `False` |
| `!=` | Not equal to | `True` / `False` |
| `>` | Greater than | `True` / `False` |
| `<` | Less than | `True` / `False` |
| `>=` | Greater than or equal to | `True` / `False` |
| `<=` | Less than or equal to | `True` / `False` |

**Key point:**

> Comparison operators compare values and return a Boolean result (`True` or `False`).

#### Logical Operators

Used to combine or reverse conditions.

```text
and
or
not
```

Example:

```python
age = 25

print(age > 18 and age < 60)
```

Output:

```text
True
```

#### Assignment Operators

Used to assign or update values.

```text
=
+=
-=
*=
/=
```

Example:

```python
x = 10
x += 5

print(x)
```

Output:

```text
15
```

---

## 19 Aug — Additional Operators

### Bitwise Operators

**Definition:**

Bitwise operators perform operations on the **individual binary bits (`0` and `1`)** of integer values.

```text
&   Bitwise AND
|   Bitwise OR
^   Bitwise XOR
~   Bitwise NOT
<<  Left Shift
>>  Right Shift
```

#### `&` — Bitwise AND

Returns `1` only when **both corresponding bits are `1`**.

```python
a = 13
b = 9

print(a & b)
```

```text
13 = 1101
 9 = 1001

    1101
  & 1001
  ------
    1001
```

`1001 = 9`

Output:

```text
9
```

#### `|` — Bitwise OR

Returns `1` when **at least one corresponding bit is `1`**.

```python
a = 13
b = 10

print(a | b)
```

```text
13 = 1101
10 = 1010

    1101
  | 1010
  ------
    1111
```

`1111 = 15`

Output:

```text
15
```

#### `^` — Bitwise XOR

Returns `1` when the corresponding bits are **different**.

```python
a = 13
b = 10

print(a ^ b)
```

```text
13 = 1101
10 = 1010

    1101
  ^ 1010
  ------
    0111
```

`0111 = 7`

Output:

```text
7
```

**Remember:**

```text
Same      → 0
Different → 1
```

#### `~` — Bitwise NOT

Reverses the bits of a number.

In Python:

```text
~n = -(n + 1)
```

Example:

```python
a = 12

print(~a)
```

Output:

```text
-13
```

#### `<<` — Left Shift

Shifts the binary bits to the **left** by the specified number of positions.

```python
a = 7

print(a << 2)
```

```text
7 = 0111

0111 << 2
---------
11100
```

`11100 = 28`

Output:

```text
28
```

#### `>>` — Right Shift

Shifts the binary bits to the **right** by the specified number of positions.

```python
a = 44

print(a >> 2)
```

```text
44 = 101100

101100 >> 2
-----------
001011
```

`001011 = 11`

Output:

```text
11
```

---

### Identity Operators

**Definition:**

Identity operators check whether two variables **refer to the same object**.

Operators:

```text
is
is not
```

Example:

```python
x = [10, 20, 30]
y = x
z = [10, 20, 30]

print(x is y)
print(x is z)
```

Output:

```text
True
False
```

- `x is y` → both refer to the **same object**.
- `x is z` → different objects, even though the values are the same.

**Important distinction:**

```text
==  → Checks whether values are equal
is  → Checks whether objects are identical
```

---

### Membership Operators

**Definition:**

Membership operators check whether a value **exists inside a sequence or collection**.

Operators:

```text
in
not in
```

Example with a list:

```python
tools = ["Python", "SQL", "Spark"]

print("Spark" in tools)
print("Java" not in tools)
```

Output:

```text
True
True
```

- `"Spark" in tools` → Spark exists.
- `"Java" not in tools` → Java doesn't exist.

#### Membership Operators with Dictionary

**Important:**

> In a dictionary, `in` and `not in` check **keys by default**, not values.

Example:

```python
student = {
    "name": "Arun",
    "age": 25,
    "city": "Chennai"
}

print("name" in student)
print("Arun" in student)
```

Output:

```text
True
False
```

Why?

```text
"name" → key   → True
"Arun" → value → False
```

To check values, use `.values()`:

```python
print("Arun" in student.values())
```

Output:

```text
True
```

To check keys explicitly, use `.keys()`:

```python
print("name" in student.keys())
```

Output:

```text
True
```

**Key point:**

> In a dictionary, membership operators check keys by default. To check values, use `.values()`.

---

## Quick Revision

```text
Python Fundamentals
│
├── What is Python?
├── Variables
├── Data Types
├── Type Casting
├── Naming Rules & Reserved Keywords
├── Collection Data Types
│   ├── List
│   ├── Tuple
│   ├── Set
│   └── Dictionary
├── f-Strings
├── Multiple Inputs
└── Operators
    ├── Arithmetic
    ├── Comparison → Boolean (True / False)
    ├── Logical
    ├── Assignment
    ├── Bitwise
    │   ├── &
    │   ├── |
    │   ├── ^
    │   ├── ~
    │   ├── <<
    │   └── >>
    ├── Identity
    │   ├── is
    │   └── is not
    └── Membership
        ├── in
        └── not in
            └── Dictionary → checks keys by default
```
