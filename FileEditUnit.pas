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
unit FileEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls,hexeditor, ComCtrls;
resourcestring
String_FileEditFormTitle='文件查看与编辑: < %s >';
string_NotExists='%s 不存在.';
string_cannotopen='不能打开文件 %s,请检查.';
String_InvalidFile='%s 不是合法的存档文件(0<文件尺寸<67108864(64M) 字节,请检查.';
String_InvalidPos='%d 不是有效的位置.';
String_FileEditHelp='@前面加字符 t 表示ASCII和忽略大小写(比如: txgq 表示搜索 xgq=Xgq=XGQ),'#13#10+
                    '@前面加字符 T 表示ASCII 但区别大小写 (比如: Txgq 表示搜索 xgq 而不是 Xgq),'#13#10+
                    '@其他情况则是搜索当前编辑器里显示的十六进制值(不是实际的值(控件的问题)):'#13#10+
                    '  (比如: 10000 表示搜索显示的十六进制数值: 01 00 00;如果你想搜索实际的值 10000'+#13#10+
                    '  这样做:因为 10000=$2710 则输入 1027(记住不是2710) 然后点击 <查找>.) '#13#10+
                    '@你可以双击编辑器,加入/编辑指定的地址.'#13#10+
                    #13#10+ 
                    '更多的内容请参看帮助.' ;
String_noFind='没有找到: %s ';
String_CanNotChangeFile='不能修改文件:%s 请检查.' ;
type
  TFileEditForm = class(TForm)
    Panel1: TPanel;
    Jump_SB: TSpeedButton;
    Search_SB: TSpeedButton;
    PageDown_sb: TSpeedButton;
    PageUp_sb: TSpeedButton;
    call_calc_sb: TSpeedButton;
    help_sb: TSpeedButton;
    Label2: TLabel;
    Address_Edit: TEdit;
    Search_Edit: TEdit;
    Panel2: TPanel;
    byteEdit_sb: TSpeedButton;
    DwordEdit_sb: TSpeedButton;
    doubleEdit_sb: TSpeedButton;
    singleEdit_sb: TSpeedButton;
    int64Edit_sb: TSpeedButton;
    WordEdit_sb: TSpeedButton;
    byteshow_Edit: TEdit;
    Dwordshow_edit: TEdit;
    Wordshow_Edit: TEdit;
    int64show_edit: TEdit;
    singleshow_edit: TEdit;
    doubleshow_edit: TEdit;
    File_HexEditor: THexEditor;
    HeaderControl1: THeaderControl;
    SpeedButton1: TSpeedButton;
    procedure File_HexEditorStateChanged(Sender: TObject);
    procedure Search_SBClick(Sender: TObject);
    procedure help_sbClick(Sender: TObject);
    procedure Jump_SBClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure call_calc_sbClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PageDown_sbClick(Sender: TObject);
    procedure PageUp_sbClick(Sender: TObject);
    procedure File_HexEditorDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure File_HexEditorMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure byteEdit_sbClick(Sender: TObject);
    procedure WordEdit_sbClick(Sender: TObject);
    procedure singleEdit_sbClick(Sender: TObject);
    procedure DwordEdit_sbClick(Sender: TObject);
    procedure int64Edit_sbClick(Sender: TObject);
    procedure doubleEdit_sbClick(Sender: TObject);
  private
    { Private declarations }
    HexFileName:String;
  public
    { Public declarations }
    procedure FormLoadFile;
  end;
  
var
    EditFileName:string;
    NowPos:Int64;
    FindPos : Integer = -1;
    FindLastStr:String;
    FindBuf : PChar = nil;
    FindLen : Integer = 0;
    FindStr : string = '';
    FindICase : Boolean = False;
    FindIText : Boolean = False;
    tempFileStream:TMemoryStream;
var
  FileEditForm: TFileEditForm;
implementation
uses ArchiveEditUnit, MyCalcUnit, FileRecordUnit;

{$R *.dfm}


