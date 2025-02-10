Module: dylan-rpn-test-suite

define test test-rpn-empty ()
  assert-equal(1, rpn(#(), stack!(1)),
               "An empty expression and one element in stack returns the element");
end test;

// Use `_build/bin/dylan-rpn-test-suite --help` to see options.
run-test-application()
