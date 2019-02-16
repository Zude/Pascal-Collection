program Version3;

{$APPTYPE CONSOLE}
{$R+,Q+,X-}



uses
  System.SysUtils;

const
  PRICE_1_PERSON = 15;
  PRICE_2_PERSON = 25;
  PRICE_3_PERSON = 35;

var
  Input : char;
  Art : boolean;
  Fruit : boolean;
  MoreMoney : boolean;
  People : byte;
  Cash : byte;



begin
write('Magst du Kunst? (J/j oder N/n)');
readln(Input);
Art := Input = upcase('j');

write('Magst du Obst? (J/j oder N/n)');
readln(Input);
Fruit := Input = upcase('j');

write('Wie viele Personen seit ihr?');
readln(People);

write ('Wie viel Geld hast du?');
readln(Cash);

MoreMoney := ((People = 1) and (Cash >= PRICE_1_PERSON)) or ((People  = 2) and (Cash >= PRICE_2_PERSON)) or ((People = 3) and (Cash >= PRICE_3_PERSON));

if MoreMoney = false then writeln('Du hast nicht genug Geld');

if (Art and Fruit and MoreMoney) then writeln('Viel Spaﬂ bei der Austellung "Eine bewegte Geschichte der Stillleben"  ');
if (Art and MoreMoney) then writeln('Viel Spaﬂ bei der Austellung "Kubismus in seiner schˆnsten Form"  ');
if (Fruit and MoreMoney) then writeln('Viel Spaﬂ bei der Austellung "Abenteuer Erdbeere"  ');
if (not Art and not Fruit and MoreMoney) then writeln('Viel Spaﬂ bei der Austellung "Jackentaschen von 1800 bis heute" ');



readln;
end.
