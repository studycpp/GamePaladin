{

name:(1999.12.1 -jhx1)
			江湖行 II jhx2 
			2002.10.13 renamed to 'GamePaladin II'
CopyRight:XuGanQuan  gqxunet#163.com 
Description:A game cheat tool

This program is free software; you can redistribute it       
and/or modify it under the terms of the GNU General Public    
License as published by the Free Software Foundation; either 
version 2 of the License, or (at your option) any later     
version.                                                     
                                                             
This program is distributed in the hope that it will be      
useful, but WITHOUT ANY WARRANTY; without even the implied    
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      
PURPOSE.  See the GNU General Public License for more        
details.                                                      
                                                              
You should have received a copy of the GNU General Public    
License along with this program; if not, write to the Free    
Software Foundation, Inc.,                                    
675 Mass Ave, Cambridge, MA 02139, USA.      
}
unit FileRecordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;
resourcestring
String_needAddFile='加入结果列表';
String_needEditFile='修改结果条目';
String_FileName='文件:';
String_tolongString='修改16个字符以上，请直接用<文件查看与修改> 对话框 ';
String_cannotWriteFile='不能修改该地址.请检查数据类型和存档文件(是否只读?).';
const
  Auto_value=0;
  Byte_value=1;
  word_value=2;
  Dword_value=3;
  int64_value=4;
  Single_value=5;
  Double_Value=6;
  String_Value=7;




type
  TFileRecordForm = class(TForm)
    close_bn: TButton;
    Label3: TLabel;
    Address_Edit: TEdit;
    Label4: TLabel;
    value_edit: TEdit;
    Label5: TLabel;
    File_valuetype_cb: TComboBox;
    EditFile_Sb: TSpeedButton;
    Calc_sb: TSpeedButton;
    Help_sb: TSpeedButton;
    Caption_CB: TComboBox;
    Label6: TLabel;
    AddorMod_Sb: TSpeedButton;
    FileName_Edit: TEdit;
    procedure Help_sbClick(Sender: TObject);
    procedure Calc_sbClick(Sender: TObject);
    procedure close_bnClick(Sender: TObject);
    procedure File_valuetype_cbChange(Sender: TObject);
    procedure EditFile_SbClick(Sender: TObject);
    procedure AddorMod_SbClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      Procedure FormRefresh;
      Function WriteFileData(theFileName:String;theAddress:Dword;theValue:string;valuetype:integer):string;
  end;

var
  FileRecordForm: TFileRecordForm;

var File_Data_Caption:String;
    File_name:string;
    File_Address:Dword;
    File_value:String;
    File_ValueType:integer;
    File_Info:Integer;
implementation

uses inputhelpUnit, MyCalcUnit, ArchiveEditUnit, FileEditUnit, MainUnit;

{$R *.dfm}

procedure TFileRecordForm.Help_sbClick(Sender: TObject);
begin
if not assigned(InputhelpForm)then  InputhelpForm:=TInputhelpForm.Create(self);
InputhelpForm.Showmodal;
InputhelpForm.Free;
InputhelpForm:=nil;
end;

procedure TFileRecordForm.Calc_sbClick(Sender: TObject);
begin
 MyCalcForm.show;
end;

procedure TFileRecordForm.close_bnClick(Sender: TObject);
begin
close;
end;

procedure TFileRecordForm.FormRefresh;
begin
Caption_CB.Text:=File_Data_Caption;
Address_edit.Text:=intToHex(File_Address,8);
value_edit.Text:=File_value;
case File_ValueType of
Byte_value: File_valuetype_cb.ItemIndex:=0;
Word_value: File_valuetype_cb.ItemIndex:=1;
Dword_value: File_valuetype_cb.ItemIndex:=2;
int64_value: File_valuetype_cb.ItemIndex:=3;
Single_value: File_valuetype_cb.ItemIndex:=4;
Double_value: File_valuetype_cb.ItemIndex:=5;
String_value: File_valuetype_cb.ItemIndex:=6;
end;
FileName_Edit.text:=String_FileName+' '+Uppercase(ExtractFileName(File_name))+' -- '+File_name;
case File_Info of
0:AddorMod_Sb.Caption:=String_needAddFile;
1:AddorMod_Sb.Caption:=String_needAddFile;
2:AddorMod_Sb.Caption:=String_needEditFile;
end;
end;


procedure TFileRecordForm.File_valuetype_cbChange(Sender: TObject);
var tempAddress:Dword;
    Ecode:integer;
begin
case File_valueType_cb.ItemIndex of
0:File_ValueType:=Byte_value;
1:File_ValueType:=Word_value;
2:File_ValueType:=Dword_value;
3:File_ValueType:=Int64_value;
4:File_ValueType:=Single_value;
5:File_ValueType:=Double_value;
6:File_ValueType:=String_value;
end;
Val('$'+Address_Edit.Text,tempAddress,Ecode);
if Ecode>0 then begin beep;Address_Edit.SelectAll;  Exit; end;
value_edit.Text:=ArchiveEditForm.ReadFileData(File_name,tempAddress,File_ValueType);

end;

procedure TFileRecordForm.EditFile_SbClick(Sender: TObject);
var TempAddress:Dword;
    Ecode:integer;
