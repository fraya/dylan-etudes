Module: dylan-rpn-app

define constant $version = "1.0";

define function main
    (name :: <string>, arguments :: <vector>)
  format-out("%s v%s\n", name, $version);
  exit-application(0);
end function;

// Calling our main function (which could have any name) should be the last
// thing we do.
main(application-name(), application-arguments());
