Module: dylan-user
Synopsis: Module and library definition for executable application

define library dylan-fibonacci-app
  use common-dylan;
  use dylan-fibonacci;
  use io, import: { format-out };
end library;

define module dylan-fibonacci-app
  use common-dylan;
  use format-out;
  use dylan-fibonacci;
end module;
