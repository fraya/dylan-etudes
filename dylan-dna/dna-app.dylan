Module: dna-app



define function main
    (name :: <string>, arguments :: <vector>)
  
  if (arguments.size < 1)
    format-out("USAGE:\n\t%s <file> [.. <file>]\n\n", application-name());
    exit-application(1);
  end if;

  let filename = arguments[0];
  if (~file-exists?(filename))
    format-err( "Error: File '%s' doesn't exists\n", filename );
    exit-application(1);
  end if;

  with-open-file (fs = filename, element-type: <character>)
    let dna = encode-dna(fs);
    let (a, c, g, t) = statistics(dna);
    format-out("%d %d %d %d\n", a, c, g, t);
  end;
    
  exit-application(0);

end function main;

main(application-name(), application-arguments());


