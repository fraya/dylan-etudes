Module: dylan-user
Synopsis: Module and library definition for executable application

define library dylan-rpn-app
  use common-dylan;
  use io, import: { format-out };

  use dylan-rpn;
end library;

define module dylan-rpn-app
  use common-dylan;
  use format-out;
  
  use dylan-rpn;
end module;
