program build;


{$APPTYPE CONSOLE}
{$R+,Q+,X-}

(*
Programmbeschreibung:
Das Programm liest einen Satz vom Nutzer ein und führt verschiedene Operationen durch.
- Groß- und Kleinschreibung vertauschen
- Den Satz spiegeln
- Überprüfen ob ein Palindrom eingeben wurde

Autoren: 
Lars Sander und André Kloodt
Datum: 27.06.2016
*)

uses
System.SysUtils;

//Funktionen


function MirrorString (s : string) : string;
(*
Beschreibung:
Der übergebene String wird gespiegelt

@param
s - String der gespielt werden soll

@out
Der gespiegelte String wird zurückgegeben

*)

begin
   if s = '' then MirrorString := ''
   Else
        MirrorString := copy(s, Length(s), 1) +  MirrorString(copy(s, 1, Length(s)-1) );
end;

function isPalindrome (s : string) : boolean;
(*
Beschreibung:
CheckPalindrom überprüft ob ein String ein Palindrom.

@param
s - String der auf Palindrom Eigenschaft überprüft wird

@Out
Ergebnis ist Boolean-Wert ob die Palindrom Eigenschaften erfüllt wurden

*)
begin
  IsPalindrome := s = MirrorString(s);
end;

function SwitchUpperAndLowerCase (s: string) : string;
(*
Beschreibung:
Es werden die Groß- und Kleinschreibung der Buchstaben im String vertauscht

@param
s - String bei dem die Groß- und Kleinschreibung ausgetauscht werden soll
@out
Der String mit vertauschter Groß- und Kleinschreibung

*)
var
    i : integer;
    lowS : string;

begin
    lowS := LowerCase(s);

    for i:=1 to Length(s) do
      begin
        if upcase(s[i]) = s[i] then
          s[i] := lowS[i]
        Else
            s[i] := UpCase(s[i]);
      end;

    SwitchUpperAndLowerCase := s;
end;

function ReadString(var input : string): boolean;
(*
Beschreibung:
Funtion liest einen echten Satz oder die Eingabe von X ein

@out
Gibt den vom Nutzer eingebenen Satz als String zurück

*)
begin
  repeat
    ReadLn(Input);

  until (Input <> '') or (uppercase(Input) = 'X');

  ReadString := uppercase(Input) <> 'X';

end;

procedure Output (s : string);

(*
Beschreibung:
Ruft alle Funktionen des Programms auf

@param
s - String der für die weiteren Funktionen genutzt wird

*)

begin 
    Writeln('Original-String: ', s);
    Writeln('Gross-/Klein: ', SwitchUpperAndLowerCase(s));
    WriteLn('Gespiegelt: ', MirrorString(s));
    WriteLn('Ist Palindrom: ', IsPalindrome(s));
  
end;



var
    Sentence :string;

begin
  
  WriteLn('Satz eingeben: ');
  if not ReadString(Sentence) then
    WriteLn('Programm wird beenden')
  else
    Output(Sentence);


readln;
end.