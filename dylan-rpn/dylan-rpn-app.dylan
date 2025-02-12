Module: dylan-rpn-app

define function main
    (name :: <string>, arguments :: <vector>)
  block () 
    format-out("%d\n",
                rpn(expression(arguments)));
    exit-application(0);
  exception (err :: <error>)
    format-err("%s\n", err);
    exit-application(1);
  end block;
end function;

// Calling our main function (which could have any name) should be the last
// thing we do.
main(application-name(), application-arguments());
