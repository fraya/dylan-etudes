Module: dylan-rpn-impl

define constant <stack> = <deque>;
define constant <expression> = <vector>;

define function stack!
    (#rest args) => (stack :: <stack>)
  let stack = make(<stack>);
  do(curry(push-last, stack), args);
  stack
end;

define function push!
    (stack :: <stack>, element :: <object>) => (_ :: <stack>)
  push(stack, element);
  stack
end;

define class <calculator> (<object>)
  slot calculator-expression :: <expression> = make(<expression>),
    init-keyword: expression:;
  constant slot calculator-stack :: <deque> = make(<stack>),
    init-keyword: stack:;
end class;

define generic put!
  (c :: <calculator>, obj :: <object>) => (_ :: <calculator>);

define method put!
    (c :: <calculator>, obj :: <object>) => (_ :: <calculator>)
  error("Invalid input: %=", obj)
end;

define method put!
    (c :: <calculator>, n :: <integer>) => (_ :: <calculator>)
  c.calculator-expression := add(c.calculator-expression, n);
  c
end;

define method put!
    (c :: <calculator>, f :: <function>) => (_ :: <calculator>)
  c.calculator-expression := add(c.calculator-expression, f);
  c
end;

define function calculate!
    (c :: <calculator>) => (result :: <integer>)
  block () 
    let expression = as(<list>, c.calculator-expression);
    let result = eval(expression, c.calculator-stack);
    result
  exception (err :: <error>)
    error("Error: %=\n%= %=",
	  err,
	  c.calculator-expression,
	  c.calculator-stack)
  end;
end;

define generic eval
  (expression :: <object>, stack :: <stack>) => (result :: <integer>);

define method eval
    (expression == #(), stack :: <stack>) => (result :: <integer>)
  unless (stack.size = 1)
    error("Empty expression with stack elements: %=", stack)
  end;
  pop(stack)
end;

define method eval
    (expression :: <list>, stack :: <stack>) => (result :: <integer>)
  eval-first(head(expression), tail(expression), stack)
end;

define generic eval-first
  (element :: <object>, expression :: <list>, stack :: <stack>) => (result :: <integer>);

define method eval-first
    (obj :: <object>, expr :: <list>, s :: <stack>) => (result :: <integer>)
  error("Invalid input %=", obj)  
end;

define method eval-first
    (n :: <integer>, expr :: <list>, s :: <stack>) => (r :: <integer>)
  eval(expr, push!(s, n))
end;

define method eval-first
    (f :: <function>, expression :: <list>, stack :: <stack>) => (result :: <integer>)
  let x = pop(stack);
  let y = pop(stack);
  let r = apply(f, list(y, x));
  eval(expression, push!(stack, r))
end;