procedure TFileEditForm.File_HexEditorStateChanged(Sender: TObject);
var TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;

begin
if  NowPos=File_HexEditor.GetCursorPos then  exit;
NowPos:=File_HexEditor.GetCursorPos;
Address_Edit.Text:=intToHex(NowPos,8);
//if ArchiveEditForm.checkAndGetFileSize(EditFileName)=0  then exit;
if tempFileStream=nil then exit;
   tempFileStream.Seek(NowPos,soFrombeginning);
   try
     tempFileStream.ReadBuffer(TempByte,sizeof(TempByte));
      byteshow_Edit.text:=IntTOStr(TempByte);
   except
   byteshow_Edit.text:='Invalid';
   end;

   tempFileStream.Seek(NowPos,soFrombeginning);
   try
   tempFileStream.ReadBuffer(TempWord,sizeof(TempWord));
   Wordshow_Edit.text:=IntTOStr(TempWord);
   except
   Wordshow_Edit.text:='Invalid';
   end;

   tempFileStream.Seek(NowPos,soFrombeginning);
   try
   tempFileStream.ReadBuffer(TempDWord,sizeof(TempDWord));
   DWordshow_Edit.text:=IntTOStr(TempDword);
   except
   DWordshow_Edit.text:='Invalid';
   end;

   tempFileStream.Seek(NowPos,soFrombeginning);
   try
   tempFileStream.ReadBuffer(TempInt64,sizeof(TempInt64));
   Int64show_Edit.text:=IntTOStr(Tempint64);
   except
   Int64show_Edit.text:='Invalid';
   end;

   tempFileStream.Seek(NowPos,soFrombeginning);
   try
   tempFileStream.ReadBuffer(TempSingle,sizeof(TempSingle));
   Singleshow_Edit.text:=FloatTOStr(TempSingle);
   except
   Singleshow_Edit.text:='Invalid';
   end;

   tempFileStream.Seek(NowPos,soFrombeginning);
   try
   tempFileStream.ReadBuffer(TempDouble,sizeof(TempDouble));
   Doubleshow_Edit.text:=FloatTOStr(TempDouble);
   except
   Doubleshow_Edit.text:='Invalid';
   end;
end;

procedure TFileEditForm.Search_SBClick(Sender: TObject);
const
     cHexChars = '0123456789abcdef';
var
   pSTR,pTMP : String;
   pCT,pCT1 : Integer;
begin
     if FIle_HexEditor.DataSize < 1   then    Exit;
     if FindLastStr<>Search_edit.Text then
     begin  ////new search
       if FindBuf <> nil then
         begin
          FreeMem ( FindBuf );
          FindBuf := nil;
         end;
         FindStr:=Search_edit.text;
        if FindStr = ''   then   Exit;    // make a search string
        pStr := '';

     if UpCase(FindStr[1]) = 'T'
     then begin
          pStr := Copy ( FindStr , 2 , MaxInt );
          pCT1 := Length ( pStr );
          if FindStr[1]='T' then FindICase:=True else FindICase:=False;
          FindIText:=True;
     end
     else begin
          // calculate Data from input
          pTMP := AnsiLowerCase ( FindStr);

          for pCT := Length ( pTMP ) downto 1  do
            if Pos( pTMP[pCT] , cHexChars ) = 0    then  Delete ( pTMP , pCT , 1 );

          while (Length(pTMP) mod 2) <> 0   do    pTMP := '0'+pTMP;

          if pTMP = ''  then    Exit;
          pSTR := '';

          pCT1 := Length ( pTMP ) div 2;
          for pCT := 0 to (Length ( pTMP ) div 2) -1   do
            pStr := pStr + Char ( (Pos ( pTMP[pCt*2+1] , cHexChars ) -1) * 16 + (Pos ( pTMP[pCt*2+2] , cHexChars ) -1));

          FindIText:=False;
          
          end; ////if not "T'
          
        if pCT1 = 0    then   Exit;         
        if FindBuf<>nil then Freemem(FindBuf);
        GetMem ( FindBuf , pCT1 );        
        Move ( pStr[1] , FindBuf^, pCt1 );
        FindPos := File_HexEditor.GetCursorPos;
        FindLen := pCT1;
     end else///new search end
     begin //find again
     if FindPos = File_HexEditor.SelEnd then Inc ( FindPos , 1 ) else
     FindPos := File_HexEditor.GetCursorPos;
     end;

     
        FindLastStr:=Search_edit.Text;
        FindPos := File_HexEditor.Find ( FindBuf , FindLen , FindPos , FIle_HexEditor.DataSize -1 , FindICase , FindIText );
        if FindPos = -1
        then
            ShowMessage (Format(string_nofind,[FindLastStr]) )
        else begin
             File_HexEditor.SelStart := FindPos+FindLen-1;
             File_HexEditor.SelEnd := FindPos ;
        end;



