program Teil1;
(*
  Funktion:
  Berechnung der Tortenstücke für jedes Kind und die Anzahl der verbleibenden Stücke.

  Autoren:
  Lars Sander und André Kloodt

  Datum:
  17.05.2016

*)
{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils;

const
  PIECES_OF_CAKE = 26;

var
  NumberOfKids:   Byte;
  NumberOfCakes:  Byte;
  NumberOfPieces: Byte;
  NumberOfRemainingPieces:  Byte;
  PiecesPerKid: Byte;

begin
  (* Funktionsweise:
  Abfragen wie viele Kinder und Torten vorhanden sind und danach ausrechenden wie viele Stücken jedes Kind erhält.
  *)
  write('Wie viele Torten sind vorhanden?');
  readln(NumberOfCakes);
  write('Wie viele Kinder sind in der Kita?');
  readln(NumberOfKids);

  //Berechnen wie viele Tortenstücke pro Kind vorhanden sind.
  NumberOfPieces:= NumberOfCakes * PIECES_OF_CAKE;
  PiecesPerKid:= NumberOfPieces div NumberOfKids;
  NumberOfRemainingPieces:= NumberOfPieces mod NumberOfKids;

 writeln('Bei ',PIECES_OF_CAKE,' Stücken pro Torte bekommt jedes Kind ',PiecesPerKid,' Tortenstücke.');
 writeln('Es bleiben ',NumberOfRemainingPieces,' Tortenstücke übrig.');

 readln;
end.
