unit MyCalcUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;
resourcestring
String_overflow='溢出,不能计算这样的操作数';
type
  TMyCalcForm = class(TForm)
    GroupBox1: TGroupBox;
    dec_sb: TSpeedButton;
    Dec_Edit: TEdit;
    hex_Edit: TEdit;
    hex_sb: TSpeedButton;
    Bin_Edit: TEdit;
    bin_sb: TSpeedButton;
    Num1_Edit: TEdit;
    NUm2_Edit: TEdit;
    Op_rg: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    inc1_sb: TSpeedButton;
    Label3: TLabel;
    Result1_Edit: TEdit;
    dec1_sb: TSpeedButton;
    not1_sb: TSpeedButton;
    AddDec1_sb: TSpeedButton;
    adddec2_sb: TSpeedButton;
    inc2_sb: TSpeedButton;
    dec2_sb: TSpeedButton;
    not2_sb: TSpeedButton;
    calc_sb: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Result2_Edit: TEdit;
    procedure dec_sbClick(Sender: TObject);
    procedure hex_sbClick(Sender: TObject);
    procedure bin_sbClick(Sender: TObject);
    procedure calc_sbClick(Sender: TObject);
    procedure inc1_sbClick(Sender: TObject);
    procedure inc2_sbClick(Sender: TObject);
    procedure dec1_sbClick(Sender: TObject);
    procedure dec2_sbClick(Sender: TObject);
    procedure not1_sbClick(Sender: TObject);
    procedure not2_sbClick(Sender: TObject);
    procedure AddDec1_sbClick(Sender: TObject);
    procedure adddec2_sbClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyCalcForm: TMyCalcForm;

implementation

{$R *.dfm}
function MyIntToBinStr(Value:Int64;Size: Integer): String;
var
 i: Integer;
 Tempint64:int64;
begin
 Result:='';
 Tempint64:=1;
 for i:=Size downto 1 do begin
    if Value and (Tempint64 shl (i-1))<>0 then begin       ////use Tempint64 instead 1
       Result:=Result+'1';
    end else  Result:=Result+'0';
                        end;
end;

function MyBinToInt(ValueStr:String):int64;
var
 Len: Integer;
 i:integer;
 Tempint64:int64;
begin
 Result:=0;
 Tempint64:=1;
 Len:=Length(ValueStr);
 if Len>0 then
 begin
  for i:=Len Downto 1 do
   begin
    if (ValueStr[i]<>'1') and (ValueStr[i]<>'0') then Result:=0;
    if ValueStr[i]='1' then
    Result:=Result+(Tempint64 shl (Len-i));     ////use Tempint64 instead 1

   end;
  end;
end;


procedure TMyCalcForm.dec_sbClick(Sender: TObject);
var tempint64:int64;
    Ecode:integer;
begin
val(Dec_edit.Text,tempint64,Ecode);
if Ecode=0 then
begin
Hex_edit.Text:=intToHex(tempint64,1);
Bin_edit.Text:=MyintToBinStr(tempint64,Length(Hex_edit.Text)*4);
end;
end;

procedure TMyCalcForm.hex_sbClick(Sender: TObject);
var tempint64:int64;
    Ecode:integer;
begin
val('$'+hex_edit.Text,tempint64,Ecode);
if Ecode=0 then
begin
Dec_edit.Text:=intToStr(tempint64);
Bin_edit.Text:=MyintToBinStr(tempint64,Length(Hex_edit.Text)*4);
end;
end;

procedure TMyCalcForm.bin_sbClick(Sender: TObject);
var tempint64:int64;
begin
tempint64:=MyBinToInt(Bin_edit.Text);
Dec_edit.Text:=inttoStr(tempint64);
Hex_edit.Text:=inttoHex(tempint64,1);

end;

procedure TMyCalcForm.calc_sbClick(Sender: TObject);
var TempInt641:Int64;
    Tempint642:int64;
    TempDouble:Double;
    Ecode:integer;
begin
val(Num1_Edit.text,TempInt641,Ecode);
if Ecode>0 then Exit;
val(Num2_edit.text,TempInt642,Ecode);
if Ecode>0 then Exit;

   Try

