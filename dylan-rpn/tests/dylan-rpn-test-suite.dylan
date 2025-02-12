Module: dylan-rpn-test-suite

define test test-rpn-empty ()
  assert-equal(1, eval(#(), push!(make(<stack>), 1)),
               "Empty expression returns last element in stack");
  assert-signals(<error>, eval(#(), make(<stack>)),
               "Empty expression with no elements is an error");
  let s = push!(push!(make(<stack>), 3), 4);
  assert-signals(<error>, eval(#(), s),
               "Empty expression with elements in stack is invalid");
end test;

define test test-rpn ()
  assert-equal(1, eval(#(1), make(<stack>)) ,
               "1 evalutes to 1");
  assert-signals(<error>, eval(list(\+), make(<stack>)) ,
		 "A function without parameters is invalid");
end test;

define test test-rpn-expression ()
  assert-equal(7, eval(list(3, 4, \+), make(<stack>)),
	       "3 4 + gives 7");
  assert-equal(14, eval(list(5, 1, 2, \+, 4, \*, \+, 3, \-), make(<stack>)),
	       "'5 1 2 + 4 * + 3 -' gives 14");
end test;

// Use `_build/bin/dylan-rpn-test-suite --help` to see options.
run-test-application()
