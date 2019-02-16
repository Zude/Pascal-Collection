program build;

{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils;

type
  TSize = (sM,sL,sXL);
  TAllSize = set of TSize;


  TPizza = record
              name: string;
              size: TSize;
              cheese: boolean;
              price: real;
           end;

  TPizzaArray = array of TPizza;

const
  SIZESTRING : array[TSize] of string = ('M', 'L', 'XL');
  LOWESTPRICE = 5.00;
  HIGHESTPRICE = 19.99;


var
Size : TSize;
AllSize : TAllSize;
Input : string;
TempPizza : TPizza;
PizzaCatalogue : TPizzaArray;
CreatingPizza : boolean;

ECode : integer;
P  : real;

begin
CreatingPizza := True;

//Einzelne Pizza abfragen
while (CreatingPizza = True) do
begin

  WriteLn('Erstellen sie eine neue Pizza: (Mit X das Programm abbrechen) ');

  //Name eintragen
  repeat
    Write('Waehle einen Namen: ' );
    readln(Input);
    if length(Input) >= 5 then TempPizza.name := Input
  until (TempPizza.name = Input) or (uppercase(Input) = 'X');


  //Größe abfragen
  if uppercase(Input) = 'X' then CreatingPizza := False
  else
  begin
    AllSize := [sM , sL, sXL];
    repeat
      Write('Waehle eine Groesse: ');
      readln(Input);
      for Size in AllSize do
      begin
        if uppercase(Input) = SIZESTRING[Size] then TempPizza.size := Size
      end;
    until (uppercase(Input) = 'M') or (uppercase(Input) = 'L') or (uppercase(Input) = 'XL') or (uppercase(Input) = 'X');
  end;

  //Käse im Rand abfragen
  if uppercase(Input) = 'X' then CreatingPizza := False
  else 
  begin
    repeat
      Write('Kaese im Rand?');
      readln(Input);
      if uppercase(Input) = 'JA' then TempPizza.cheese := True
      Else if uppercase(Input) = 'NEIN' then TempPizza.cheese := False
      Else writeln('Ungueltige Eingabe. Bitte geben sie Ja oder Nein an.'); 
    until (uppercase(Input) = 'JA') or (uppercase(Input) = 'NEIN') or (uppercase(Input) = 'X');
  end;


  //Preis abfragen
  if uppercase(Input) = 'X' then CreatingPizza := False
  else
  begin
    repeat
      Write('Waehle den Preis: ');
      readln(Input);
      val(Input, P, ECode);
      if ECode = 0 then
      begin
        if length(Input) >= 4 then
          if (Input[length(Input)-2] = '.') and ((P >= LOWESTPRICE) and (P <= HIGHESTPRICE)) then TempPizza.price := P;
      end;
    until (uppercase(Input) = 'X') or (P >= LOWESTPRICE) and (P <= HIGHESTPRICE);
  end;


//Ausgabe der Informationen
if uppercase(Input) = 'X' then CreatingPizza := False
else
begin
  with TempPizza do
  begin
    Writeln('Bezeichnung: ', name);
    Writeln('Groesse: ', SIZESTRING[size]);
    Writeln('Kaese im Rand: ', cheese);
    Writeln('Preis: ', price :0:2);
  end;
end;

//Programm beenden
CreatingPizza := False;

end;






readln;
end.
