Module: %eratosthenes

define function eratosthenes
    (n :: <integer>) => (primes :: <sequence>)
  local
    method numbers (x, y) 
      let r = make(<table>);
      for (i from x below y)
        r[i] := #t
      end;
      r
    end;
  let i = 0;
  let j = 0;
  let a = numbers(2, n);
  
  for (i from 2 to isqrt(n))
    if (a[i])
      for (j from (i * i) below n by i)
        a[j] := #f
      end for;
    end if;
  end for;

  let primes = make(<stretchy-vector>);
  for (value keyed-by prime in a)
    if (value) add!(primes, prime) end
  end;
  primes
end;
