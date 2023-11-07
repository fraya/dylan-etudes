Module: dylan-user

define library dylan-happy
  use common-dylan;
  use io, import: { format-out };

  export
    dylan-happy,
    dylan-happy-impl;
end library;

// Interface module creates public API, ensuring that an implementation
//  module exports them.
define module dylan-happy
  create
    happy?;
end module;

define module dylan-happy-impl
  use common-dylan;
  use dylan-happy;

  export
    perfect-digital-invariant;
end module;
