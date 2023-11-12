Module: dylan-user

define library dna-app
  use common-dylan;
  use io;
  use system;
  
  use dna;
end library;

define module dna-app
  use common-dylan;
  use format-out;
  use file-system;
  use locators;
  use streams;
  
  use dna;
end module;
