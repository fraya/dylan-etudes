Module: dylan-user
Synopsis: Module and library definition for executable application

define library eratosthenes-app
  use common-dylan;
  use eratosthenes;
  use io, import: { format-out };
end library;

define module eratosthenes-app
  use common-dylan;
  use common-extensions;
  use format-out;
  use eratosthenes;
end module;
