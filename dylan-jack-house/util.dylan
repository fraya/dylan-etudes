Module: dylan-jack-house-impl

define function flatten
    (sequence :: <sequence>) => (flattened :: <sequence>)
  local method flatten-rec (seqs, flattened)
	  if (empty?(seqs))
	    reverse(flattened)
	  else
	    let item = head(seqs);
	    flatten-rec(tail(seqs),
			if (instance?(item, <list>))
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