begin
if Filetasknum=0 then Exit;
if FileEditForm.Visible then FileEditForm.Close;
if ArchiveEditForm.checkandGetFileSize(File_name)=0 then exit;
  Val('$'+ Address_Edit.Text,TempAddress,Ecode);
  if Ecode>0 then begin Address_Edit.SelectAll;  exit;end;
  EditFilename:=File_name;
  Nowpos:=TempAddress;
  FileEditForm.Show;


end;

Function TFileRecordForm.WriteFileData(theFileName:String;theAddress:Dword;theValue:string;valuetype:integer):string;
var AddressBuf:Dword;
    i:Integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempStringBYte:byte;
    Ecode:integer;
    tempFileStream:TFileStream;
begin
result:='Error!';

tempFileStream:=TFileStream.Create(theFileName,fmOpenReadWrite or fmshareDenyNone);
try
 tempFileStream.Seek(theAddress,soFromBeginning);
   try

     case ValueType of
         Byte_value: begin
                     val(theValue,tempbyte,Ecode);
                     if Ecode>0 then Exit;
                     tempFileStream.WriteBuffer(TempByte,sizeof(TempByte));
                     result:=theValue;
                     end;
         Word_value: begin
                     val(theValue,TempWord,Ecode);
                     if Ecode>0 then Exit;
                     tempFileStream.WriteBuffer(TempWord,sizeof(TempWord));
                     result:=theValue;
                     end;
         Dword_value:begin
                     val(theValue,TempDWord,Ecode);
                     if Ecode>0 then Exit;
                     tempFileStream.WriteBuffer(TempDWord,sizeof(TempDWord));
                     result:=theValue;
                     end;
         Int64_value:begin
                     val(theValue,TempInt64,Ecode);
                     if Ecode>0 then Exit;
                     tempFileStream.WriteBuffer(TempInt64,sizeof(TempInt64));
                     result:=theValue;
                     end;
         Single_value:begin
                     val(theValue,TempSingle,Ecode);
                     if Ecode>0 then Exit;
                      tempFileStream.WriteBuffer(TempSingle,sizeof(TempSingle));
                      result:=theValue;
                     end;
         Double_value:begin
                     val(theValue,TempDouble,Ecode);
                     if Ecode>0 then Exit;
                      tempFileStream.WriteBuffer(TempDouble,sizeof(TempDouble));
                      result:=theValue;
                     end;
         String_Value:begin
                      for I:=1 to Length(theValue) do
                      begin
                      tempStringBYte:=Ord(theValue[i]);
                      tempFileStream.WriteBuffer(tempStringBYte,sizeof(tempStringBYte));
                      end;
                      result:=theValue;
                     end;
     end;//case end
   except
   end;

   finally
    FreeandNIl(tempFileStream);
   end;

end;



procedure TFileRecordForm.AddorMod_SbClick(Sender: TObject);
Var tempAddress:Dword;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempString:String;
    Ecode:Integer;
begin

    File_Data_Caption:=Caption_cb.Text;
    File_name:=theFileTask[CurrentFiletaskIndex].FilepathName;
    ///File_Address:Dword;
    //File_value:String;
    //File_ValueType:integer;
    ///File_Info:Integer;
////////////////////////////////////////////////////////////////
if archiveEditForm.checkandGetFileSize(File_name)=0 then exit;
Val('$'+Address_Edit.Text,tempAddress,Ecode);
if Ecode>0 then begin Address_edit.SelectAll;beep; exit;end;
File_Address:=tempAddress;

case File_valueType_cb.ItemIndex of
0:File_ValueType:=Byte_value;
1:File_ValueType:=Word_value;
2:File_ValueType:=Dword_value;
3:File_ValueType:=Int64_value;
4:File_ValueType:=Single_value;
5:File_ValueType:=Double_value;
6:File_ValueType:=String_value;
end;

try
case File_ValueType of
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
              end;
              end;
end;
 File_Value:=Value_Edit.text;
Except
end;
//////////////////////////////////////////////
if File_Value<>WriteFileData(File_name,File_Address,File_Value,File_ValueType) then
begin
showmessage(String_cannotWriteFile);
exit;
end;
FileEditForm.FormLoadFile;


   case File_ValueType of
    Byte_value:TempString:='Byte_Type';
    Word_value:TempString:='Word_Type';
    Dword_value:TempString:='Dword_Type';
    Int64_value:TempString:='Int64_Type';
    Single_value:TempString:='Single_Type';
    Double_value:TempString:='Double_Type';
    String_value:TempString:='String_Type';
   end;
if File_info<>2 then
 with ArchiveEditForm.Edit_LV.Items.add do
 begin
  Caption:=File_Data_Caption;
  Subitems.Add(intToHex(File_Address,8));
  Subitems.Add(File_Value);
  Subitems.Add(TempString);
  Subitems.Add(File_name);
 end  else
 with ArchiveEditForm.Edit_LV.Selected do
 begin
   Caption:=File_Data_Caption;
  Subitems[0]:=(intToHex(File_Address,8));
  Subitems[1]:=(File_Value);
  Subitems[2]:=(TempString);
  Subitems[3]:=(File_name);
 end;


end;

end.
