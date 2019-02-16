program Project1;

{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils;

const
  LOWER_BORDER = 10301;
  UPPER_BORDER = 10302;

var
  p, e, i: integer;
  Even: boolean;
  Palindrom: boolean;

begin
  i := LOWER_BORDER;
  // Schleife für alle Zahlen von LOWER_BORDER bis UPPER_BORDER
  while i <= UPPER_BORDER do
  begin
    //------------------------------------------------------------------
    // Aktuelle Ziffer
    write(i:4);
    //------------------------------------------------------------------
    // Gerade?
    Even := (i mod 2) = 0;
    write(' gerade: ', Even:6);
    //------------------------------------------------------------------
    // Palindrom Test
    e := i;
    p := 0;
    repeat
      p := (p * 10) + e mod 10;
      e := e div 10;
    until (e = 0);

    Palindrom := i = p;
    write(' Palindrom: ', Palindrom:6);
    //------------------------------------------------------------------
    // Teiler?
    write(' Teiler: ');
    for e := 2 to i div 2 do
    begin
      if (i mod e = 0) then
        write(e, ' ');
    end;
    //------------------------------------------------------------------
    // Zeilenumbruch
    writeln;

    inc(i);
  end;

  readln;

end.
