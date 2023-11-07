Module: dylan-happy-impl

define constant <natural> 
  = limited(<integer>, min: 1);

define function perfect-digital-invariant
    (n :: <integer>, #key power :: <integer> = 2, base :: <integer> = 10)
 => (result :: <integer>)
  let result = 0;
  while (n > 0)
    result := result + modulo(n, base) ^ power; 
    n := floor/(n, base);
  end while;
  result
end;

// Exported

define method happy?
    (n :: <natural>) => (result :: <boolean>)
  while (n > 9)
     n := perfect-digital-invariant(n);
  end;
  n = 1 | n = 7
end;
 