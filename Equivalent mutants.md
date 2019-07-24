# Equivalent mutants

Suppose you are writing a big chunk of code. You have decided to run both unit and mutation tests.
Your score of unit tests is 100% and mutation 99%. You think `I'll make 100%`. And so you try, and try, but you still have an issue in the same spot:

```js
var max = Math.max(a.comma, b.comma);
var min = Math.min(a.comma, b.comma);
if (a.comma >= b.comma) {
  a.number *= 10 ** (max - min);
} else {
  b.number *= 10 ** (max - min);
}
```

Let's analise this example.

Assume `a.comma` is greater than `b.comma`. For example 4 and 2

We get that
```
max = 4
min = 2
if (4 >= 2) {
  a.number *= 10 ** 2;
} else {
  b.number *= 10 ** 2;
}
```
if we change `>=` sign in our source code to `<=` it won't work, so our mutant is killed.

If we change 4 and 2 to 3 and 5, we will get the same output: mutant will be killed.
But what if we have both values the same? Let's say: 3, 3

```
max = 3
min = 3
if (3 >= 3) {
  a.number *= 10 ** 0;
} else {
  b.number *= 10 ** 0;
}
```

Notice that 10 ** 0 = 1, so even if we change `>=` to `<=` and even `<` or `>` we will get the same output each time!

It is called equivalent mutant.


For now the only solution is by finding these by hand, which is time consuming. In `Stryker` we know some of them:

First one has been shown above. The easiest schema for this mutant is:

```js
if(whatever condition) {
  number1 += 0  // can be `-= 0` or `*= 1` `/= 1`
} else {
  number2 += 0  // can be `-= 0` or `*= 1` `/= 1`
}```


The second one we have found is about `BigNumber`

since `-0n` is transformed to `0n`, doing
```
a = 0n
a = (a <= 0n) ? -a : a;
```
will produce another equivalent mutant.



So knowing that for now, help us finding more of them and don't be scared of not 100% mutation score!
