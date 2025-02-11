Module: dylan-rpn-app

define constant $version = "1.0";

define function integer?
    (s :: <string>) => (_ :: false-or(<integer>))
  block ()
    string-to-integer(s)
  exception (err :: <error>)
    #f
  end
end;

define function operator?
    (s :: <string>) => (_ :: false-or(<function>))
  select (s by \=)
    "+" => \+;
    "-" => \-;
    "*" => \*;
    "/" => \/;
    otherwise =>
      #f;
  end select
end function;

define function valid?
    (s :: <string>) => (_ :: false-or(<object>))
  integer?(s) | operator?(s) | #f
end;

define function main
    (name :: <string>, arguments :: <vector>)
  format-out("%s v%s\n", name, $version);
  block () 
    let calculator = make(<calculator>);
    for (arg in arguments)
      let input = valid?(arg) | error("Invalid input: %=", arg);
      put!(calculator, input)
    end for;
    let result = calculate!(calculator);
    format-out("Result: %d\n", result);
    exit-application(0);
  exception (err :: <error>)
    format-err("%s\n", err);
    exit-application(1);
  end block;
end function;

// Calling our main function (which could have any name) should be the last
// thing we do.
main(application-name(), application-arguments());
