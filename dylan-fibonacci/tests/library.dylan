Module: dylan-user

define library dylan-fibonacci-test-suite
  use common-dylan;
  use testworks;
  use dylan-fibonacci;
end library;

define module dylan-fibonacci-test-suite
  use common-dylan;
  use testworks;
  use dylan-fibonacci;
  use dylan-fibonacci-impl;
end module;
