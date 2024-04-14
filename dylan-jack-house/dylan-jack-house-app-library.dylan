Module: dylan-user
Synopsis: Module and library definition for executable application

define library dylan-jack-house-app
  use common-dylan;
  use dylan-jack-house;
  use io, import: { format-out };
end library;

define module dylan-jack-house-app
  use common-dylan;
  use format-out;
  use dylan-jack-house;
end module;
