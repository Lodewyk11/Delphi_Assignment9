unit assignment9_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { Tfrm2016Assignment9 }

  Tfrm2016Assignment9 = class(TForm)
    btnCmbArr: TButton;
    btnDoubleIntArray: TButton;
    btnDisplayIntArr: TButton;
    btnClearLstBox: TButton;
    btnDeleteSelected: TButton;
    btnInitStrArr: TButton;
    btnAssgnStrArr: TButton;
    btnCapStrArr: TButton;
    btnDisplayStrArr: TButton;
    btnInitIntArr: TButton;
    btnAssgnIntArr: TButton;
    edtDateTime: TEdit;
    grpLstBox: TGroupBox;
    grpStrArrOptions: TGroupBox;
    grpIntArrOptions: TGroupBox;
    imgBanner: TImage;
    lstBxResults: TListBox;
    memDescr: TMemo;
    procedure btnAssgnStrArrClick(Sender: TObject);
    procedure btnAssgnIntArrClick(Sender: TObject);
    procedure btnCapStrArrClick(Sender: TObject);
    procedure btnClearLstBoxClick(Sender: TObject);
    procedure btnCmbArrClick(Sender: TObject);
    procedure btnDeleteSelectedClick(Sender: TObject);
    procedure btnDisplayIntArrClick(Sender: TObject);
    procedure btnDisplayStrArrClick(Sender: TObject);
    procedure btnDoubleIntArrayClick(Sender: TObject);
    procedure btnInitIntArrClick(Sender: TObject);
    procedure btnInitStrArrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    {
      Define two arrays with indices ranging from 0 to nItems - 1.
      The size of the array will be nItems.
    }
    const nItems = 5;
    var
      nBasicsIntArray : array [0..(nItems - 1)] of integer;
      nBasicsStrArray : array [0..(nItems - 1)] of string;
  public
    { public declarations }
  end;

var
  frm2016Assignment9: Tfrm2016Assignment9;

implementation

{$R *.lfm}

{ Tfrm2016Assignment9 }

{ Create the date string and display it in a read only edit box. }
procedure Tfrm2016Assignment9.FormCreate(Sender: TObject);
var dDateTime : TDateTime;
begin
   dDateTime := Date() + Time();
   edtDateTime.Text := DateTimeToStr(dDateTime);
   edtDateTime.ReadOnly := TRUE;
end;

{ Initializes the integer array to all 0 values. }
procedure Tfrm2016Assignment9.btnInitIntArrClick(Sender: TObject);
var
   iCount : Integer;
begin
   // Loop through the array and set all values to 0.
   for iCount := 0 to (nItems - 1) do
   begin
     nBasicsIntArray[iCount] := 0;
   end;
end;

{ Capitalizes each string in the string array. }
procedure Tfrm2016Assignment9.btnCapStrArrClick(Sender: TObject);
var
   iCount : Integer;
begin
   { Loop through the array and set all values the the upper case of the current value,
     then overwrite the current value.
   }
   for iCount := 0 to (nItems - 1) do
   begin
     nBasicsStrArray[iCount] := UpperCase(nBasicsStrArray[iCount]);
   end;
end;
{ Clears the listbox }
procedure Tfrm2016Assignment9.btnClearLstBoxClick(Sender: TObject);
begin
  // Clear the list box.
  lstBxResults.Clear;
end;

{ Not sure what this button is supposed to do. Just display both arrays. }
procedure Tfrm2016Assignment9.btnCmbArrClick(Sender: TObject);
begin
   // Call the two procedures as if the buttons have been clicked one after another.
   btnDisplayIntArrClick(Sender);
   btnDisplayStrArrClick(Sender);
end;

{ Deletes the selected value from the list box.
  Does not delete anything from the arrays.
}
procedure Tfrm2016Assignment9.btnDeleteSelectedClick(Sender: TObject);
begin
   // Get the currently selected item in the list box and remove it by it's index.
   lstBxResults.Items.Delete(lstBxResults.Items.IndexOf(lstBxResults.GetSelectedText));
end;

{ Displays the values of the Integer array.
  The date and time value from the edit box is used.
}
procedure Tfrm2016Assignment9.btnDisplayIntArrClick(Sender: TObject);
var
   iCount : Integer;
begin
   // Print the integer array heading and date from the edit box.
   lstBxResults.Items.Add('Integer array : ' + edtDateTime.Text);

   // Loop through the array and add the value int value to the list box as a string.
   for iCount := 0 to (nItems - 1) do
   begin
    lstBxResults.Items.Add(IntToStr(nBasicsIntArray[iCount]));
   end;

   // Print the footer, indicating the end of the array values.
   lstBxResults.Items.Add('****')
end;

{ Displays the string array contents.
  The date time value from the edit box is used.
}
procedure Tfrm2016Assignment9.btnDisplayStrArrClick(Sender: TObject);
var
   iCount : Integer;
begin
   // Print the string array heading and date from the edit box.
   lstBxResults.Items.Add('String array : ' + edtDateTime.Text);

   // Loop through the array and add the value int value to the list box as a string.
   for iCount := 0 to (nItems - 1) do
   begin
    lstBxResults.Items.Add(nBasicsStrArray[iCount]);
   end;

   // Print the footer, indicating the end of the array values.
   lstBxResults.Items.Add('****')
end;

procedure Tfrm2016Assignment9.btnDoubleIntArrayClick(Sender: TObject);
var
   iCount : Integer;
begin
   { Loop through the array double the current value of the array item,
     then overwrite the original value. }
   for iCount := 0 to (nItems - 1) do
   begin
     nBasicsIntArray[iCount] := nBasicsIntArray[iCount] * 2;
   end;
end;

{ Assigns values in the string array to the values entered by the user. }
procedure Tfrm2016Assignment9.btnAssgnStrArrClick(Sender: TObject);
var
   iCount : Integer;
   sString : String;
begin
   { Loop through the array and promt the user for input at every array item.
     Assign the user values to the array.
   }
   for iCount := 0 to (nItems - 1) do
   begin
     sString := InputBox('Please input a string value', 'Value ' + IntToStr(iCount), '0');
     nBasicsStrArray[iCount] := sString;
   end;
end;


{ Assigns values in the string array to the values entered by the user. }
procedure Tfrm2016Assignment9.btnAssgnIntArrClick(Sender: TObject);
var
   iCount : Integer;
   sString : String;
begin
   { Loop through the array and promt the user for input at every array item.
     Assign the user values to the array as an integer.
   }
   for iCount := 0 to (nItems - 1) do
   begin
     sString := InputBox('Please input an nnteger value', 'Value ' + IntToStr(iCount), '0');
     nBasicsIntArray[iCount] := StrToInt(sString);
   end;
end;

{ Initializes the string array to all '0' strings. }
procedure Tfrm2016Assignment9.btnInitStrArrClick(Sender: TObject);
var
   iCount : Integer;
begin
   // Loop through the array setting all values to the string literal '0'
   for iCount := 0 to (nItems - 1) do
   begin
     nBasicsStrArray[iCount] := '0';
   end;
end;

end.

