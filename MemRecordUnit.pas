unit MemRecordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;
resourcestring
String_MemEditTitle='�ڴ�鿴��༭: ';
String_MemEditHelp='����ʮ������������ǰ�� $ (����: $10 ���� 16)'#13#10+
                   '@���б�����ֱ�Ӱ���1~F�޸�'#13#10+
                   '@���ݿ���������������������,���ǰ������Ͱ�ťֱ���޸�.'#13#10+
                   '@������˫���༭�������߱༭ָ�����ڴ��ַ. ' ;
String_maxLockNum='̫���������ַ(���%d),��(�����)ɾ���������õĵ�ַ.';
String_AddToLockOk='�ɹ�����������ַ�б�.';
String_ModifyLockOK='�༭��������Ŀ�ɹ�.';
String_DirectlyModifyOK='ֱ���޸��ڴ�ɹ�.';
String_DirectlyModifyBAD='�޸�ʧ��,�õ�ַ��ϵͳд����.';
String_needAddLock='����������ַ�б�';
String_needEditLock='�༭��������Ŀ';
String_tolongString='�ı䳬��16���ַ�,����<�ڴ�鿴���޸�> �Ի���';
String_TaskName='������:';

type
  TMemRecordForm = class(TForm)
    Label1: TLabel;
    Name_CB: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MemRecord_info_LB: TLabel;
    Address_Edit: TEdit;
    value_edit: TEdit;
    Lock_valuetype_cb: TComboBox;
    AddorMod_Sb: TSpeedButton;
    close_sb: TSpeedButton;
    modify_sb: TSpeedButton;
    LockType_Rg: TRadioGroup;
    Calc_sb: TSpeedButton;
    Help_sb: TSpeedButton;
    mem_sb: TSpeedButton;
    TaskName_Edit: TEdit;
    procedure close_sbClick(Sender: TObject);
    procedure Help_sbClick(Sender: TObject);
    procedure Calc_sbClick(Sender: TObject);
    procedure Lock_valuetype_cbChange(Sender: TObject);
    procedure modify_sbClick(Sender: TObject);
    procedure mem_sbClick(Sender: TObject);
    procedure AddorMod_SbClick(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure FormRefresh;
    { Public declarations }
  end;

var
  MemRecordForm: TMemRecordForm;

var Task_name:String;
    Lock_Name:String;
    Lock_Address:Dword;
    Lock_value:String;
    Lock_ValueType:integer;
    Lock_Type:Integer;
    Lock_Info:Integer;


implementation
uses GPkernel,InputhelpUnit, MyCalcUnit, MemEditUnit, MainUnit;

{$R *.dfm}

procedure TMemRecordForm.close_sbClick(Sender: TObject);
begin
Close;
end;


Procedure TMemRecordForm.FormRefresh;
begin
TaskName_edit.Text:=String_TaskName+Task_name;
Name_CB.Text:=Lock_Name;
Address_edit.Text:=intToHex(Lock_Address,8);
value_edit.Text:=Lock_value;
case Lock_ValueType of
Byte_value: Lock_valuetype_cb.ItemIndex:=0;
Word_value: Lock_valuetype_cb.ItemIndex:=1;
Dword_value: Lock_valuetype_cb.ItemIndex:=2;
int64_value: Lock_valuetype_cb.ItemIndex:=3;
Single_value: Lock_valuetype_cb.ItemIndex:=4;
Double_value: Lock_valuetype_cb.ItemIndex:=5;
String_value: Lock_valuetype_cb.ItemIndex:=6;
end;
LockType_Rg.ItemIndex:= Lock_Type;
case Lock_Info of
0:AddorMod_Sb.Caption:=String_needAddLock;
1:AddorMod_Sb.Caption:=String_needAddLock;
2:AddorMod_Sb.Caption:=String_needEditLock;
end;
end;

procedure TMemRecordForm.Help_sbClick(Sender: TObject);
begin
if not assigned(InputhelpForm)then  InputhelpForm:=TInputhelpForm.Create(self);
InputhelpForm.Showmodal;
InputhelpForm.Free;
InputhelpForm:=nil;
end;

procedure TMemRecordForm.Calc_sbClick(Sender: TObject);
begin
MyCalcForm.show;
end;

procedure TMemRecordForm.Lock_valuetype_cbChange(Sender: TObject);
var tempAddress:Dword;
    Ecode:integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempStringBYte:array[1..16] of BYte;
    TempString:String;
    I:integer;
begin
case Lock_valueType_cb.ItemIndex of
0:Lock_ValueType:=Byte_value;
1:Lock_ValueType:=Word_value;
2:Lock_ValueType:=Dword_value;
3:Lock_ValueType:=Int64_value;
4:Lock_ValueType:=Single_value;
5:Lock_ValueType:=Double_value;
6:Lock_ValueType:=String_value;
end;
Val('$'+Address_Edit.Text,tempAddress,Ecode);
if Ecode>0 then begin beep;Address_Edit.SelectAll;  Exit; end;
Lock_Address:=tempAddress;
try
case Lock_ValueType of
Byte_value:  begin
             ReadMemory(CurrentProcessID,tempAddress,@tempByte,Byte_value);
             Lock_value:=IntToStr(tempByte);
             end ;
Word_value:  begin
             ReadMemory(CurrentProcessID,tempAddress,@TempWord,Word_value);
             Lock_value:=IntToStr(TempWord);
             end ;
Dword_value:  begin
             ReadMemory(CurrentProcessID,tempAddress,@TempDword,Dword_value);
             Lock_value:=IntToStr(TempDword);
             end ;
Int64_value:  begin
             ReadMemory(CurrentProcessID,tempAddress,@Tempint64,Int64_value);
             Lock_value:=IntToStr(Tempint64);
             end ;
Single_value:  begin
             ReadMemory(CurrentProcessID,tempAddress,@TempSingle,Single_value);
             Lock_value:=FloatToStr(TempSingle);
             end ;
Double_value:  begin
             ReadMemory(CurrentProcessID,tempAddress,@TempDouble,Double_value);
             Lock_value:=FloatToStr(tempDouble);
             end ;
String_value: begin
             Readmemory(CurrentProcessID,tempAddress,@TempStringBYTE,String_value);
             Tempstring:='';
             for  i:=1 to 16 do  Tempstring:=Tempstring+chr(TempstringBYTE[i]);
             Lock_value:=tempString;
             end ;
end;
  Value_Edit.text:=Lock_Value;
Except

end;

end;

procedure TMemRecordForm.modify_sbClick(Sender: TObject);
var tempAddress:Dword;
    Ecode:integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempString:String[16];
    Modok:boolean;
begin
Modok:=False;
Val('$'+Address_Edit.Text,tempAddress,Ecode);
if Ecode>0 then begin Address_edit.SelectAll;beep; exit;end;
Lock_Address:=tempAddress;
case Lock_ValueType of
Byte_value:  begin
             val(Value_edit.Text,tempbyte,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             Modok:=WriteMemory(CurrentProcessID,tempAddress,@tempByte,Byte_value,1);
             end ;
Word_value:  begin
             val(Value_edit.Text,TempWord,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             Modok:=WriteMemory(CurrentProcessID,tempAddress,@tempWord,Word_value,2);
             end ;
Dword_value:  begin
             val(Value_edit.Text,tempDword,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             Modok:=WriteMemory(CurrentProcessID,tempAddress,@tempDword,Dword_value,4);
             end ;
Int64_value:  begin
             val(Value_edit.Text,tempint64,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             Modok:=WriteMemory(CurrentProcessID,tempAddress,@tempint64,int64_value,8);
             end ;
Single_value: begin
             val(Value_edit.Text,tempSingle,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             Modok:=WriteMemory(CurrentProcessID,tempAddress,@tempSingle,Single_value,4);
             end ;
Double_value:  begin
             val(Value_edit.Text,tempDouble,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             Modok:=WriteMemory(CurrentProcessID,tempAddress,@tempDouble,Double_value,8);
             end ;
String_value:  begin
             if Length(Value_edit.Text)>16 then
              begin
               showmessage(String_tolongString);
               Exit;
              end else
              TempString:=Value_edit.Text;
             Modok:=WriteMemory(CurrentProcessID,tempAddress,@TempString[1],String_value,Length(TempString));
             end ;
end;
if Modok then MemRecord_info_LB.Caption:=String_DirectlyModifyOK else
MemRecord_info_LB.Caption:=String_DirectlyModifyBAD;
MemRecord_Info_LB.Font.Color:=Random($FFFFFF);
end;

procedure TMemRecordForm.mem_sbClick(Sender: TObject);
var TempAddress:Dword;
    Ecode:Integer;
begin
val('$'+Address_Edit.Text,TempAddress,Ecode);
if Ecode>0 then begin Address_Edit.SelectAll;beep;exit;end;

 MemReadStartAddress:=(TempAddress and $FFFFFFF0);//ȥ�����һλs
 MemEditForm.Caption:=String_MemEditTitle+'<'+thetask[CurrenttaskIndex].Name+'>';
 memeditForm.Address_Edit.Text:=intToHex(MemReadStartAddress,8);
   Myrect.Left:=(TempAddress and $F)+1; //�õ����һλ
  Myrect.Top:=1;
  Myrect.Right:=Myrect.Left;
  Myrect.Bottom:=1;
  MemEditForm.MEM_sg.Selection:=Myrect;


MemEditForm.show;


end;

procedure TMemRecordForm.AddorMod_SbClick(Sender: TObject);
Var i:integer;
    tempAddress:Dword;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempString:String[16];
    Ecode:Integer;
    theIndex:integer;
begin
////////////////////////////////////////////////////////////////
Val('$'+Address_Edit.Text,tempAddress,Ecode);
if Ecode>0 then begin Address_edit.SelectAll;beep; exit;end;
Lock_Address:=tempAddress;

case Lock_valueType_cb.ItemIndex of
0:Lock_ValueType:=Byte_value;
1:Lock_ValueType:=Word_value;
2:Lock_ValueType:=Dword_value;
3:Lock_ValueType:=Int64_value;
4:Lock_ValueType:=Single_value;
5:Lock_ValueType:=Double_value;
6:Lock_ValueType:=String_value;
end;

try
case Lock_ValueType of
Byte_value:  begin
             val(Value_edit.Text,tempbyte,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             end ;
Word_value:  begin
             val(Value_edit.Text,TempWord,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             end ;
Dword_value:  begin
             val(Value_edit.Text,tempDword,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             end ;
Int64_value:  begin
             val(Value_edit.Text,tempint64,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             end ;
Single_value: begin
             val(Value_edit.Text,tempSingle,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             end ;
Double_value:  begin
             val(Value_edit.Text,tempDouble,Ecode);
             if Ecode>0 then begin Value_edit.SelectAll;beep; exit;end;
             end ;
String_value:  begin
             if Length(Value_edit.Text)>16 then
              begin
               showmessage(String_tolongString);
               Exit;
              end else
              TempString:=Value_edit.Text;
             end ;
end;
 Lock_Value:=Value_Edit.text;
Except

end;
//////////////////////////////////////////////


if Lock_Info<>2 then
begin
   if LockNum>=MaxLockNum then
   begin
   Showmessage(String_maxLockNum);
   Exit;
   end;
  for i:=1 to MaxLockNum do if memLockRecord[i].Applyed=False then  Break;
  Inc(LockNum);
  MemLockRecord[i].Applyed:=True;
  ListToLockIndex[LockNum]:=i;
  with memLockRecord[i] do
  begin
        Description:=Name_CB.Text;
        Address:=Lock_Address;
        valueStr:=Lock_value;
        VarType:=Lock_ValueType;            ///��Щ���� Found_LVMouseDown
        ProcessID:=CurrentProcessID;
        if LockType_Rg.ItemIndex=0 then
        Frozen :=True else Frozen :=False; 
        Applyed:=true;      //����/���ñ�־
  end;

 with MainForm.Lock_LV.Items.add do
 begin
  Caption:='';
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
 end;
 MemRecord_info_LB.Caption:=String_AddToLockOk;
 MainForm.UpdateLockInfo(i,LockNum-1);
 
end;


if (Lock_Info=2) and (mainForm.Lock_lv.Selected<>nil)then
begin
 theIndex:=ListToLockIndex[mainForm.Lock_lv.Selected.Index+1];
 with memLockRecord[theIndex] do
  begin
        Description:=Name_CB.Text;
        Address:=Lock_Address;
        valueStr:=Lock_value;
        VarType:=Lock_ValueType;            ///��Щ���� Found_LVMouseDown
        ProcessID:=CurrentProcessID;
        if LockType_Rg.ItemIndex=0 then
        Frozen :=True else Frozen :=False; 
        Applyed:=true;      //����/���ñ�־
  end;
  MemRecord_info_LB.Caption:=String_ModifyLockOK;
  MainForm.UpdateLockInfo(theIndex,mainForm.Lock_lv.Selected.Index);
end;


end;

end.
