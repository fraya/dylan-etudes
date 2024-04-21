Module: dylan-jack-house-app

define constant $jack-poem
  = #("the horse and the hound and the horn that belonged to",
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
      "the house that Jack built.");

define function jack-house
    () => (poem :: <poem>)
  make(<poem>, phrases: $jack-poem)
end;

define function jack-house-echo
    () => (poem :: <poem>)
  make(<poem>,
       phrases: $jack-poem,
       formatter: method (parts) flatten(zip(parts, parts)) end)       
end;

define command-line <poem-command-line> ()
  option poem-choice :: <string>,
    names: #("poems", "p"),
    choices: #("vanilla", "echo"),
    default: "vanilla",
    kind: <choice-option>,
    help: "Poems types (vanilla, echo) [%default%]";
end command-line;

define function poem-of-choice
    (choice :: <symbol>) => (poem :: <poem>)
  select (choice)
    #"vanilla"
      => jack-house();
    #"echo"
      => jack-house-echo();
    otherwise
      => error("Unknown poem choice '%s'", choice)
  end
end;

define function main
    (name :: <string>, arguments :: <vector>)
  block ()
    let cmd = make(<poem-command-line>, help: "Jack's house");
    parse-command-line(cmd, arguments);
    
    let poem = poem-of-choice(as(<symbol>, cmd.poem-choice));
    format-out("%s\n", recite(poem));
    
    exit-application(0);
  exception (err :: <abort-command-error>)
    format-err("%s\n", err);
    exit-application(err.exit-status);
  exception (err :: <error>)
    format-err("%s\n", err);
    exit-application(1);
  end;
end function;

// Calling our main function (which could have any name) should be the last
// thing we do.
main(application-name(), application-arguments());
