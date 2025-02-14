Module: dylan-rpn-impl

define constant <stack> = <deque>;
define constant <operand> = <integer>;
define constant <operator> = <function>;
define constant <expression> = <list>;

define generic operand? 
  (input :: <object>) => (_ :: false-or(<operand>));

define method operand?
  (input :: <object>) => (_ :: false-or(<operand>))
  #f
end;

define method operand? 
  (input :: <integer>) => (_ :: false-or(<operand>))
  input
end;

define method operand? 
  (input :: <string>) => (_ :: false-or(<operand>))
  block ()
    string-to-integer(input)
  exception (err :: <error>)
    #f
  end
end;

define generic operator?
  (input :: <object>) => (_ :: false-or(<operator>));

define method operator? 
  (input :: <function>) => (_ :: false-or(<operator>))
  input
end;

define method operator? 
  (input :: <string>) => (_ :: false-or(<operator>))
  select (input by \=)
    "+" => \+;
    "-" => \-;
    "*" => \*;
    "/" => \/;
    otherwise =>
      #f;
  end select
end;

define function invalid-argument
  (arg :: <object>) => ()
  error("Invalid argument: %=", arg)
end;

define function expression
  (#rest arguments) => (_ :: <expression>) 
  let expression = make(<expression>);
  for (arg in arguments)
    let input =   operand?(arg) 
                | operator?(arg) 
                | invalid-argument(arg);
    expression := add(expression, input)
  end for;
  reverse(expression)
end;

define function push!
    (s :: <stack>, #rest args) => (_ :: <stack>)
  for (arg in args) push(s, arg) end;
  s
end;

define function stack
  (#rest elements) => (_ :: <stack>)
  apply(curry(push!, make(<stack>)), elements)
end;

define function rpn
    (e :: <expression>) => (n :: <integer>)
  eval(e);
end;

define generic eval
  (e :: <expression>, #key stack :: <stack>) => (n :: <integer>);

define method eval
    (e == #(), #key stack :: <stack> = make(<stack>)) 
 => (n :: <integer>)
  unless (stack.size = 1)
    error("Empty expression with stack elements: %=", stack)
  end;
  pop(stack)
end;

define method eval
    (e :: <expression>, #key stack :: <stack> = make(<stack>)) 
 => (n :: <integer>)
  eval-first(head(e), tail(e), stack)
end;

define generic eval-first
  (o :: <object>, e :: <expression>, s :: <stack>) => (n :: <integer>);

define method eval-first
    (o :: <object>, e :: <expression>, s :: <stack>) => (n :: <integer>)
  error("Invalid input %=", o)  
end;

define method eval-first
    (o :: <operand>, e :: <list>, s :: <stack>) => (n :: <integer>)
  eval(e, stack: push!(s,o))
end;

define method eval-first
    (f :: <operator>, e :: <expression>, s :: <stack>) => (result :: <integer>)
  let operands = #();
  let n = function-arguments(f);
  for (i from 0 below n)
    operands := add(operands, pop(s))
  end;
  eval(e, stack: push!(s, apply(f, operands)))
end;
