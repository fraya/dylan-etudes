Module: dylan-user
Synopsis: Module and library definition for executable application

define library dylan-happy-app
  use common-dylan;
  use dylan-happy;
  use io, import: { format-out };
end library;

define module dylan-happy-app
  use common-dylan;
  use format-out;
  use dylan-happy;
end module;
