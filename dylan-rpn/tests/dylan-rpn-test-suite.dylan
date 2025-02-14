Module: dylan-rpn-test-suite

define test test-rpn-empty ()
  assert-equal(1, rpn(expression(), stack: stack(1)),
               "Empty expression returns last element in stack");
  assert-signals(<error>, rpn(expression()),
               "Empty expression with no elements is an error");
  assert-signals(<error>, rpn(expression(), stack: stack(3, 4)),
                 "Empty expression with elements in stack is invalid");
end test;

define test test-rpn ()
  assert-equal(1, rpn(expression(1)),
               "1 evalutes to 1");
  assert-signals(<error>, rpn(expression(\+)) ,
		             "A function without parameters is invalid");
end test;

define test test-rpn-expression ()
  assert-equal(7, 
              rpn(expression(3, 4, \+)),
	            "3 4 + gives 7");
  assert-equal(14, 
               rpn(expression(5, 1, 2, \+, 4, \*, \+, 3, \-)),
	             "'5 1 2 + 4 * + 3 -' gives 14");
end test;

// Use `_build/bin/dylan-rpn-test-suite --help` to see options.
run-test-application()
