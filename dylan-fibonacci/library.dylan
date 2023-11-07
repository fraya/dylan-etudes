Module: dylan-user

define library dylan-fibonacci
  use common-dylan;
  use io,
    import: { format-out };

  export
    dylan-fibonacci,
    dylan-fibonacci-impl;
  
end library;

define module dylan-fibonacci
  create
    fibonacci-recursive,
    fibonacci-closed-form;
end module;

define module dylan-fibonacci-impl

  // module interface
  use dylan-fibonacci;

  // module substrate
  use common-dylan;
  use transcendentals;

end module;
