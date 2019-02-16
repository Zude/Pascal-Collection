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
  Wörter: integer;
  AnzahlDerVokale: integer;
  SatzDoppelt: string;
  Eingabe: char;
  i: integer;
  VerdoppelterSatz : string;

begin

  repeat
    writeln('A) Gib einen Satz ein ');
    writeln('B) Anzahl der Wörter bestimmen');
    writeln('C) Anzahl der Vokale bestimmen');
    writeln('D) Alle Wörter im Satz verdoppeln');
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
          if Length(Eingabe) > 0 then      // Prüfen ob eingabe Leer ist
          begin
          SatzDoppelt := Satz;

          writeln('Anzahl der Wörter bestimmen');
          Wörter := 0;
          while pos(Leerzeichen, SatzDoppelt) > 0 do   // Prüfen ob es Leerzeichen gibt
          begin
            inc(Wörter);
            delete(SatzDoppelt, pos(Leerzeichen, SatzDoppelt), 1);  // Lösche das Leerzeichen
          end;
          inc(Wörter);
          writeln(Wörter);
        end
       end;
      'C':
        begin
          if Length(Eingabe) > 0 then    // Prüfen ob eingabe Leer ist
          begin
          AnzahlDerVokale := 0;
          SatzDoppelt := Satz;

          writeln('Anzahl der Vokale bestimmen');

          for i := 1 to length(Vokale) do
          begin
            while pos(Vokale[i], SatzDoppelt) > 0 do    // Prüft jede Stelle nach den Vokalen
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
          if Length(Eingabe) > 0 then   // Prüfen ob eingabe Leer ist
          begin
          SatzDoppelt := Satz;
          VerdoppelterSatz := '';

          writeln('Alle Wörter im Satz verdoppeln');

          while pos(Leerzeichen, SatzDoppelt) > 0 do    // Prüfen ob es Leerzeichen gibt
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
          writeln('Bis zum nächsten mal');
        end;

    end;

  until Eingabe = 'X';

  readln;

end.
