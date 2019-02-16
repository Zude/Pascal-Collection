program build;

{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils;

type
  TSize = (sM, sL, sXL);
  TAllSize = set of TSize;

  TPizza = record
    name: string;
    size: TSize;
    cheese: boolean;
    price: real;
  end;

const
  SIZESTRING: array [TSize] of string = ('M', 'L', 'XL');
  LOWESTPRICE = 5.00;
  HIGHESTPRICE = 19.99;
  NEWPIZZAS = 3;

var
  size: TSize;
  AllSize: TAllSize;
  Input: string;
  TempPizza: TPizza;
  PizzaCatalogue: array [1 .. NEWPIZZAS] of TPizza;
  CreatingPizza: boolean;

  ECode, i, t, z: integer;
  P, UserMin, UserMax: real;

begin

  z := 0;
  // Schleife für mehere Pizzen
  for i := 1 to NEWPIZZAS do
  begin

    if uppercase(Input) <> 'X' then
      CreatingPizza := True;

    // Einzelne Pizza abfragen
    while (CreatingPizza = True) do
    begin

      WriteLn('Erstellen sie eine neue Pizza: (Mit X das Programm abbrechen)');

      // Name eintragen
      repeat
        Write('Waehle einen Namen:');
        readln(Input);
        if length(Input) >= 5 then
          TempPizza.name := Input until (TempPizza.name = Input) or
            (uppercase(Input) = 'X');

        // Größe abfragen
        if uppercase(Input) = 'X' then
          CreatingPizza := False
        else
        begin
          AllSize := [sM, sL, sXL];
          repeat
            Write('Waehle eine Groesse: ');
            readln(Input);
            for size in AllSize do
            begin
              if uppercase(Input) = SIZESTRING[size] then
                TempPizza.size := size
            end;
          until (uppercase(Input) = SIZESTRING[TempPizza.size]) or
            (uppercase(Input) = 'X');
        end;

        // Käse im Rand abfragen
        if uppercase(Input) = 'X' then
          CreatingPizza := False
        else
        begin
          repeat
            Write('Kaese im Rand?');
            readln(Input);
            if uppercase(Input) = 'JA' then
              TempPizza.cheese := True
            Else if uppercase(Input) = 'NEIN' then
              TempPizza.cheese := False;
          until (uppercase(Input) = 'JA') or (uppercase(Input) = 'NEIN') or
            (uppercase(Input) = 'X');
        end;

        // Preis abfragen
        if uppercase(Input) = 'X' then
          CreatingPizza := False
        else
        begin
          repeat
            Write('Waehle den Preis: ');
            readln(Input);
            val(Input, P, ECode);
          until (uppercase(Input) = 'X') or (P >= LOWESTPRICE) and
            (P <= HIGHESTPRICE) and (length(Input) >= 4) and
            (Input[length(Input) - 2] = '.');

          if uppercase(Input) <> 'X' then
            TempPizza.price := P;

        end;

        // Nur vollständige Pizzen speichern
        if uppercase(Input) = 'X' then
          CreatingPizza := False
        else
        begin
          PizzaCatalogue[i] := TempPizza;
          inc(z);
        end;

        // Pizza wurde erstellt, Schleife beenden
        CreatingPizza := False;
        WriteLn;

      end;

    end;

    // Abfrage der Preisspanne

    if (z > 0) then
    begin

      repeat

        if UserMin = 0 then
          write('Geben sie die untere Preisgrenze ein: ')
        Else
          write('Geben sie die obere Preisgrenze ein: ');

        readln(Input);
        val(Input, P, ECode);
        if (ECode <> 0) or (length(Input) < 4) then
          WriteLn('Keine gueltige Eingabe!');

        if length(Input) >= 4 then
          if (Input[length(Input) - 2] = '.') then
            if UserMin = 0 then
              UserMin := P

            Else
              UserMax := P;

      until (UserMin >= LOWESTPRICE) and (UserMax > UserMin) and
        (UserMax <= HIGHESTPRICE);

      repeat

      until (P >= LOWESTPRICE) and (P <= HIGHESTPRICE);

      // Ausgabe der Informationen
      for t := low(PizzaCatalogue) to high(PizzaCatalogue) do
      begin
        with PizzaCatalogue[t] do
        begin
          if (name <> '') and ((price >= UserMin) and (price <= UserMax)) then
          begin
            WriteLn;
            WriteLn(t, '. Pizza:');
            WriteLn('Bezeichnung: ', name);
            WriteLn('Groesse: ', SIZESTRING[size]);
            WriteLn('Kaese im Rand: ', cheese);
            WriteLn('Preis: ', price:0:2);
            WriteLn;
          end;
        end;

      end;
    end;

    readln;

end.
