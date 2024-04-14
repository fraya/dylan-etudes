Module: dylan-user

define library dylan-jack-house-test-suite
  use common-dylan;
  use testworks;
  use dylan-jack-house;
end library;

define module dylan-jack-house-test-suite
  use common-dylan;
  use testworks;
  use dylan-jack-house;
  use dylan-jack-house-impl;
end module;
