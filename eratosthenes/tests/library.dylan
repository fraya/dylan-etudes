Module: dylan-user

define library eratosthenes-test-suite
  use common-dylan;
  use testworks;
  use eratosthenes;
end library;

define module eratosthenes-test-suite
  use common-dylan;
  use testworks;
  use eratosthenes;
  use %eratosthenes;
end module;
