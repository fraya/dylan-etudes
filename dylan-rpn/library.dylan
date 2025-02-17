Module: dylan-user

define library dylan-rpn
  use common-dylan;
  use io, 
    import: { format,
              format-out };

  export
    dylan-rpn,
    dylan-rpn-impl;
end library;

define module dylan-rpn
  create
    <expression>,
    <operand>,
    <operator>,
    operand?,
    operator?,
    expression,
    rpn;
end module;

define module dylan-rpn-impl
  use common-dylan;
  use format;
  use format-out;
  use dylan-rpn;

  export
    <stack>,
    stack,
    push!;
end module;
