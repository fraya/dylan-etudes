Module: dylan-rpn-impl

define constant <stack> 
  = limited(<deque>, of: <number>);

define function stack!
    (#rest elements) => (_ :: <stack>)
  let stack = make(<stack>);
  for (element in elements)
    push(stack, element)
  end;
  stack
end;

define generic rpn
    (expression :: <list>, stack :: <stack>) => (result :: <number>);

define method rpn
    (expression == #(), stack :: <stack>) => (result :: <number>)
 pop(stack)
end;