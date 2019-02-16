program Aufgabe5;

{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils;

const
  Vokale = 'AEIOUaeiou';
  Leerzeichen = ' ';

var
  Satz: string;
  W�rter: integer;
  AnzahlDerVokale: integer;
  SatzDoppelt: string;
  Eingabe: char;
  i: integer;
  VerdoppelterSatz : string;

begin

  repeat
    writeln('A) Gib einen Satz ein ');
    writeln('B) Anzahl der W�rter bestimmen');
    writeln('C) Anzahl der Vokale bestimmen');
    writeln('D) Alle W�rter im Satz verdoppeln');
    writeln('X) ende');

    readln(Eingabe);

    Eingabe := upcase(Eingabe);

    case Eingabe of
      'A':
        begin
          write('Bitte geben Sie einen Satz ein: ');
          readln(Satz);
        end;
      'B':
        begin
          if Length(Eingabe) > 0 then      // Pr�fen ob eingabe Leer ist
          begin
          SatzDoppelt := Satz;

          writeln('Anzahl der W�rter bestimmen');
          W�rter := 0;
          while pos(Leerzeichen, SatzDoppelt) > 0 do   // Pr�fen ob es Leerzeichen gibt
          begin
            inc(W�rter);
            delete(SatzDoppelt, pos(Leerzeichen, SatzDoppelt), 1);  // L�sche das Leerzeichen
          end;
          inc(W�rter);
          writeln(W�rter);
        end
       end;
      'C':
        begin
          if Length(Eingabe) > 0 then    // Pr�fen ob eingabe Leer ist
          begin
          AnzahlDerVokale := 0;
          SatzDoppelt := Satz;

          writeln('Anzahl der Vokale bestimmen');

          for i := 1 to length(Vokale) do
          begin
            while pos(Vokale[i], SatzDoppelt) > 0 do    // Pr�ft jede Stelle nach den Vokalen
            begin
              inc(AnzahlDerVokale);
              delete(SatzDoppelt, pos(Vokale[i], SatzDoppelt), 1);
            end;
          end;
          writeln(AnzahlDerVokale);
        end
       end;
      'D':
        begin
          if Length(Eingabe) > 0 then   // Pr�fen ob eingabe Leer ist
          begin
          SatzDoppelt := Satz;
          VerdoppelterSatz := '';

          writeln('Alle W�rter im Satz verdoppeln');

          while pos(Leerzeichen, SatzDoppelt) > 0 do    // Pr�fen ob es Leerzeichen gibt
          begin
          VerdoppelterSatz := VerdoppelterSatz + copy(SatzDoppelt,1,pos(Leerzeichen, SatzDoppelt)) + copy(SatzDoppelt,1,pos(Leerzeichen, SatzDoppelt));
          delete(SatzDoppelt,1,pos(Leerzeichen, SatzDoppelt));
          end;
          VerdoppelterSatz := VerdoppelterSatz + SatzDoppelt + Leerzeichen + SatzDoppelt;

          Writeln(VerdoppelterSatz);
        end
      end;
      'X':
        begin
          writeln('Bis zum n�chsten mal');
        end;

    end;

  until Eingabe = 'X';

  readln;

end.
