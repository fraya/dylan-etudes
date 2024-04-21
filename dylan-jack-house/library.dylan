Module: dylan-user

define library dylan-jack-house
  use common-dylan;
  use io,
    import: { format };

  export
    dylan-jack-house,
    dylan-jack-house-impl;
end library;

define module dylan-jack-house
  create
    <poem>,
    poem-phrases,
    recite;

  create
    flatten,
    zip;
end module;

define module dylan-jack-house-impl
  // library common-dylan
  use common-dylan;

  // library io
  use format;
  
  use dylan-jack-house;

end module;
