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
unit MemEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Buttons, Menus;
  
resourceString
String_Taskinvalid='对应的进程/应用程序已经关闭.  ';
String_CannotWrite='该块内存被系统写保护.';
type
  TMemEditForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    mem_SG: TStringGrid;
    Address_Edit: TEdit;
    Jump_SB: TSpeedButton;
    Search_Edit: TEdit;
    Search_SB: TSpeedButton;
    Mem_SGScrollBar: TScrollBar;
    PageDown_sb: TSpeedButton;
    PageUp_sb: TSpeedButton;
    byteshow_Edit: TEdit;
    Dwordshow_edit: TEdit;
    Wordshow_Edit: TEdit;
    int64show_edit: TEdit;
    singleshow_edit: TEdit;
    doubleshow_edit: TEdit;
    call_calc_sb: TSpeedButton;
    help_sb: TSpeedButton;
    byteEdit_sb: TSpeedButton;
    DwordEdit_sb: TSpeedButton;
    doubleEdit_sb: TSpeedButton;
    singleEdit_sb: TSpeedButton;
    int64Edit_sb: TSpeedButton;
    WordEdit_sb: TSpeedButton;
    Label2: TLabel;
    MemRefresh_Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Jump_SBClick(Sender: TObject);
    procedure Address_EditKeyPress(Sender: TObject; var Key: Char);
    procedure PageDown_sbClick(Sender: TObject);
    procedure PageUp_sbClick(Sender: TObject);
    procedure Mem_SGScrollBarScroll(Sender: TObject;
      ScrollCode: TScrollCode; var ScrollPos: Integer);
    procedure mem_SGKeyPress(Sender: TObject; var Key: Char);
    procedure mem_SGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure byteEdit_sbClick(Sender: TObject);
    procedure WordEdit_sbClick(Sender: TObject);
    procedure DwordEdit_sbClick(Sender: TObject);
    procedure int64Edit_sbClick(Sender: TObject);
    procedure singleEdit_sbClick(Sender: TObject);
    procedure doubleEdit_sbClick(Sender: TObject);
    procedure help_sbClick(Sender: TObject);
    procedure Search_SBClick(Sender: TObject);
    procedure call_calc_sbClick(Sender: TObject);
    procedure Search_EditKeyPress(Sender: TObject; var Key: Char);
    procedure byteshow_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Dwordshow_editKeyPress(Sender: TObject; var Key: Char);
    procedure Wordshow_EditKeyPress(Sender: TObject; var Key: Char);
    procedure int64show_editKeyPress(Sender: TObject; var Key: Char);
    procedure singleshow_editKeyPress(Sender: TObject; var Key: Char);
    procedure doubleshow_editKeyPress(Sender: TObject; var Key: Char);
    procedure mem_SGDblClick(Sender: TObject);
    procedure mem_SGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MemRefresh_TimerTimer(Sender: TObject);

  private
    { Private declarations }
  public
    procedure MemRefresh;
   { Public declarations }
  end;
var MemEditForm: TMemEditForm;
    inputkey:String;
var NowRow,NowCol:Integer;
    SearchRow,SearChCol:integer;
    myRect: TGridRect;

implementation
uses GPkernel, MyCalcUnit,MemRecordUnit;

{$R *.dfm}
procedure TMemEditForm.FormCreate(Sender: TObject);
var i:integer;
begin
with mem_SG do
begin
ColCount:=33;
RowCount:=17;
ColWidths[0]:=70;
for i:=1 to 16 do
begin
Cells[i,0]:=intToHex(i-1,1);
ColWidths[i+16]:=12;
Cells[i+16,0]:=intToHex(i-1,1);
end;
Mem_SGScrollbar.Min:=0;
Mem_SGScrollbar.Max:=$FFFFFFFF shr 4;
Mem_SGScrollbar.Position:=MemReadStartAddress shr 4;
end; //with edn
NowCol:=1;
NowRow:=1;
SearchRow:=1;
SearchCol:=1;


end;

procedure TMemEditForm.Jump_SBClick(Sender: TObject);
var TempAddress:Dword;
    Ecode:integer;
    myRect: TGridRect;
