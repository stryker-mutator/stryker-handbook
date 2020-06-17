# What is mutation testing?

Bugs, or mutants, are automatically inserted into your production code. Your tests are run for each mutant. If your tests fail then the mutant is killed. If your tests passed, the mutant survived. The higher the percentage of mutants killed, the more effective your tests are.

It's that simple.

Are you still confused? Why not take a look at our example page and try it out yourself?

# But wait, what about code coverage?

Well... code coverage doesn't tell you everything about the effectiveness of your tests. Think about it, when was the last time you saw a test without an assertion, purely to increase the code coverage?

Imagine a sandwich covered with paste. Code coverage would tell you the bread is 80% covered with paste. Mutation testing, on the other hand, would tell you it is chocolate paste and not... well... something else.

# Meet: Stryker

Sounds complicated? Don't worry! Stryker has your back. It uses one design mentality to implement mutation testing on three platforms. It's easy to use and fast to run. Stryker will only mutate your source code, making sure there are no false positives.
