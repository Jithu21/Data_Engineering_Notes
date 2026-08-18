# Python Fundamentals — My Learning Notes

## Overview
#### Date : 17 Aug and 18 Aug

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
    └── Assignment
```