begin
 Val('$'+Address_Edit.text,TempAddress,Ecode);
 if Ecode=0 then
 begin
  MemReadStartAddress:=(TempAddress and $FFFFFFF0);//去掉最后一位
  Address_Edit.Text:=intToHex(MemReadStartAddress,8);
  Myrect.Left:=(TempAddress and $F)+1; //得到最后一位
  Myrect.Top:=1;
  Myrect.Right:=Myrect.Left;
  Myrect.Bottom:=1;
  MEM_sg.Selection:=Myrect;

 end
 else  Address_edit.SetFocus;

end;

procedure TMemEditForm.Address_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=chr(VK_RETURN) then Jump_SB.Click;
end;

procedure TMemEditForm.PageDown_sbClick(Sender: TObject);
begin
Inc(MemReadStartAddress,256);
Address_Edit.Text:=intToHex(MemReadStartAddress,8);
MemRefresh;
end;

procedure TMemEditForm.PageUp_sbClick(Sender: TObject);
begin
Dec(MemReadStartAddress,256);
Address_Edit.Text:=intToHex(MemReadStartAddress,8);
MemRefresh;
end;

procedure TMemEditForm.Mem_SGScrollBarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
MemReadStartAddress:=Mem_SGScrollbar.Position shl 4;
Address_Edit.Text:=intToHex(memReadStartAddress,8);
MemRefresh;
end;

procedure TMemEditForm.mem_SGKeyPress(Sender: TObject; var Key: Char);
var TempByte:Byte;
    Ecode:integer;
    offsetindex:integer;
begin
////各个按钮不能有快捷键.否则本过程不行
inputkey:=inputkey+key;
offsetindex:=(NowRow-1)*16+(NowCol-1);
if (NowCol>=1) and (NowCol<=16) then
 begin
   MemWriteStartAddress:=MemReadStartAddress+offsetindex;
       if Length(inputkey)>=2 then
        begin
           val('$'+inputkey[1]+inputkey[2],TempByte,Ecode);
           if Ecode>0 then
                begin
                inputkey:=''; //消除不合法字符
                Exit;
                end;        //because 可能从字符区转过来
           GPKernel.WriteMemory(CurrentProcessID,MemWriteStartAddress,Addr(TempByte),Byte_value,1);
           inputkey:='';
           if (NowCol<>16) then
           begin
           myRect.Left :=NowCol+1;
           myRect.Top := NowRow;
           end
            else
           begin
           myRect.Left:=1;
           myRect.Top := NowRow+1;
           end;
           myRect.Right :=myRect.Left;
           myRect.Bottom :=myRect.Top;
           Mem_Sg.Selection:= myRect;
           NowCol:= myRect.Left;
           NowRow:=myrect.Top;
        end;
  end
else
if (NowCol>=17) and (NowCol<=32) then
 begin
   MemWriteStartAddress:=MemReadStartAddress+offsetindex-16;
          begin
           TempByte:=Ord(inputkey[1]);
           GPKernel.WriteMemory(CurrentProcessID,MemWriteStartAddress,Addr(TempByte),Byte_value,1);
           inputkey:='';
           if (NowCol<>32) then
           begin
           myRect.Left :=NowCol+1;
           myRect.Top := NowRow;
           end
            else
           begin
           myRect.Left:=17;
           myRect.Top := NowRow+1;
           end;
           myRect.Right :=myRect.Left;
           myRect.Bottom :=myRect.Top;
           Mem_Sg.Selection:= myRect;
           NowCol:= myRect.Left;
           NowRow:=myrect.Top;
          end;


  end;

offsetindex:=(NowRow-1)*16+(NowCol-1);//new col row
if (NowCol>=1) and (NOwCol<=16)  then
Address_Edit.Text:=intToHex(MemReadStartAddress+offsetindex,8)
else
Address_Edit.Text:=intToHex(MemReadStartAddress+offsetindex-16,8);

end;

procedure TMemEditForm.mem_SGSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var offsetindex:integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    //TempString:String[16];
begin
NowRow:=Arow;
NowCol:=Acol;
SearchRow:=ARow;
SearchCol:=ACol;

 offsetindex:=(Nowrow-1)*16+(NOWCol-1);
 if (NowCol>=1) and (NOwCol<=16)  then
  begin
   MemWriteStartAddress:=MemReadStartAddress+offsetIndex;
  end
  else
  begin
   MemWriteStartAddress:=MemReadStartAddress+offsetIndex-16;
  end;

 Address_Edit.Text:=intToHex(MemWriteStartAddress,8);

