Module: dylan-user

define library dylan-rpn-test-suite
  use common-dylan;
  use testworks;
  use dylan-rpn;
end library;

define module dylan-rpn-test-suite
  use common-dylan;
  use testworks;
  use dylan-rpn;
  use dylan-rpn-impl;
end module;
