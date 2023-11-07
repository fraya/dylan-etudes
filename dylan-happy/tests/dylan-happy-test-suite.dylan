Module: dylan-happy-test-suite

define test test-pdi ()
  assert-equal(1, perfect-digital-invariant(1, power: 2, base: 10));
  assert-equal(4150, perfect-digital-invariant(4150, power: 5));
end test;

define test test-happy ()
  assert-true(happy?(1));
  assert-false(happy?(2));
  assert-true(happy?(7));
end test;

define test test-happy-numbers ()
  let expected = vector(1, 7, 10);
  let range = range (from: 1, to: 10);
  assert-equal(expected, choose(happy?, range));
end;
  
// Use `_build/bin/dylan-happy-test-suite --help` to see options.
run-test-application()
