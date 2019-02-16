program Teil1;
(*
  Funktion:
  Berechnung der Tortenst�cke f�r jedes Kind und die Anzahl der verbleibenden St�cke.

  Autoren:
  Lars Sander und Andr� Kloodt

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
  Abfragen wie viele Kinder und Torten vorhanden sind und danach ausrechenden wie viele St�cken jedes Kind erh�lt.
  *)
  write('Wie viele Torten sind vorhanden?');
  readln(NumberOfCakes);
  write('Wie viele Kinder sind in der Kita?');
  readln(NumberOfKids);

  //Berechnen wie viele Tortenst�cke pro Kind vorhanden sind.
  NumberOfPieces:= NumberOfCakes * PIECES_OF_CAKE;
  PiecesPerKid:= NumberOfPieces div NumberOfKids;
  NumberOfRemainingPieces:= NumberOfPieces mod NumberOfKids;

 writeln('Bei ',PIECES_OF_CAKE,' St�cken pro Torte bekommt jedes Kind ',PiecesPerKid,' Tortenst�cke.');
 writeln('Es bleiben ',NumberOfRemainingPieces,' Tortenst�cke �brig.');

 readln;
end.
