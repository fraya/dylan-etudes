Module: dylan-fibonacci-impl

// Exported
define function fibonacci-recursive
    (n :: <integer>)
 => (f :: <integer>)
  local
    method fib (n)
      if (n < 2)
	n
      else
	fib(n - 1) + fib(n - 2)
      end if;
    end;
  fib(n)
end function;

define function fibonacci-closed-form
    (n :: <integer>)
 => (f :: <number>)
  let sqrt5 = sqrt(5.0d0);
  let golden-ratio = 0.5d0 * (1.0d0 + sqrt5);
  let inverse-golden-ratio = - (1.0d0 / golden-ratio);
  (1.0d0 / sqrt5) * ((golden-ratio ^ n) - (inverse-golden-ratio ^ n))
end function;
