Module: dylan-rpn-impl

define constant <stack> = <deque>;
define constant <calculator> = <deque>;
define constant <expression> = <list>;

define function push!
    (s :: <stack>, o :: <object>) => (_ :: <stack>)
  push(s, o); s
end;

define function put!
   (c :: <calculator>, o :: <object>) => (_ :: <calculator>)
  push-last(c, o); 
  c 
end;

define function calculate!
    (c :: <calculator>) => (n :: <integer>)
  eval(as(<expression>, c), make(<stack>));
end;

define generic eval
  (e :: <expression>, s :: <stack>) => (n :: <integer>);

define method eval
    (e == #(), s :: <stack>) => (n :: <integer>)
  unless (s.size = 1)
    error("Empty expression with stack elements: %=", s)
  end;
  pop(s)
end;

define method eval
    (e :: <expression>, s :: <stack>) => (n :: <integer>)
  eval-first(head(e), tail(e), s)
end;

define generic eval-first
  (o :: <object>, e :: <expression>, s :: <stack>) => (n :: <integer>);

define method eval-first
    (o :: <object>, e :: <expression>, s :: <stack>) => (n :: <integer>)
  error("Invalid input %=", o)  
end;

define method eval-first
    (o :: <integer>, e :: <list>, s :: <stack>) => (n :: <integer>)
  eval(e, push!(s,o))
end;

define method eval-first
    (f :: <function>, e :: <expression>, s :: <stack>) => (result :: <integer>)
  let x = pop(s);
  let y = pop(s);
  eval(e, push!(s, apply(f, list(y, x))))
end;
