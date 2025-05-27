Module: eratosthenes-test-suite

define test test-sieve ()
  expect-equal(#[], sort(eratosthenes(2))); 
  expect-equal(#[2], sort(eratosthenes(3))); 
  expect-equal(#[2,3,5,7,11,13,17,19,23,29], sort(eratosthenes(31)));
end;

// Use `_build/bin/eratosthenes-test-suite --help` to see options.
run-test-application()
