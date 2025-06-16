Module: %eratosthenes

define function eratosthenes
    (n :: <integer>) => (primes :: <sequence>)
  let a = make(<vector>, size: n, fill: #t);

  for (i from 2 to isqrt(n))
    if (a[i])
      for (j from (i * i) below n by i)
        a[j] := #f
      end;
    end;
  end;

  let primes = make(<stretchy-vector>);
  for (i from 2 below a.size)
    if (a[i]) add!(primes, i) end
  end;
  primes
end;
