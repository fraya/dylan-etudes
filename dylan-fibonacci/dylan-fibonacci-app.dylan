Module: dylan-fibonacci-app

define function main
    (name :: <string>, arguments :: <vector>)
  let usage = "Usage: fibonacci <n:positive>\n";
  
  if (arguments.size < 1)
    format-err(usage);
    exit-application(1);
  end if;

  block ()
    let n = string-to-integer(arguments[0]);
    if (n < 0)
      format-err(usage);
      exit-application(1);
    end if;
    format-out("%d\n", fibonacci-closed-form(n));
    exit-application(0);
  exception (error :: <error>)
    format-err("%=\n", error);
    exit-application(1);
  end;
end function;

// Calling our main function (which could have any name) should be the last
// thing we do.
main(application-name(), application-arguments());
