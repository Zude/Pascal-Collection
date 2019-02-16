program Aufgabe6;

{$APPTYPE CONSOLE}
{$R+,Q+,X-}

uses
  System.SysUtils;

type
  TPointOfInterest = (POIDom, POIHafen, POIHagenbeck, POIMichel, POIRathaus);
  TSelectedPOI = set of TPointOfInterest;

const
  PEOPLE = 3;
  POI_NAMES: array [TPointOfInterest] of string = ('Dom', 'Hafen', 'Hagenbeck',
    'Michel', 'Rathaus');

var
  POIOfGroup: array [1 .. PEOPLE] of TSelectedPOI;
  Input: string;
  j, i: integer;
  k: TPointOfInterest;
  AveragePOI, OutPOI, UserPOIs: TSelectedPOI;

begin
  // --------------------------------------------------------------------------------------------------------------
  // Schleife geht alle Personen durch
  for i := 1 to PEOPLE do
  begin
    write('Welche Sehenswürdigekeiten möchtest du anschauen?');
    UserPOIs := [];
    repeat

      readln(Input);
      if Input <> '' then
      begin
      Input := Trim(Input);
        // ---------------------------------------------------------------------------------------------------------
        // Element speichern
        if Input[1] = '+' then
        begin
          delete(Input, 1, 1);
          Input := Trim(Input);

          // Überprüfe eingabe und addiere Element
          for k := Low(POI_NAMES) to High(POI_NAMES) do
          begin
            if Input = POI_NAMES[k] then
              UserPOIs := UserPOIs + [k];
          end;

        end
        // ----------------------------------------------------------------------------------------------------------
        // Element entfernen
        Else if Input[1] = '-' then
        begin
          delete(Input, 1, 1);
          Input := Trim(Input);

          // Überprüfe eingabe und lösche Element
          for k := Low(POI_NAMES) to High(POI_NAMES) do
          begin
            if Input = POI_NAMES[k] then
              UserPOIs := UserPOIs - [k];
          end;

        end
        // -------------------------------------------------------------------------------------------------------------

      end;

    until (Input = 'X') or (Input = 'x');

    // Menge der Person in Array zuweisen
    POIOfGroup[i] := UserPOIs;

  end;
  // Ende der Nutzer Abfrage
  // -----------------------------------------------------------------------------------------------------------

  // Ausgabe der Elemente jeder Person
  for i := 1 to PEOPLE do
  begin
    Write('Person ', i, ': ');
    for k in POIOfGroup[i] do
      Write(POI_NAMES[k], ' ');
    WriteLn;
  end;
  // -----------------------------------------------------------------------------------------------------------
  // Ausgabe Differenzmenge
  WriteLn;
  Write('Nicht genannte Optionen: ');
  OutPOI := [POIDom, POIHafen, POIHagenbeck, POIMichel, POIRathaus];

  for i := 1 to PEOPLE do
  begin
    OutPOI := OutPOI - POIOfGroup[i];
  end;
  for k in OutPOI do
    Write(POI_NAMES[k], ' ');
  // -----------------------------------------------------------------------------------------------------------
  // Ausgabe der Schnittmenge
  WriteLn;
  Write('Mehrfach gennante Elemente: ');
  OutPOI := [];

  for i := 1 to PEOPLE do
  begin
    AveragePOI := [];
    for j := (i+1) to PEOPLE do
    begin
        AveragePOI := AveragePOI + (POIOfGroup[i] * POIOfGroup[j]);
      // Alle Elemente die i mit den anderen gemein hat.
    end;

    OutPOI := OutPOI + AveragePOI;
    // Füge die gemeinsamen Elemente in die Ausgabe-Menge ein
  end;

  for k in OutPOI do
    Write(POI_NAMES[k], ' ');
  // -----------------------------------------------------------------------------------------------------------
  readln;

end.
