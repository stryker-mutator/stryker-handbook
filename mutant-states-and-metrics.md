# Mutant states and metrics

This page should shed some light on the different outcomes a mutant can have and the different metrics you'll find in any given mutation testing report.

## Mutant states

A mutant can have one of the following states:

* **Killed**\
  When at least one test failed while this mutant was active, the mutant is killed. This is what you want, good job!
* **Survived**\
  When all tests passed while this mutant was active, the mutant survived. You're missing a test for it.
* **No coverage**\
  No tests were executed for this mutant. It probably is located in a part of the code not hit by any of your tests. This means the mutant survived and you are missing a test case for it.
* **Timeout**\
  The running of tests with this mutant active resulted in a timeout.
  For example, the mutant resulted in an infinite loop in your code.
  Don't spend too much attention to this mutant. 
  It is counted as "detected". The logic here is that if this mutant were to be injected in your code,
  your CI build would detect it because the tests will never complete.
* **Runtime error**\
  The running of the tests resulted in an error (rather than a failed test).
  This can happen for dynamic languages, where the mutant resulted in unparsable code, for example.
  Don't spend too much attention looking at this mutant. It is not represented in your mutation score.
* **Compile error**\
  The mutant resulted in a compiler error. 
  This can happen in compiled languages.
  Don't spend too much attention looking at this mutant. 
  It is not represented in your mutation score.
* **Ignored**\
  The mutant was not tested because the config of the user asked for it to be ignored. 
  This will not count against your mutation score but will show up in reports.

## Metrics

Based on these states, we can calculate the following metrics:

* **Detected**\
  `killed + timeout`  
  The number of mutants detected by your tests.
* **Undetected**\
  `survived + no coverage`  
  The number of mutants that are not detected by your tests.
* **Covered**\
  `detected + survived`  
  The number of mutants that your tests produce code coverage for.
* **Valid**\
  `detected + undetected`  
  The number of valid mutants. They didn't result in a compile error or runtime error.
* **Invalid**\
  `runtime errors + compile errors`  
  The number of invalid mutants. They couldn't be tested because they produce either a compile error or a runtime error.
* **Total mutants**\
  `valid + invalid + ignored`  
  All mutants.
* **Mutation score**\
  `detected / valid * 100`  
  The total percentage of mutants that were killed.
* **Mutation score based on covered code**\
  `detected / covered * 100`  
  The total percentage of mutants that were killed based on the code coverage results.

