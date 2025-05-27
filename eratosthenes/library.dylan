Module: dylan-user

define library eratosthenes
  use common-dylan;
  use io, import: { format-out };

  export
    eratosthenes,
    %eratosthenes;
end library;

define module eratosthenes
  export
    eratosthenes;
end module;

define module %eratosthenes
  use common-dylan;
  use transcendentals;
  use eratosthenes;
end module;
