# Supported mutators

Stryker supports a variety of mutators, which are listed below.

## Support

| Mutator | [Stryker](stryker/) | [Stryker.NET](stryker.net/) | [Stryker4s](stryker4s/) |
| - | :-: | :-: | :-: |
| [Binary Operators](#binary-operators) | ✅ | ✅ | ❗¹ |
| [Boolean Substitutions](#boolean-substitutions) | ✅ | ✅ | ❗² |
| [Logical operators](#logical-operators) | ✅ | ✅ | ✅ |
| [Unary operators](#unary-operators) | ✅ | ✅ | ❌ |
| [Update operators](#update-operators) | ✅ | ✅ | n/a |
| [Remove conditionals](#remove-conditionals) | ✅ | ❌ | ❌ |
| [Assignment mutator](#assignment-mutator) | ❌ | ✅ | n/a |
| [Array declarator](#array-declarator) | ✅ | ❌ | ❌ |
| [String mutator](#string-mutator) | ✅ | ❌ | ✅ |
| [Block statement](#block-statement) | ✅ | ❌ | ❌ |
| [Checked mutator](#checked-mutator) | n/a | ✅ | n/a |
| [Method mutator](#method-mutator) | n/a | ❌ | ✅ |

- ¹: Stryker4s does not support (`+`,`-`,`*`,`/` and `%` operators)
- ²: Stryker4s does not support boolean substitutions with `!`

## Binary operators

Original | Mutated
| - | - |
`a + b` | `a - b`
`a - b` | `a + b`
`a * b` | `a / b`
`a / b` | `a * b`
`a % b` | `a * b`
`a < b` | `a <= b`
`a < b` | `a >= b`
`a <= b` | `a < b`
`a <= b` | `a > b`
`a > b` | `a >= b`
`a > b` | `a <= b`
`a >= b` | `a > b`
`a >= b` | `a < b`
`a == b` | `a != b`
`a != b` | `a == b`
`a === b` | `a !== b`
`a !== b` | `a === b`

[🔝 Back to Top](#supported-mutators)

## Boolean Substitutions

Original | Mutated
| - | - |
`true` | `false`
`false` | `true`
`!` | ` `

[🔝 Back to Top](#supported-mutators)

## Logical operators

Original | Mutated
| - | - |
`a && b` | `a || b`
`a \\ b` | `a && b`

[🔝 Back to Top](#supported-mutators)

## Unary operators

Original | Mutated
| - | - |
`+a` | `-a`
`-a` | `+a`

[🔝 Back to Top](#supported-mutators)

## Update operators

Original | Mutated
| - | - |
`a++` | `a--`
`a--` | `a++`
`++a` | `--a`
`--a` | `++a`

[🔝 Back to Top](#supported-mutators)

## Remove conditionals

Original | Mutated
| - | - |
`for (var i = 0; i < 10; i++) { }` | `for (var i = 0; false; i++) { }`
`while (a > b) { }` | `while (false) { }`
`do { } while (a > b);` | `do { } while (false);`
`if (a > b) { }` | `if (true) { }`
`if (a > b) { }` | `if (false) { }`
`var x = a > b ? 1 : 2;` | `var x = true ? 1 : 2;`
`var x = a > b ? 1 : 2;` | `var x = false ? 1 : 2;`

[🔝 Back to Top](#supported-mutators)

## Assignment mutator

Original | Mutated
| - | - |
`+=` | `-=`
`-=` | `+=`
`*=` | `/=`
`/=` | `*=`
`%=` | `*=`
`<<=` | `>>=`
`>>=`| `<<=`
`&=` | `|=`
`|=` | `&=`

[🔝 Back to Top](#supported-mutators)

## Array Declarator

Original | Mutated
| - | - |
`new Array(1, 2, 3, 4)` | `new Array()`
`[1, 2, 3, 4]` | `[ ]`

[🔝 Back to Top](#supported-mutators)

## String mutator

Original | Mutated
| - | - |
`"foo"` (non-empty string) | `""` (empty string)
`""` (empty string) | `"Stryker was here!"`
`s"foo ${bar}"` (string interpolation) | `s""` ¹

¹: Only works with string interpolation and not others (like Scalameta quasiquotes) to avoid compile errors

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

## Checked mutator

Stryker.NET *specific mutator*

Original | Mutated
| - | - |
`checked(2 + 4)` | `2 + 4`

[🔝 Back to Top](#supported-mutators)

## Method mutator

Original | Mutated
| - | - |
`a.filter(b)` | `a.filterNot(b)`
`a.filterNot(b)` | `a.filter(b)`
`a.exists(b`) | `a.forAll(b) 1`
`a.forAll(b)` | `a.exists(b)`
`a.isEmpty` | `a.nonEmpty`
`a.nonEmpty` | `a.isEmpty`
`a.indexOf` | `a.lastIndexOf(b) 1`
`a.lastIndexOf(b)` | `a.indexOf(b)`
`a.max` | `a.min`
`a.min` | `a.max`

[🔝 Back to Top](#supported-mutators)
