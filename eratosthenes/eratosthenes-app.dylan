Module: eratosthenes-app

define function main
    (name :: <string>, arguments :: <vector>)
  block ()
    if (arguments.size < 1)
      error("USAGE: %s <n>", name);
    end;

    let n = string-to-integer(arguments[0], default: #f);
    if (~n | n < 1)
      error("N must be a positive integer")
    end;

    let primes = eratosthenes(n);
    format-out("%=\n", primes.size);
    
    exit-application(0);
  exception (err :: <error>)
    format-err("%=\n", err);
    exit-application(1);
  end;
end function;

// Calling our main function (which could have any name) should be the last
// thing we do.
main(application-name(), application-arguments());
