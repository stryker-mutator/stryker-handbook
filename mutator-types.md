# Supported mutators

Stryker supports a variety of mutators, which are listed below.

## Support

| Mutator           | `Stryker` | `Stryker.NET` | `Stryker4s` |
| ----------------- | :-----: | :---------: | :-------: |
| [Binary Operators](#binary-operators) | ✅ | ✅ | ✅ |
| [Boolean Substitutions](#boolean-substitutions) | ✅ | ❗ | ❌ |
| [Logical operators](#logical-operators) | ✅ | ❗ | ❌ |
| [Unary operators](#unary-operators) | ✅ | ❗ | ❌ |
| [Update operators](#update-operators) | ✅ | ❗ | ❌ |
| [Remove conditionals](#remove-conditionals) | ✅ | ❗ | ❌ |
| [Array Declarator](#array-declarator) | ✅ | ❗ | ❌ |
| [Block statement](#block-statement) | ✅ | ❗ | ❌ |

## Binary operators

Original | Mutated
| - | - |
a + b | a - b
a - b | a + b
a * b | a / b
a / b | a * b
a % b | a * b
a < b | a <= b
a < b | a >= b
a <= b | a < b
a <= b | a > b
a > b | a >= b
a > b | a <= b
a >= b | a > b
a >= b | a < b
a == b | a != b
a != b | a == b
a === b | a !== b
a !== b | a === b

[🔝 Back to Top](#supported-mutators)

## Boolean Substitutions

Original | Mutated
| - | - |
true | false
false | true
! |  

[🔝 Back to Top](#supported-mutators)

## Logical operators

Original | Mutated
| - | - |
a && b | a \|\| b
a \|\| b |a && b

[🔝 Back to Top](#supported-mutators)

## Unary operators

Original | Mutated
| - | - |
+a | -a
-a | +a

[🔝 Back to Top](#supported-mutators)

## Update operators

Original | Mutated
| - | - |
a++ | a--
a-- | a++
++a | --a
--a | ++a

[🔝 Back to Top](#supported-mutators)

## Remove conditionals

Original | Mutated
| - | - |
for (var i = 0; i < 10; i++) { } | for (var i = 0; false; i++) { }
while (a > b) { } | while (false) { }
do { } while (a > b); | do { } while (false);
if (a > b) { } | if (true) { }
if (a > b) { } | if (false) { }
var x = a > b ? 1 : 2; | var x = true ? 1 : 2;
var x = a > b ? 1 : 2; | var x = false ? 1 : 2;

[🔝 Back to Top](#supported-mutators)

## Array Declarator

Original | Mutated
| - | - |
new Array(1, 2, 3, 4) | new Array()
[1, 2, 3, 4] | [ ]

[🔝 Back to Top](#supported-mutators)

## Block statement

This mutator removes the content of every block statement. For example the code:

```javascript
function saySomething() {
  console.log('Hello world!');
}
```

becomes:

```javascript
function saySomething() {
}
```

[🔝 Back to Top](#supported-mutators)