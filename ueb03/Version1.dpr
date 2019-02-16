program Version1;

{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils;

const
  PRICE_1_PERSON = 15;
  PRICE_2_PERSON = 25;
  PRICE_3_PERSON = 35;

var
  Art: boolean;
  Fruit: boolean;
  Person: byte;
  Money: byte;
  Input: char;
  Entry: boolean;

begin

  // Kunst Ja oder Nein
  write('Magst du Kunst? (J/j or N/n)');
  readln(Input);

  Art := (Input = 'J') or (Input = 'j');

  // Obst Ja oder Nein
  write('Magst du Obst? (J/j or N/n)');
  readln(Input);

  Fruit := (Input = 'J') or (Input = 'j');

  // Wie viele Personen
  write('Wie viele Personen seid ihr? (1-3)');
  readln(Person);

  if Person < 1 then
  begin
    Person := 1;
  end
  else if Person > 3 then
  begin
    Person := 3;
  end;

  // Wie viel Geld dabei
  write('Wie viel geld hast du dabei?');
  readln(Money);

  // Für eine Person
  if Person = 1 then
  begin
    Entry := (Money >= PRICE_1_PERSON);
  end
  // Für 2 Personen
  else if Person = 2 then
    begin
    Entry := (Money >= PRICE_2_PERSON);
    end
  // Für 3 Personen
  else
    Entry := (Money >= PRICE_3_PERSON);

  // Welche Ausstellung
  if Entry then
  begin
    write('Viel Spaß bei der Austellung ');
    if Art then
    begin
      if Fruit then
      begin
        writeln('"Eine bewegte Geschichte der Stillleben"');
      end
      else
      begin
        writeln('"Kubismus in seiner schönsten Form"');
      end
    end
    else if Fruit then
    begin
      writeln('"Abenteuer Erdbeere"');
    end
    else
    begin
      writeln('"Jackentaschen von 1800 bis heute"');
    end;
  end

  else
    writeln('Du hast nicht genügend Geld');

  readln;

end.
