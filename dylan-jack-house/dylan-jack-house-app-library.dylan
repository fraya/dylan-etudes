Module: dylan-user
Synopsis: Module and library definition for executable application

define library dylan-jack-house-app
  use common-dylan;
  use command-line-parser;
  use io, import: { format-out };

  use dylan-jack-house;
end library;

define module dylan-jack-house-app
  use common-dylan;
  use command-line-parser;
  use format-out;
  
  use dylan-jack-house;
end module;