if (NowCol>=1) and (NOwCol<=16) then
begin
try
 if GPKernel.ReadMemory(CurrentProcessID,MemWriteStartAddress,@TempByte,Byte_value)then
byteshow_Edit.Text:=intToStr(TempByte) else  byteshow_Edit.Text:='--';
 if GPKernel.ReadMemory(CurrentProcessID,MemWriteStartAddress,@TempWord,Word_value) then
wordshow_Edit.Text:=intToStr(TempWord) else wordshow_Edit.Text:='--';
 if GPKernel.ReadMemory(CurrentProcessID,MemWriteStartAddress,@TempDword,Dword_value) then
Dwordshow_Edit.Text:=intToStr(TempDword) else Dwordshow_Edit.Text:='--';
 if GPKernel.ReadMemory(CurrentProcessID,MemWriteStartAddress,@Tempint64,Int64_value) then
Int64show_Edit.Text:=intToStr(Tempint64) else Int64show_Edit.Text:='--';
 if GPKernel.ReadMemory(CurrentProcessID,MemWriteStartAddress,@TempSingle,Single_value)then
singleshow_Edit.Text:=FloatToStr(TempSingle) else  singleshow_Edit.Text:='--';
 if GPKernel.ReadMemory(CurrentProcessID,MemWriteStartAddress,@TempDouble,Double_value) then
 doubleshow_Edit.Text:=FloatToStr(TempDouble) else  doubleshow_Edit.Text:='--';
except
end;
end; ///end show if

end;


procedure TMemEditForm.byteEdit_sbClick(Sender: TObject);
var  Ecode:integer;
     TempByte:Byte;
begin
val(byteshow_Edit.Text,TempByte,Ecode);
if Ecode=0 then
if not WriteMemory(CurrentProcessID,MemWriteStartAddress,@TempByte,byte_value,1) then
showmessage(String_CannotWrite);

end;

procedure TMemEditForm.WordEdit_sbClick(Sender: TObject);
var  Ecode:integer;
     TempWord:Word;
begin
val(Wordshow_Edit.Text,TempWord,Ecode);
if Ecode=0 then
if not WriteMemory(CurrentProcessID,MemWriteStartAddress,@TempWord,Word_value,2)then
showmessage(String_CannotWrite);

end;

procedure TMemEditForm.DwordEdit_sbClick(Sender: TObject);
var  Ecode:integer;
     TempDword:Dword;
begin
val(Dwordshow_Edit.Text,TempDword,Ecode);
if Ecode=0 then
if not WriteMemory(CurrentProcessID,MemWriteStartAddress,@TempDword,Dword_value,4)then
showmessage(String_CannotWrite);

end;

procedure TMemEditForm.int64Edit_sbClick(Sender: TObject);
var  Ecode:integer;
     TempInt64:Int64;
begin
val(int64show_Edit.Text,TempInt64,Ecode);
if Ecode=0 then
if not WriteMemory(CurrentProcessID,MemWriteStartAddress,@TempInt64,int64_value,8)then
showmessage(String_CannotWrite);

end;

procedure TMemEditForm.singleEdit_sbClick(Sender: TObject);
var  Ecode:integer;
     TempSingle:single;
begin
val(singleshow_Edit.Text,TempSingle,Ecode);
if Ecode=0 then
if not WriteMemory(CurrentProcessID,MemWriteStartAddress,@TempSingle,Single_Value,4)then
showmessage(String_CannotWrite);

end;

procedure TMemEditForm.doubleEdit_sbClick(Sender: TObject);
var  Ecode:integer;
     TempDouble:Double;
begin
val(doubleshow_Edit.Text,TempDouble,Ecode);
if Ecode=0 then
if not WriteMemory(CurrentProcessID,MemWriteStartAddress,@TempDouble,Double_Value,8)then
showmessage(String_CannotWrite);

end;

procedure TMemEditForm.help_sbClick(Sender: TObject);
begin
ShowMessage(String_MemEditHelp);
end;

procedure TMemEditForm.Search_SBClick(Sender: TObject);
var TempByte:byte;
    Ecode:integer;
    I:integer;
