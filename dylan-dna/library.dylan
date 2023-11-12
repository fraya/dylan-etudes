Module: dylan-user

define library dna
  use common-dylan;
  use io;
  use system;
  
  export
    dna,
    dna-impl;
end library;

define module dna
  create
    <nucleobase>,
    <dna>;

  create
    encode-dna,
    statistics;
end module;

define module dna-impl
  use common-dylan;
  use file-system;
  use locators;
  use streams;

  use dna;
end module;