end;

procedure TFileEditForm.help_sbClick(Sender: TObject);
begin
ShowMessage(String_FileEditHelp);
end;

procedure TFileEditForm.Jump_SBClick(Sender: TObject);
var TempAddress:Dword;
    Ecode:integer;
begin
  if File_HexEditor.DataSize <1  then   Exit;
 Val('$'+Address_Edit.text,TempAddress,Ecode);
 if Ecode=0 then
 begin
  if not File_HexEditor.Seek (TempAddress , soFromBeginning , True )then
     showmessage(Format(String_InvalidPos,[TempAddress]));
 end else  Address_edit.SetFocus;
end;

procedure TFileEditForm.SpeedButton1Click(Sender: TObject);
begin
    if File_HexEditor.CanUndo
     then File_HexEditor.Undo;
end;

procedure TFileEditForm.call_calc_sbClick(Sender: TObject);
begin
MyCalcForm.show;
end;

procedure TFileEditForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if not File_hexeditor.Modified then Exit;
TRY
 File_hexeditor.SaveToFile(HexFileName);
except
 showmessage(Format(String_CanNotChangeFile,[HexFileName]));
 END;
end;

procedure TFileEditForm.PageDown_sbClick(Sender: TObject);
begin
File_HexEditor.Seek (256, soFromCurrent , False );
end;

procedure TFileEditForm.PageUp_sbClick(Sender: TObject);
begin
File_HexEditor.Seek (-256, soFromCurrent , False );
end;

procedure TFileEditForm.File_HexEditorDblClick(Sender: TObject);
begin
FileRecordForm.show;
end;

procedure TFileEditForm.FormLoadFile;
var tempPos:Int64;
    HeadWidth:integer;
begin
tempFileStream.Clear;
tempFileStream.LoadFromFile(EditFileName);
HeadWidth:=9*( Length('0x:'+intToHex(tempFileStream.Size,1) ));
HeaderControl1.Sections[0].MaxWidth:=HeadWidth;
HeaderControl1.Sections[0].MinWidth:=HeadWidth;
HeaderControl1.Sections[0].MinWidth:=HeadWidth;
HeaderControl1.Sections[0].MaxWidth:=HeadWidth;
//HeaderControl1.Sections[0].Width:=HeadWidth;


File_HexEditor.DelTempFile;
tempPos:=NowPos; ///because File_HexEditorStateChanged have Nowpos  change
File_HexEditor.LoadFromStream(tempFileStream);
HexFileName:=EditFileName;
File_HexEditor.Seek (tempPos, soFromBeginning , False );
end;

procedure TFileEditForm.FormCreate(Sender: TObject);
begin
FindLastStr:='';
tempFileStream:=TmemoryStream.Create;
end;

procedure TFileEditForm.FormShow(Sender: TObject);
begin
FileEditForm.FormLoadFile;
FileEditForm.Caption:=Format(String_FileEditFormTitle,[HexFileName]); ///not useful in Oncreate
Address_Edit.Text:=inttohex(Nowpos,8);
end;

