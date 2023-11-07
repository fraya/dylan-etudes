Module: dylan-fibonacci-test-suite

define test test-$greeting ()
  assert-equal("Hello world!", $greeting);
end test;

define test test-greeting ()
  assert-equal("Hello world!", greeting());
end test;

// Use `_build/bin/dylan-fibonacci-test-suite --help` to see options.
run-test-application()
