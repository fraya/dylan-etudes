Module: dylan-jack-house-app

define constant $jack-poem
  = #["the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate",
      "the malt that lay in",
      "the house that Jack built."];

define class <jack-house-poem> (<poem>)
  inherited slot poem-phrases = $jack-poem;
end;

define function main
    (name :: <string>, arguments :: <vector>)
  let poem = make(<jack-house-poem>);
  format-out("%s\n", recite(poem));
  exit-application(0);
end function;

// Calling our main function (which could have any name) should be the last
// thing we do.
main(application-name(), application-arguments());
