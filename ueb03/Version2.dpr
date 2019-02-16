program Version2;

{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils;

const
  PRICE_1_PERSON = 15;
  PRICE_2_PERSON = 25;
  PRICE_3_PERSON = 35;

var
  Input: char;
  Art: boolean;
  Fruit: boolean;
  People: byte;
  Cash: byte;
  EnoughMoney: boolean;

begin
  write('Magst du Kunst? (J/j oder N/n)');
  readln(Input);
  case Input of
    'j', 'J':
      Art := true;
  else
    Art := false;

  end;

  write('Magst du Obst? (J/j oder N/n)');
  readln(Input);
  case Input of
    'j', 'J':
      Fruit := true;
  else
    Fruit := false;
  end;

  write('Wie viele Personen seit ihr? (1-3)');
  readln(People);

  write('Wie viel Geld hast du?');
  readln(Cash);

  case People of
    1:
      EnoughMoney := (Cash >= PRICE_1_PERSON);
    2:
      EnoughMoney := (Cash >= PRICE_2_PERSON);
    3:
      EnoughMoney := (Cash >= PRICE_3_PERSON);
    else
      EnoughMoney := (Cash >= PRICE_3_PERSON);

  end;

  case EnoughMoney of
    true:

                    case Art of
                      true:
                        case Fruit of
                          true:
                            writeln('Viel Spaß in der Ausstellung "Eine bewegte Geschichte der Stillleben"');
                          false:
                            writeln('Viel Spaß in der Austellung "Kubismus in seiner schönsten Form"');

                        end;

                      false:
                        case Fruit of
                          true:
                            writeln('Viel Spaß in der Ausstellung "Abenteuer Erdbeere" ');
                          false:
                            writeln('Viel Spaß in der Austellung "Jackentaschen von 1800 bis heute"');

                        end;
          end;
    false:
      writeln('Du hast nicht genügend Geld');

      end;

readln;

end.
