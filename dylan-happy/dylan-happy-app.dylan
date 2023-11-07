Module: dylan-happy-app

define function main
    (name :: <string>, arguments :: <vector>)
  let exit-code = 0;
  if (arguments.size < 2)
    format-err("Happy numbers in a range.\n");
    format-err("Usage: %s <from:integer> <to:integer>\n", name);
    exit-code := 1;
  else
    let from   = string-to-integer(arguments[0]);
    let to     = string-to-integer(arguments[1]);
    let range  = range (from: from, to: to);
    let happys = choose (happy?, range);
    format-out("%=\n", happys);
  end if;
  exit-application(exit-code);
end function;

main(application-name(), application-arguments());
