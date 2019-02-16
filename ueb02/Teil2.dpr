program Teil2;
 (*
  Funktion:
  Abfrage der Vorhanden Tortensorten und vergleich der Anzahl.

  Autoren:
  Lars Sander und Andr� Kloodt

  Datum:
  17.05.2016

*)
{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils,
  System.Math;

var
  NumberOfChocolatecakes: Byte;
  NumberOfLemoncakes: Byte;
  NumberOfApplecakes: Byte;
  LargestAmount: Byte;
  SmallestAmount: Byte;

begin
  (* Funktionsweise:
     Abfrage der Anzahl der Torten und danach vergleich der Anzahl aller Torten. Danach folgt die Ausgabe der Tortensorte
     mit der gr��ten und kleinsten Anzahl an St�cken. Ausserdem wird angezeigt, ob von jeder Sorte Torten vorhanden sind.
  *)


  write('Wie viele Schokoladentorten sind vorhanden?');
  readln(NumberOfChocolatecakes);
  write('Wie viele Zitronentorten sind vorhanden?');
  readln(NumberOfLemoncakes);
  write('Wie viele Apfeltorten sind vorhanden?');
  readln(NumberOfApplecakes);

  //Vergleich der Anzahl von jeder Tortensorte
  largestAmount := max(NumberOfChocolatecakes, max(NumberOfLemoncakes,
    NumberOfApplecakes));
  smallestAmount := min(NumberOfChocolatecakes,
    max(NumberOfLemoncakes, NumberOfApplecakes));

  //�berpr�fen welche Tortensorte die gr��ten und kleinsten sind
  writeln('Das h�ufigste Geb�ck ist:');
  writeln('Schokoladentorte: ', LargestAmount = NumberOfChocolatecakes);
  writeln('Zitronentorte: ', LargestAmount = NumberOfLemoncakes);
  writeln('Apfeltorte: ', LargestAmount = NumberOfApplecakes);

  writeln('Das seltenste Geb�ck ist:');
  writeln('Schokoladentorte: ', SmallestAmount = NumberOfChocolatecakes);
  writeln('Zitronentorte: ', SmallestAmount = NumberOfLemoncakes);
  writeln('Apfeltorte: ', SmallestAmount = NumberOfApplecakes);

  //�berpr�fen ob von jeder Sorte Torten vorhanden sind
  writeln('Es ist von jedem Geb�ck mindestens eines vorhanden: ',
    (NumberOfChocolatecakes >= 1) and (NumberOfLemoncakes >= 1) and
    (NumberOfApplecakes >= 1));
  writeln('Es ist mindestens ein Geb�ck vorhanden: ',
    (NumberOfChocolatecakes >= 1) or (NumberOfLemoncakes >= 1) or
    (NumberOfApplecakes >= 1));

  readln;

end.
