unit RegisterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Registry, StdCtrls;

type
  TRegisterForm = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterForm: TRegisterForm;

implementation

{$R *.dfm}
function NameToCode(RegName:String;out RegString:String):Boolean;
var i,index,strlen:Integer;
    TempNum:BYTE;
    EncryptArray:array[1..20] of BYTE;
const  EncryptString:array[0..20] of String[21]=
             ('GreatXGQGamePaladinII',
              'asdasda$%^&*24tsgd6gf',
              'AAGUYXLKjljhda^*(dfs9',
              ')(*&^*()__jnMfcdlsaDJ',
              '&jldffggdfg****dasdff',
              '345874fBNNKhdfll;~1!2',
              '>>.,f....,cwe%TGhj3rf',
              '^&&(*ncfg0nldskf4tl$$',
              'fgvfdsg fgfdgdg   fa!',
              'HOw fdo you trun this',
              'What do you want fwgg',
              'MUYN c~3490&68xn7DT8O',
              'GBEKEGm )(845+_F_FGHH',
              '6C35CBV6BN88UCF3C346V',
              '165CVCBNM09FVN,O6/.,B',
              '7U6HFR6YHLO9@~L`~~   ',
              'T5VBNMynmCFMVM4Clku^#',
              'TBNBVCXVBVCVBN9CTOVVB',
              'ytiuB,Uuyg,/*&%TYJ;LK',
              'FHVUIJ5098CK;;3C905OP',
              'CV436-40J60VCCKLMZ%^&'
              );
const Validstring='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

begin
Result:=false;
RegString:='';
strlen:=Length(RegName);
if strlen<4 then exit;

/////key change//////////
TempNum:=0;
for i:=1 to strlen do TempNum:=TempNum+Ord(RegName[i]);
tempNUm:=abs(tempNum);
index:=TempNum mod 21;
///////fix length//////
if strlen<10 then RegName:=RegName+Copy(Validstring,1,10-strlen) else
   RegName:=Copy(RegName,1,10);

TempNum:=1;
for i:=1 to 10 do
begin
TempNum:=TempNum*((Ord(RegName[i]) mod 21)+1);
end;

DEC(TempNum,strLen);
tempNUm:=abs(tempNum);
inc(index,TempNum);

index:=index mod 21;

for i:=1 to 10 do  EncryptArray[i]:=Ord(EncryptString[index][i]);

for i:=1 to 10 do
begin
 if i=6 then RegString:=RegString+'-';
 TempNum:=Ord(RegName[i]) xor EncryptArray[i];
 if (Pos(chr(TempNum),Validstring)>0) then  RegString:=RegString+chr(TempNum) else
  begin
   TempNum:=TempNUm mod 36;  ///36 letter  mod :=0.. 35
   RegString:=RegString+Validstring[TempNum+1];
  end;
end;
Result:=True;
end;


procedure TRegisterForm.Button1Click(Sender: TObject);
var tempstring:String;
begin
if not NameToCode(Edit1.text,tempstring) then showmessage('invalid name');
Edit2.text:=tempstring;
end;

procedure TRegisterForm.Button2Click(Sender: TObject);
var InTextF,OutTextF:TextFile;
     ins,outs:string;
begin
if OpenDialog1.Execute then
  begin
   assignFile(IntextF,OpenDialog1.FileName);
   FileMode := 0;  {Set file access to read only }
   Reset(IntextF);
  end;


if SaveDialog1.Execute then
 begin
assignFile(OuttextF,SaveDialog1.FileName);
   FileMode := 2;  {Set file access to read only }
   ReWrite(OuttextF);
   WriteLn(OutTextF,'RegName','     ','RegKey');
   WriteLn(OutTextF,'-------------------------');
while(not EOF(IntextF)) do
 begin
   ReadLn(InTextF,Ins);
   if NameToCode(Ins,Outs) then
    begin
     WriteLn(OutTextF,ins,'     ',Format('%15s',[Outs]));
    end;
 end;

CloseFile(OutTextF);
end ;
 CloseFile(InTextF);
showmessage(SaveDialog1.FileName+'Create!');


end;

end.