begin
i:=1;
Val(Search_Edit.Text,TempByte,Ecode);
if Ecode=0 then
 begin
  While i<=256 do
   begin
       if SearchCol=17 then
       begin
       SearchCol:=1;
       inc(SearchRow);
       if SearchRow>=17 then  SearchRow:=1;
       end    else  inc(SearchCol);

    if Mem_Sg.Cells[SearchCol,SearchRow]=intToHex(TempByte,2) then
      begin
       Myrect.Left:=SearchCol;
       Myrect.Top:=SearchRow;
       myrect.Right:=Myrect.Left;
       Myrect.Bottom:=Myrect.Top;
       Mem_SG.Selection:=myRect;
       Exit;
      end;
       INC(i);
   end; ///whitle end;
 end ;



end;

procedure TMemEditForm.call_calc_sbClick(Sender: TObject);
begin
MyCalcForm.show;
end;

procedure TMemEditForm.Search_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key=chr(VK_RETURN) then Search_sb.Click;
end;

procedure TMemEditForm.byteshow_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=chr(VK_RETURN) then byteEdit_sb.Click;
end;

procedure TMemEditForm.Dwordshow_editKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=chr(VK_RETURN) then DwordEdit_sb.Click;
end;

procedure TMemEditForm.Wordshow_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=chr(VK_RETURN) then WordEdit_sb.Click;
end;

procedure TMemEditForm.int64show_editKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=chr(VK_RETURN) then int64Edit_sb.Click;
end;

procedure TMemEditForm.singleshow_editKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=chr(VK_RETURN) then SingleEdit_sb.Click;
end;

procedure TMemEditForm.doubleshow_editKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=chr(VK_RETURN) then DoubleEdit_sb.Click;
end;

procedure TMemEditForm.mem_SGDblClick(Sender: TObject);
begin
MemRecordForm.Show;
end;

procedure TMemEditForm.mem_SGMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var offsetIndex:integer;
      TempByte:Byte;
      TempString:String[16];
begin
offsetindex:=(Nowrow-1)*16+(NOWCol-1);
if (NowCol>=1) and (NOwCol<=16)  then
begin
Lock_Address:=MemReadStartAddress+offsetindex;
Address_Edit.Text:=intToHex(Lock_Address,8);
Lock_ValueType:=Word_value;
GPKernel.ReadMemory(CurrentProcessID,Lock_Address,@TempByte,Lock_ValueType);
Lock_value:=intToStr(TempByte);
end
else
begin
Lock_Address:=MemReadStartAddress+offsetindex-16;
Address_Edit.Text:=intToHex(Lock_Address,8);
Lock_ValueType:=String_value;
GPKernel.ReadMemory(CurrentProcessID,Lock_Address-1,@TempString,Lock_ValueType);
Lock_value:=TempString;
end;
Lock_Name:='Money';
Lock_Type:=0;
Lock_Info:=0;
MemRecordForm.FormRefresh;
end;


procedure  TMemEditForm.MemRefresh;
var i,j:integer;
     tempNUm:Integer;
begin
Mem_SGScrollBar.Position:=MemReadStartAddress shr 4;
for j:=1 to 16 do
Mem_SG.Cells[0,j]:=intToHex(MemReadStartAddress+16*(j-1),8);

if GPKernel.ReadMemory_Array(CurrentProcessID,MemReadStartAddress) then
begin
   MemEditForm.Caption:=String_MemEditTitle +'<'+thetask[CurrenttaskIndex].Name+'>';
   for j:=1 to 16 do
     for i:=1 to 16 do
     begin
        tempNUm:=MemReaddata[(i-1)+(j-1)*16+1];
        if tempNUm=-999 then
        begin
        Mem_SG.Cells[i,j]:='??';
        Mem_SG.Cells[i+16,j]:='.';
        end
        else
        begin
         Mem_SG.Cells[i,j]:=intToHex(tempNUm ,2);
         if ((tempNUm>=$20) and (tempNUm<=$7E)) then Mem_SG.Cells[i+16,j]:=chr(TempNum)
         else Mem_SG.Cells[i+16,j]:='.';
        end;
     end;

end else
    begin
    MemEditForm.Caption:=String_MemEditTitle+'<'+String_Taskinvalid+'>';
    for j:=1 to 16 do
        for i:=1 to 16 do
          begin
          Mem_SG.Cells[i,j]:='--';
          mem_Sg.Cells[i+16,j]:='.';
          end;

     end;

end;

procedure TMemEditForm.MemRefresh_TimerTimer(Sender: TObject);
begin
MemRefresh;
end;

end.
