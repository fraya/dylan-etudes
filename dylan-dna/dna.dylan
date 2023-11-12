Module: dna-impl

define constant <nucleobase> 
  = one-of(#"A", #"G", #"C", #"T");

define constant <dna>
  = limited(<stretchy-vector>, of: <nucleobase>);

define function nucleobase?
    (character :: <character>)
 => (nucleobase? :: <boolean>)
  let char = as-uppercase(character);
  char = 'A' | char = 'G' | char = 'C' | char = 'T'
end;
      
define method as
    (type == <nucleobase>, character :: <character>)
 => (nucleobase :: <nucleobase>)
  select (as-uppercase(character))
    'A' => #"A";
    'G' => #"G";
    'C' => #"C";
    'T' => #"T";
    otherwise
      => error("Incorrect nucleobase %=", character)
  end;
end;
       
define method encode-dna
    (stream :: <stream>)
 => (dna :: <dna>)
  let dna = make(<dna>);
  while (~stream-at-end?(stream))
    let character = as(<character>, read-element(stream));
    if (nucleobase?(character))
      add!(dna, as(<nucleobase>, character));
    end if;
  end while;
  dna
end;

define method encode-dna
    (locator :: <locator>)
 => (dna :: <dna>)
  with-open-file (fs = locator, element-type: <character>)
    encode-dna(fs)
  end;
end;

define method encode-dna
    (string :: <string>)
 => (dna :: <dna>)
  let stream = make(<string-stream>, contents: string);
  encode-dna(stream)
end;

define method statistics
    (dna :: <dna>)
 => (a :: <integer>, c :: <integer>, g :: <integer>, t :: <integer>)
  let ( a, c, g, t ) = values( 0, 0, 0, 0 );
  for ( nucleobase in dna )
    select ( nucleobase )
      #"A" => a := a + 1;
      #"C" => c := c + 1;
      #"G" => g := g + 1;
      #"T" => t := t + 1;
    end select;
  end for;
  values ( a, c, g, t )
end method statistics;

define method statistics
    (locator :: <locator>)
 => (a :: <integer>, c :: <integer>, g :: <integer>, t :: <integer>)
  statistics(encode-dna(locator))
end;

