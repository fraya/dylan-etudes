Module: dylan-user

define library dylan-rpn
  use common-dylan;
  use io, import: { format-out };

  export
    dylan-rpn,
    dylan-rpn-impl;
end library;

define module dylan-rpn
  create
    <stack>,
    stack!,
    rpn;
end module;

define module dylan-rpn-impl
  use common-dylan;
  use dylan-rpn;
end module;