case Op_rg.ItemIndex of
0: begin
   Result1_edit.Text:=intToStr(TempInt641+TempInt642);
   Result2_edit.Text:=intToHex(TempInt641+TempInt642,1);
   end;
1: begin
   Result1_edit.Text:=intToStr(TempInt641-TempInt642);
   Result2_edit.Text:=intToHex(TempInt641-TempInt642,1);
   end;
2: begin
   Result1_edit.Text:=intToStr(TempInt641*TempInt642);
   Result2_edit.Text:=intToHex(TempInt641*TempInt642,1);
   end;
3: begin
   Result1_edit.Text:=FloatToStr(TempInt641/TempInt642);
   Result2_edit.Text:=intToHex(TempInt641 div TempInt642,1);
   end;
4: begin
   Result1_edit.Text:=intToStr(TempInt641 mod TempInt642);
   Result2_edit.Text:=intToHex(TempInt641 mod TempInt642,1);
   end;
5: begin
   TempDouble:=TempInt641;   //ln 只认浮点数
   TempDouble:=Exp( Ln(TempDouble)* TempInt642 );
   Result1_edit.Text:=FloatToStr( TempDouble );
   Result2_edit.Text:=intToHex( Round(TempDouble),1 );
   end;
end;
   except
   Showmessage(String_overflow);
   end;


end;

procedure TMyCalcForm.inc1_sbClick(Sender: TObject);
var TempInt641:Int64;
    Ecode:integer;
begin
val(Num1_Edit.text,TempInt641,Ecode);
if Ecode>0 then Exit;
inc(TempInt641);
Num1_Edit.text:=intToStr(TempInt641);
end;




procedure TMyCalcForm.inc2_sbClick(Sender: TObject);
var TempInt642:Int64;
    Ecode:integer;
begin
val(Num2_Edit.text,TempInt642,Ecode);
if Ecode>0 then Exit;
inc(TempInt642);
Num2_Edit.text:=intToStr(TempInt642);
end;

procedure TMyCalcForm.dec1_sbClick(Sender: TObject);
var TempInt641:Int64;
    Ecode:integer;
begin
val(Num1_Edit.text,TempInt641,Ecode);
if Ecode>0 then Exit;
Dec(TempInt641);
Num1_Edit.text:=intToStr(TempInt641);
end;


procedure TMyCalcForm.dec2_sbClick(Sender: TObject);
var TempInt642:Int64;
    Ecode:integer;
begin
val(Num2_Edit.text,TempInt642,Ecode);
if Ecode>0 then Exit;
Dec(TempInt642);
Num2_Edit.text:=intToStr(TempInt642);
end;

procedure TMyCalcForm.not1_sbClick(Sender: TObject);
var TempInt641:Int64;
    Ecode:integer;
begin
val(Num1_Edit.text,TempInt641,Ecode);
if Ecode>0 then Exit;
TempInt641:=$FFFFFFFF-TempInt641;
Num1_Edit.text:=intToStr(TempInt641);
end;

procedure TMyCalcForm.not2_sbClick(Sender: TObject);
var TempInt642:Int64;
    Ecode:integer;
begin
val(Num2_Edit.text,TempInt642,Ecode);
if Ecode>0 then Exit;
TempInt642:=$FFFFFFFF-TempInt642;
Num2_Edit.text:=intToStr(TempInt642);
end;

procedure TMyCalcForm.AddDec1_sbClick(Sender: TObject);
var TempInt641:Int64;
    Ecode:integer;
begin
val(Num1_Edit.text,TempInt641,Ecode);
if Ecode>0 then Exit;
TempInt641:=0-TempInt641;
Num1_Edit.text:=intToStr(TempInt641);
end;


procedure TMyCalcForm.adddec2_sbClick(Sender: TObject);
var TempInt642:Int64;
    Ecode:integer;
begin
val(Num2_Edit.text,TempInt642,Ecode);
if Ecode>0 then Exit;
TempInt642:=0-TempInt642;
Num2_Edit.text:=intToStr(TempInt642);
end;

end.
