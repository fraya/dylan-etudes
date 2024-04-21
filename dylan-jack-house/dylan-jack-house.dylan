Module: dylan-jack-house-impl

define open class <poem> (<object>)
  slot poem-phrases :: <sequence> = #[],
    init-keyword: phrases:;
  constant slot poem-orderer :: <function> = identity,
    init-keyword: orderer:;
  constant slot poem-formatter :: <function> = identity,
    init-keyword: formatter:;
end class;

define method initialize
    (poem :: <poem>, #key)
  next-method();
  poem.poem-phrases := poem.poem-orderer(poem.poem-phrases)
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

///////////////////////
//
// Utility functions
//
///////////////////////

define function flatten
    (sequence :: <sequence>) => (flattened :: <sequence>)
  local method flatten-rec (seqs, flattened)
	  if (empty?(seqs))
	    reverse(flattened)
	  else
	    let item = head(seqs);
	    flatten-rec(tail(seqs),
			if (instance?(item, <sequence>))
			  concatenate(flatten-rec(item, #()), flattened)
			else
			  add(flattened, item)
			end)
	  end if;
	end method;
  flatten-rec(sequence, #())
end function flatten;

define function zip
    (#rest sequences) => (zipped :: <sequence>)
  local method zip-rec (seqs, zipped)
	  if (every?(empty?, seqs))
	    reverse(zipped)
	  else
	    zip-rec(map-as(<list>, tail, seqs), 
                    add(zipped, map-as(<list>, head, seqs)))
	  end
	end;
  zip-rec(sequences, #());
end function zip;
