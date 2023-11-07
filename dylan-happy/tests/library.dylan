Module: dylan-user

define library dylan-happy-test-suite
  use common-dylan;
  use testworks;
  use dylan-happy;
end library;

define module dylan-happy-test-suite
  use common-dylan;
  use testworks;
  use dylan-happy;
  use dylan-happy-impl;
end module;
