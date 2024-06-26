Module: dylan-jack-house-impl

define open class <poem> (<object>)
  slot poem-phrases :: <sequence> = #(),
    init-keyword: phrases:;
  constant slot poem-formatter :: <function> = identity,
    init-keyword: formatter:;
end class;

define method initialize
    (poem :: <poem>, #key orderer = identity)
  next-method();
  poem.poem-phrases := orderer(poem.poem-phrases)
end;
  
define function parts
    (poem :: <poem>, n :: <integer>) => (lines :: <sequence>)
  let _end    = poem.poem-phrases.size;
  let phrases = copy-sequence(poem.poem-phrases, start: _end - n);
  poem.poem-formatter(phrases)
end;

define function phrase
    (poem :: <poem>, n :: <integer>) => (string :: <string>)
  join(parts(poem, n), "\n")
end;

define function line
    (poem :: <poem>, n :: <integer>) => (line :: <string>)
  format-to-string("This is %s\n", phrase(poem, n))
end;

define function recite
    (poem :: <poem>) => (line :: <string>)
  let phrases = range(from: 1, to: poem.poem-phrases.size);
  join(map(method (i) line(poem, i) end, phrases), "\n")
end;