procedure TFileEditForm.FormDestroy(Sender: TObject);
begin
      if FindBuf <> nil
     then begin
          FreeMem ( FindBuf );
          FindBuf := nil;
     end;
FreeandNil(tempFileStream);
end;

procedure TFileEditForm.File_HexEditorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
File_Data_Caption:='Money';
File_name:=HexFileName;
File_Address:=Nowpos;
File_value:=byteshow_Edit.Text;
File_ValueType:=Byte_value;
File_Info:=1;
FileRecordForm.FormRefresh;
end;

procedure TFileEditForm.byteEdit_sbClick(Sender: TObject);
var  Ecode:Integer;
     tempbyte:BYTE;
     TempString:String;
begin
 TempString:=byteshow_Edit.Text;
 val(TempString,tempbyte,Ecode);
 if Ecode>0 then begin byteshow_Edit.SelectAll;beep; exit;end;
 if TempString<>FileRecordForm.WriteFileData(HexFileName,NowPos,TempString,Byte_value) then
begin
showmessage(String_cannotWriteFile);
exit;
end;
FileEditForm.FormLoadFile;
end;

procedure TFileEditForm.WordEdit_sbClick(Sender: TObject);
var  Ecode:Integer;
     tempWord:WORD;
     TempString:String;
begin
 TempString:=Wordshow_Edit.Text;
 val(TempString,tempWord,Ecode);
 if Ecode>0 then begin Wordshow_Edit.SelectAll;beep; exit;end;
 if TempString<>FileRecordForm.WriteFileData(HexFileName,NowPos,TempString,Word_Value) then
begin
showmessage(String_cannotWriteFile);
exit;
end;
FileEditForm.FormLoadFile;
end;

procedure TFileEditForm.singleEdit_sbClick(Sender: TObject);
var  Ecode:Integer;
     tempSingle:Single;
     TempString:String;
begin
 TempString:=Singleshow_Edit.Text;
 val(TempString,tempSingle,Ecode);
 if Ecode>0 then begin Singleshow_Edit.SelectAll;beep; exit;end;
 if TempString<>FileRecordForm.WriteFileData(HexFileName,NowPos,TempString,Single_Value) then
begin
showmessage(String_cannotWriteFile);
exit;
end;
FileEditForm.FormLoadFile;
end;

procedure TFileEditForm.DwordEdit_sbClick(Sender: TObject);
var  Ecode:Integer;
     tempDword:Dword;
     TempString:String;
begin
 TempString:=Dwordshow_Edit.Text;
 val(TempString,tempDword,Ecode);
 if Ecode>0 then begin Dwordshow_Edit.SelectAll;beep; exit;end;
 if TempString<>FileRecordForm.WriteFileData(HexFileName,NowPos,TempString,Dword_Value) then
begin
showmessage(String_cannotWriteFile);
exit;
end;
FileEditForm.FormLoadFile;
end;

procedure TFileEditForm.int64Edit_sbClick(Sender: TObject);
var  Ecode:Integer;
     tempInt64:Int64;
     TempString:String;
begin
 TempString:=Int64show_Edit.Text;
 val(TempString,tempInt64,Ecode);
 if Ecode>0 then begin Int64show_Edit.SelectAll;beep; exit;end;
 if TempString<>FileRecordForm.WriteFileData(HexFileName,NowPos,TempString,Int64_Value) then
begin
showmessage(String_cannotWriteFile);
exit;
end;
FileEditForm.FormLoadFile;
end;

procedure TFileEditForm.doubleEdit_sbClick(Sender: TObject);
var  Ecode:Integer;
     tempDouble:Double;
     TempString:String;
begin
 TempString:=Doubleshow_Edit.Text;
 val(TempString,tempDouble,Ecode);
 if Ecode>0 then begin Doubleshow_Edit.SelectAll;beep; exit;end;
 if TempString<>FileRecordForm.WriteFileData(HexFileName,NowPos,TempString,Double_Value) then
begin
showmessage(String_cannotWriteFile);
exit;
end;
FileEditForm.FormLoadFile;
end;

end.
