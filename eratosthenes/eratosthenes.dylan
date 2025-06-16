Module: %eratosthenes

define function eratosthenes
    (n :: <integer>) => (primes :: <sequence>)
  let a = make(<table>);
  for (i from 2 below n)
    a[i] := #t
  end;

  for (i from 2 to isqrt(n))
    if (a[i])
      for (j from (i * i) below n by i)
        a[j] := #f
      end;
    end;
  end;

  let primes = make(<stretchy-vector>);
  for (value keyed-by prime in a)
    if (value) add!(primes, prime) end
  end;
  primes
end;
