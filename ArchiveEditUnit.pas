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
unit ArchiveEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls,ChildFormUnit,
  ImgList, Menus;
resourcestring
String_Filenotask='没有文件搜索任务,请新建加入;';
String_Filenoresult='搜索次数: 0 , 找到数目:0  ';
String_FileScanResult='搜索次数:%d , 找到数目:%d ';
String_FileInScan='当前的文件搜索任务正在进行,请等待.';
String_FileInScanTitle='文件搜索任务进行信息';
String_InvalidInput='无效的输入数据,请检查.';
String_Addtask='还没有文件搜索任务 ,是否现在创建?';
String_Addtasktitle='没有文件搜索任务信息';
String_InScan='当前的任务正在进行,请等待.';
String_InScanTitle='任务进行信息';
String_FileTaskinvalid='对应的存档文件不存在.  ';
String_FileTypeNoMatch='输入的类型不匹配上次类型(高阶/低阶),'+
                        '你想进行新类型的搜索吗?';
String_FileTypeNoMatchTitle='输入的类型不匹配信息';
String_FileAskRepeatInitLowLevelTitle='文件低阶搜索重复初始化信息';
String_FileAskRepeatInitLowLevel='已经进行了初始化文件的低阶搜索,'#13#10+
                         '是否再次初始化?';
String_FileNoResultAgainTitle='无结果信息';
String_FileNoResultAgain='抱歉,找不到任何匹配的地址,是否再次搜索?';
String_InvalidByte='%s 不是合法的 Byte 类型数据,请检查';
String_InvalidWord='%s 不是合法的 Word 类型数据,请检查';
String_InvalidDword='%s 不是合法的 Dword 类型数据,请检查';
String_InvalidInt64='%s 不是合法的 Int64 类型数据,请检查k';
String_InvalidSingle='%s 不是合法的 Single 类型数据,请检查';
String_InvalidDouble='%s 不是合法的 Double 类型数据,请检查';
String_InvalidString='%s 不是合法的 Text 类型数据,请检查';
String_FileTaskResult='任务: %s '#13#10'找到 %d 个地址,'#13#10'用时 %f 秒.';
String_FileTaskResultTitle='搜索结果';
String_FileInitialLowLevel='文件搜索任务:%s'#13#10'低阶搜索初始化完成.';


type
  TArchiveEditForm = class(TChildForm)
    temp_Panel1: TPanel;
    ToolBar1: TToolBar;
    AddFIle_TB: TToolButton;
    delFile_tb: TToolButton;
    Filetasks_LV: TListView;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Splitter2: TSplitter;
    Panel2: TPanel;
    Scan_bn: TSpeedButton;
    EditFile_Sb: TSpeedButton;
    InputHelp_SB: TSpeedButton;
    Value_Edit: TEdit;
    VarType_CB: TComboBox;
    Panel3: TPanel;
    File_Info_SearchResult_LB: TLabel;
    File_info_Name_LB: TLabel;
    Edit_LV: TListView;
    Found_LV: TListView;
    Panel4: TPanel;
    Scan_Gauge: TGauge;
    ImageList1: TImageList;
    DisplayFileScanProcess: TTimer;
    PopupMenu1: TPopupMenu;
    delFiletask_menu: TMenuItem;
    N1: TMenuItem;
    ClearFileTask_menu: TMenuItem;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    Addtolists: TMenuItem;
    N2: TMenuItem;
    EditAddress: TMenuItem;
    DeleteFileEditAddress: TMenuItem;
    ClearAllAddress: TMenuItem;
    N4: TMenuItem;
    ModifyFileEdit: TMenuItem;
    EditFileAddress: TMenuItem;
    StaticText1: TStaticText;
    procedure AddFIle_TBClick(Sender: TObject);
    procedure delFile_tbClick(Sender: TObject);
    procedure Filetasks_LVEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure Filetasks_LVClick(Sender: TObject);
    procedure Scan_bnClick(Sender: TObject);
    procedure DisplayFileScanProcessTimer(Sender: TObject);
    procedure InputHelp_SBClick(Sender: TObject);
    procedure Value_EditKeyPress(Sender: TObject; var Key: Char);
    procedure VarType_CBChange(Sender: TObject);
    procedure ClearFileTask_menuClick(Sender: TObject);
    procedure Found_LVDblClick(Sender: TObject);
    procedure Found_LVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditFile_SbClick(Sender: TObject);
    procedure EditAddressClick(Sender: TObject);
    procedure DeleteFileEditAddressClick(Sender: TObject);
    procedure ClearAllAddressClick(Sender: TObject);
    procedure ModifyFileEditClick(Sender: TObject);
    procedure Edit_LVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditFileAddressClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitFiletask(theID:Integer);
    function checkandGetFileSize(FileName:string):Dword;
    Procedure AddTasktoList(theIndex:integer);
    Procedure UpdateTaskInfo(theIndex:integer);
    Procedure AddFoundToListView(theIndex:integer);
    Procedure RaiseInputError;
    function AnalyseScan(theIndex:Integer):integer;
    function CheckForScan:boolean;

    function ReadFileData(theFileName:String;theAddress:Dword;Valuetype:integer):string;
  end;

Type
TFileFirstScanThread=class(TThread)
 private
   TheTaskIndex:integer;
 protected
 procedure Execute; override;
 public
  constructor Create(theIndex:Integer);
end;

type
TFileNextScanThread=class(TThread)
 private
   TheTaskIndex:integer;
 protected
 procedure Execute; override;
 public
 constructor Create(theIndex:Integer);
end;

const
  Auto_value=0;
  Byte_value=1;
  word_value=2;
  Dword_value=3;
  int64_value=4;
  Single_value=5;
  Double_Value=6;
  String_Value=7;

  CommonLevel_Value=10;
  Number_Scan = 101;
  String_Scan=102;
  

  LowLevel_Value=20;
  InitialLowLevel_Scan =201;
  Increased_Scan =202;
  Decreased_Scan = 203;
  Changed_Scan = 204;
  Unchanged_Scan = 205;
const Max_FileTaskNUm=255;

type
  TFiletask=record
  Applyed:Boolean;                       ///占用
  name:String;
  index:integer;
  FilepathName:String;
  ScanType:integer;            //Number_Scan:=  ]
  OldScanType:integer;
  VarType:integer;            //选择某一类型后,实际搜索类型auto
  OldVarType:integer;
  ScanValue:string;
  TotalProcess:Dword;                   ///应扫描总的地指数
  NowProcess:Dword;                    ////扫描数量
  InSearchProcess:Boolean;               ///是否正在扫描，防止多次点击
  SearchTimes:DWORD;                   //扫描次数
  AttachedNum:DWORD;
  SaveFileName:String;                  ///存档文件最新备份
  AddressMemStream:TMemoryStream;         //几下每个符合的地址
end;

var theFileTask:array[1..Max_FileTaskNUm]of TFiletask;
    CurrentFileTaskIndex:Integer;
    ListToFileTaskIndex:array[1..Max_FileTaskNUm] of Integer; //listview 对应任务Index
    FileTaskNUm:Integer=0;  ///任务个数
    ErrorInputNum:BYTE;
    CanUpdateFileTask:Integer=-999; ///防止更新闪烁，



var
  ArchiveEditForm: TArchiveEditForm;

implementation

uses AddFileTaskUnit, InputhelpUnit, FileRecordUnit, FileEditUnit;

{$R *.dfm}
////
function TArchiveEditForm.checkAndGetFileSize(FileName:string):Dword;
var FHandle:Integer;
    TempSize:Int64;
begin
result:=0;
  if not FileExists(FileName)  then
  begin
   showmessage(format(string_NotExists,[FileName]));
   exit;
  end;
  FHandle := FileOpen(FileName, fmOpenWrite or fmShareDenyNone);
  try
   begin
  if (FHandle<0) then
  begin
   showmessage(format(string_cannotopen,[FileName]));
   exit;
  end;
  TempSize:=GetFileSize(FHandle,nil);
  if (TempSize=0) or (TempSize>=$4000000) then
  begin
   showmessage(format(String_InvalidFile,[FileName]));
   exit;
  end else   result:=Tempsize;
    end;
  finally
      FileClose(FHandle);
  end;
end;
//////////////初始化任务//////////////////////////////////
procedure TArchiveEditForm.InitFiletask(theID:Integer);
begin
with theFileTask[theId] do
begin
    Applyed:=True;
    name:='';
    //index:integer;
    FilepathName:='';
    ScanType:=Number_Scan;            //Number_Scan:=  ]
    OldScanType:=ScanType;
    VarType:=Auto_value;            //选择某一类型后,实际搜索类型auto
    OldVarType:=Auto_value;
    ScanValue:='';
    TotalProcess:=0;
    NowProcess:=0;
    SearchTimes:=0;
    AttachedNum:=0;
    InSearchProcess:=False;
    SaveFileName:='';
    if Assigned(AddressmemStream)then
       AddressMemStream.SetSize(0) else
       AddressMemStream:=TmemoryStream.Create;
end;
end;


Procedure TArchiveEditForm.AddTasktoList(theIndex:integer);
begin
  with FileTasks_LV.Items.Add do
   begin
   Caption:=theFileTask[theIndex].Name;
   end;
end;

Procedure TArchiveEditForm.UpdateTaskInfo(theIndex:integer);
begin
if FiletaskNum=0 then
begin
  File_info_Name_LB.Caption:=String_Filenotask;
  File_Info_SearchResult_LB.Caption:=String_Filenoresult;
  Found_lv.Clear;
end else
begin
  With theFileTask[theIndex] do
   begin
   File_info_Name_LB.Caption:=Name;
   File_Info_SearchResult_LB.Caption:=Format(String_FileScanResult,[SearchTimes,AttachedNum]);
   end;

end;
end;
///////////////////////////////////
//////////根据输入的值判断scantype//////////////////////////////////////////////////
Function GetScanTypeAndTempVar(InputValue:String;theFiletaskIndex:integer):Integer;
var Len:integer;
begin
Result:=-999;
with theFiletask[theFiletaskIndex] do
begin

Len:=length(inputValue);
      if InputValue=''     then
      Exit
else  if inputvalue[1]='?' then
      begin
      VarType:=LowLevel_value;
      Result:=InitialLowLevel_Scan;
      end
else  if InputValue[1]='!' then
      begin
      VarType:=LowLevel_value;
      Result:=Changed_Scan;
      end
else  if InputValue[1]='=' then
      begin
      VarType:=LowLevel_value;
      Result:=UnChanged_Scan;
      end
else  if InputValue[1]='+' then
      begin
      VarType:=LowLevel_value;
      Result:=Increased_scan;
      end
else  if InputValue[1]='-' then
      begin
      VarType:=LowLevel_value;
      Result:=Decreased_scan ;
      end      
else if (
           ((Len>2)   and ( Len<255) )                         and
           (
           ((InputValue[1]='"')   and (InputValue[Len]='"'))    or
           ((InputValue[1]='''') and (InputValue[Len]=''''))
           )

        )
      then
      begin
      ScanValue:=Copy(inputValue,2,Len-2);
      VarType:=CommonLevel_value;
      Result:=String_Scan;
      end
else  begin
      ScanValue:=inputValue;
      /////Vartype必须考虑Combobox的选择
      Result:=Number_Scan;
      end;
end; ///with end;

end;
//////////////////////////////////////////////////////////////////
/////////////hex to int///////////////////////////////////////////////////////////////////////////////
Function  HexIntChange(inStr:string):String;
var Len:integer;
    TempString:String;
begin
Len:=Length(inStr);
if (Len>2) and ( UpperCase(instr[1])+UpperCase(instr[2])='0X' )then
begin
TempString:='$'+Copy(Instr,3,Len-2);
try
Result:=inttoStr(Strtoint(TempString));
except
showmessage(String_InvalidInput);
end;
Exit;
end;

if (Len>1) and (instr[1]='$') then
begin
try
Result:=inttoStr(Strtoint(instr));
except
showmessage(String_InvalidInput);
end;
Exit;
end;

result:=instr;

end;
////////////根据输入值判断输出可用///////////////////////////////////////////////////////
Function  GetVarTypeAndVarValue(InputValue:String;theFileTaskIndex:integer):Integer;
var ByteTemp:Byte;
    WordTemp:word;
    DwordTemp:Dword;
    Int64Temp:int64;
    SingleTemp:Single;
    DoubleTemp:Double;
    ECode:integer;
begin
Result:=-999; //error value
with theFileTask[theFileTaskIndex] do
begin

   if (ScanType<>Number_Scan) and (ScanType<>String_Scan) then
   begin
   Result:=LowLevel_value;
   Exit;
   end;
   
   if (ScanType=String_Scan) then
   begin
   ScanValue:=inputvalue;
   Result:=CommonLevel_value;
   Exit;
   end;


  if ScanType=Number_Scan then
  begin

  if (VarType=Auto_value) then
     begin
//is integer
      if pos('.',inputValue)=0 then
          try
          begin
          inputValue:=HexIntChange(inputValue);
          val(inputvalue,int64Temp,Ecode);
          if Ecode>0 then Exit;
          ScanValue:=inputValue;
             if (int64Temp shr 8)=0 then Result:=Byte_value
             else if (int64Temp shr 16)=0 then Result:=Word_value
             else if (int64Temp shr 32)=0 then Result:=DWord_value
             else if (int64Temp shr 64)=0 then Result:=Int64_value
            else Result:=Int64_value;
           exit;
          end;
          except
          Exit;
          end;

       //is float
      if pos('.',inputValue)>0 then
      try
      begin
         val(inputValue,DoubleTemp,Ecode);
         if Ecode>0 then Exit;
         ScanValue:=inputValue;
         if ( DoubleTemp-Exp(ln(2)*128)>0 ) or ( DoubleTemp-Exp(ln(2)*(-126))<0) then
         Result:=Double_value else
         Result:=single_value;
         exit;
     end;
     except
     exit;
     end;

     end///Auto_value
     else
     begin

    case VarType of
    Byte_value:  begin
             val(InputValue,ByteTemp,Ecode);
             if Ecode<>0 then Exit else
             begin
             ScanValue:=InputValue;
             Result:=Byte_value;
             end;
                end;
    Word_value:  begin
             val(InputValue,WordTemp,Ecode);
             if Ecode<>0 then Exit else
             begin
             ScanValue:=InputValue;
             Result:=Word_value;
             end;
                end;
    Dword_value: begin
             val(InputValue,DwordTemp,Ecode);
             if Ecode<>0 then Exit else
             begin
             ScanValue:=InputValue;
             Result:=DWord_value;
             end;
             end;
    Int64_value: begin
             val(InputValue,int64Temp,Ecode);
             if Ecode<>0 then Exit else
             begin
             ScanValue:=InputValue;
             Result:=Int64_value;
             end;
                 end;
    Single_value:begin
             val(InputValue,SingleTemp,Ecode);
             if Ecode<>0 then Exit else
             begin
             ScanValue:=InputValue;
             Result:=Single_value;
             end;
                 end;
   Double_value:begin
             val(InputValue,DoubleTemp,Ecode);
             if Ecode<>0 then Exit else
             begin
             ScanValue:=InputValue;
             Result:=Double_value;
             end;
                end;
   String_value:begin
             ScanValue:=InputValue;
             Result:=String_value;
               end;

   end; //case end;

     end; ///not auto_value End;

   end;///Extrac_scan end
end;///with end;
end;
///////////////////////////////////////////////////////////////////////////////////////////




///////////查找到的 地址数据加入列表
Procedure TArchiveEditForm.AddFoundToListView(theIndex:integer);
var FileSize:Dword;
    BufSize:Int64;
    AddressBuf:Dword;
    i,j:Integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempStringBYTE:BYTE;
    TempStringCount:byte;
    Tempstring:string;
    tempFileStream:TmemoryStream;
begin
Found_LV.Items.BeginUpdate;///防止闪烁
Found_LV.Items.Clear;
with theFiletask[theIndex] do
begin
FileSize:=checkAndGetFileSize(FilePathName);
if FileSize=0  then exit;
tempFileStream:=TmemoryStream.Create;
 try
   tempFileStream.LoadFromFile(FilePathName);

AddressmemStream.Seek(0,soFrombeginning); ////低阶搜索BufSize=0;
BufSize:= AddressMemStream.Size;
if (BufSize>0) and ( not theFiletask[theIndex].InSearchProcess) then
begin
BufSize:=BufSize shr 2;
if BufSize>200 then BufSize:=200;  ///只显示前面200个值
  For i:=1 to BufSize do        
  begin
   try

   AddressMemStream.ReadBuffer(AddressBuf,Sizeof(AddressBuf));
   
   if (AddressBuf+1)<=FileSize  then
   begin
    tempFileStream.Seek(AddressBuf,soFrombeginning);
   tempFileStream.ReadBuffer(TempByte,1);
   end;

   if (AddressBuf+2)<=FileSize then
   begin
   tempFileStream.Seek(AddressBuf,soFrombeginning);
   tempFileStream.ReadBuffer(TempWord,2);
   end;

   if (AddressBuf+4)<=FileSize then
   begin
   tempFileStream.Seek(AddressBuf,soFrombeginning);
   tempFileStream.ReadBuffer(TempDWord,4);
   end;

   if (AddressBuf+8)<=FileSize then
   begin
   tempFileStream.Seek(AddressBuf,soFrombeginning);
   tempFileStream.ReadBuffer(TempInt64,8);
   end;

   if (AddressBuf+4)<=FileSize then
   begin
   tempFileStream.Seek(AddressBuf,soFrombeginning);
   tempFileStream.ReadBuffer(TempSingle,4);
   end;

   if (AddressBuf+8)<=FileSize then
   begin
   tempFileStream.Seek(AddressBuf,soFrombeginning);
   tempFileStream.ReadBuffer(TempDouble,8);
   end;

   tempStringCount:=(FileSize-AddressBuf);
   if tempStringCount>16 then  tempStringCount:=16;
   tempFileStream.Seek(AddressBuf,soFrombeginning);
    Tempstring:='';
   for j:=1 to tempStringCount do
   begin
   tempFileStream.ReadBuffer(TempStringBYTE,1);
   Tempstring:=Tempstring+chr(TempstringBYTE);
   end;

    with Found_LV.Items.Add do
     begin
     Caption:=intTohex(AddressBuf,8);
     SubItems.Add(intToStr(TempByte));
     SubItems.Add(intToStr(TempWord));
     SubItems.Add(intToStr(TempDword));
     SubItems.Add(intToStr(TempInt64));
     SubItems.Add(FloatToStr(TempSingle));
     SubItems.Add(FloatToStr(TempDouble));
     SubItems.Add(TempString);
     end;

   except
     Continue;
   end;

  end;//for end

end; //if end
   finally
    FreeandNIl(tempFileStream);
   end;


end;///with end
Found_lv.Items.EndUpdate;
end;


Procedure TArchiveEditForm.RaiseInputError;
begin
with theFileTask[CurrentFiletaskIndex] do
  begin
          inc(ErrorInputNum);
          Value_Edit.SetFocus;          
          if ErrorInputNum>3 then
             begin
                Messagebeep(0);
                ErrorInputNum:=0;
                InputHelp_sb.click;
             end;

  end;
end;











procedure TArchiveEditForm.AddFIle_TBClick(Sender: TObject);
begin
AddFiletaskForm.Show;
end;

procedure TArchiveEditForm.delFile_tbClick(Sender: TObject);
var i,SelListIndex,theIndex:integer;
begin
if Filetasknum=0 then Exit;
if FIleTasks_LV.Selected<>nil then
begin
SelListIndex:=FIleTasks_LV.Selected.Index+1;
theIndex:=ListToFileTaskIndex[SelListIndex];
if theFileTask[theindex].InSearchProcess  then
 begin
 MessageBox(Application.Handle,pchar(String_FileInScan),pchar(String_FileInScanTitle),
           MB_OK or MB_ICONINFORMATION);

  exit;
 end;

theFileTask[theindex].Applyed:=False;
theFileTask[theIndex].AddressMemStream.Clear;
Dec(FiletaskNUm);
  for i:=SelListIndex to FiletaskNum do
   begin
    ListToFileTaskIndex[i]:=ListToFileTaskIndex[i+1];
   end;
FileTasks_lv.selected.Delete;
DeleteFile(theFileTask[theIndex].SaveFileName);
UpdateTaskInfo(theFileTask[theIndex].Index);
end;
end;

procedure TArchiveEditForm.Filetasks_LVEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
theFileTask[CurrentFiletaskIndex].Name:=S;
UpdateTaskInfo(CurrentFiletaskIndex);

end;

procedure TArchiveEditForm.Filetasks_LVClick(Sender: TObject);
var selListIndex:Integer;
begin
if Filetasks_LV.Selected=nil then exit;

selListIndex:=Filetasks_LV.Selected.Index+1;
CurrentFiletaskIndex:=ListToFiletaskIndex[selListIndex];
Scan_Gauge.MaxValue:=theFileTask[CurrentFiletaskIndex].TotalProcess;
Value_Edit.Text:=theFileTask[CurrentFiletaskIndex].ScanValue;
if theFileTask[CurrentFileTaskIndex].ScanType=String_Scan then
 Value_Edit.Text:=''''+theFileTask[CurrentFiletaskIndex].ScanValue+'''';
UpdateTaskInfo(CurrentFiletaskIndex);
VarType_cb.ItemIndex:=0;
AddFoundToListView(CurrentFiletaskIndex);
  File_name:=theFileTask[CurrentFiletaskIndex].FilepathName;
  EditFileName:=File_name;
  FileRecordForm.FormRefresh;
end;

//////必须考虑前面的搜索类型
function TArchiveEditForm.AnalyseScan(theIndex:Integer):integer;
var TempLength:Dword;
    TempSize:Dword;
begin
result:=-999;
with theFileTask[theIndex] do
begin
    ////////////////////检查文件是否存在/////////////////////////////////////
    TempLength:=checkAndgetFilesize(FilepathName);
    if TempLength=0 then
    begin
    result:=0;
    exit;
    end;
    ////////////////////////////////////////////////////////////
    if  SearchTimes=0 then
    begin
    tempSize:=tempLength;
    TotalProcess:= TempSize;
     Result:=4;        ///ok
     exit;
    end;
   /////////////////////是否重复低阶搜索初始化////////////////////////////////////////
    if ((SearchTimes=1) and (OldVartype=LowLevel_value) and (ScanType=InitialLowLevel_Scan) )then
    begin
     Result:=1;
     Exit;
    end;
   //////////////////高低阶是否匹配///////////////////////////////////////////////
   if SearchTimes>0 then
   begin
     if ( (OldVarType=Lowlevel_Value) and (VarType<>Lowlevel_Value) )  or
        ( (OldVarType<>Lowlevel_Value) and (VarType=Lowlevel_Value)) 
    then
   begin
   result:=2;
   exit;
   end;

  end;
  /////////////////////确定搜索范围大小，////////////////////////////////////////////////////////////
   if SearchTimes>0 then
   begin
     if (SearchTimes=1) and (OldvarType=LowLevel_Value) then
     begin
      ///TempLength:=checkAndgetFilesize(FilepathName);
     TempSize:=TempLength;
     end else
      begin
       TempLength:=AddressMemStream.Size;
       TempSize:=TempLength shr 2;
      end;
    if TempSize=0 then     begin      Result:=3;      exit;   end;
    TotalProcess:= TempSize;
    Result:=4;/////ok
    end;
  ///////////////////////////////
    
end;//////with end
end;


function TArchiveEditForm.CheckForScan:boolean;
begin
Result:=false;
with theFiletask[CurrentFileTaskIndex] do begin

case AnalyseScan(CurrentFileTaskIndex) of
0: begin
   Raise Exception.Create(String_FileTaskinvalid);
   end;
1: begin
      if MessageBox(Application.Handle,pchar(String_FileAskRepeatInitLowLevel),
              pchar(String_FileAskRepeatInitLowLevelTitle),
              MB_YESNO or MB_ICONINFORMATION)=IDYES then
       begin
         TotalProcess:=0;
         SearchTimes:=0;
         AttachedNum:=0;
         AddressMemStream.Clear;
         Result:=True;
         Exit;
      end else exit;

    end;
2: begin
     if MessageBox(Application.Handle,pchar(String_FileTypeNoMatch),
              pchar(String_FileTypeNoMatchTitle),
              MB_YESNO or MB_ICONINFORMATION)=IDYES then
     begin
        TotalProcess:=0;
         SearchTimes:=0;
         AttachedNum:=0;
         AddressMemStream.Clear;
         Result:=True;
         exit;
     end else Exit;
    end;
3:  begin
      if MessageBox(Application.Handle,pchar(String_FileNoResultAgain),
              pchar(String_FileNoResultAgainTitle),
              MB_YESNO or MB_ICONINFORMATION)=IDYES then
      begin
         TotalProcess:=0;
         SearchTimes:=0;
         AttachedNum:=0;
         AddressMemStream.Clear;
         Result:=True;
         Exit;
      end else Exit;

    end;
4:  Result:=True;
   end;  ///case end

 end;///with edn

end;




procedure TArchiveEditForm.Scan_bnClick(Sender: TObject);
begin
if FileTaskNum=0 then
begin
if MessageBox(Application.Handle,pchar(String_Addtask),pchar(String_Addtasktitle),
           MB_YESNO or MB_ICONINFORMATION)=IDYES then

 AddFile_TB.Click;
 Exit;
end;

with theFileTask[CurrentFiletaskIndex] do
begin
  if InSearchProcess then
   begin
  MessageBox(Application.Handle,pchar(String_InScan),pchar(String_InScanTitle),
           MB_OK or MB_ICONINFORMATION);
  exit;
   end;///防止搜索过程中不断点击

  ScanType:=GetScanTypeAndTempVar(Value_Edit.text,CurrentFiletaskIndex);
  if  ScanType=-999 then begin RaiseInputError;exit;end;
  /////Vartype必须考虑Combobox的选择
  theFileTask[CurrentFiletaskIndex].VarType:=VarType_cb.ItemIndex;
  varType:=GetVarTypeAndVarValue(ScanValue,CurrentFiletaskIndex);
  if  varType=-999 then begin RaiseInputError;exit;end;

  if not CheckForScan then exit;



if SearchTimes=0 then
begin
TFileFirstScanThread.Create(CurrentFileTaskIndex);
end  else
begin
TFileNextScanThread.Create(CurrentFileTaskIndex);
end;

end;///with end;

end;


//////////////////初次扫描////////////////////////////////
constructor TFileFirstScanThread.Create(theIndex:integer);
begin
TheTaskIndex:=theIndex;
inherited Create(False);
end;


Procedure TFileFirstScanThread.Execute;
var TempLength: DWORD;               ////字节大小
    TempSize:DWORD;                 //// 实际的读取尺寸

    ReadByte: Byte;
    ReadWord: Word;
    ReadDWord: Dword;
    ReadInt64: Int64;
  //  ReadSingle: Single;
   // Readdouble: double;
    ReadCharByte:Byte;

    PhelpSingleDword:^Dword;
    helpsingleDWord1:DWord;  //存放原数的符号位与指数位
    HelpSingleDword2:Dword;

    PhelpDoubleint64:^int64;
    helpDoubleint641:int64;  //存放原数的符号位与指数位
    HelpDoubleint642:int64;

    HelpStringLength:Byte;
    chartoFind:integer;

    Time1:Dword;
    Time2:Dword;

    i: integer;
  //  j: integer;
   // k: integer;

    ByteValue: Byte;
    WordValue: Word;
    DWordValue: Dword;
    Int64Value: Int64;
    SingleValue: Single;
    doubleValue: double;

    tempFileMemStream:TmemoryStream;
    tempAddress:Dword;
begin
FreeOnTerminate:=True;
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
/////////////再次并得到最终数据/////////////////////////////////////////
with theFileTask[theTaskIndex] do
begin

if (scanType=Number_Scan) then
begin
    if Vartype=Byte_value then
    begin
      val(scanvalue,bytevalue,i);
      if i>0 then raise Exception.Create(Format(String_InvalidByte,[scanvalue]));
    end;
    if vartype=word_value then
    begin
      val(scanvalue,wordvalue,i);
      if i>0 then raise Exception.Create(Format(String_InvalidWord,[scanvalue]));
    end;
    if vartype=dword_value then
    begin
      val(scanvalue,dwordvalue,i);
      if i>0 then raise Exception.Create(Format(String_InvalidDword,[scanvalue]));
    end;
    if vartype=Int64_value then
    begin
      val(scanvalue,Int64value,i);
      if i>0 then raise Exception.Create(Format(String_InvalidInt64,[scanvalue]));
    end;
   if vartype=single_value then
    begin
      val(scanvalue,singlevalue,i);
      if i>0 then raise Exception.Create(Format(String_InvalidSingle,[scanvalue]));
    end;
    if vartype=double_value then
    begin
      val(scanvalue,doublevalue,i);
      if i>0 then raise Exception.create(Format(String_InvalidDouble,[scanvalue]));
    end;
    if vartype=String_value then
    begin
    if Length(scanvalue)>255 then raise Exception.create(Format(String_InvalidString,[scanvalue]));
    end;

end;//if end;
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
   AddressMemStream.Seek(0,soFromBeginning);
   OldScanType:=ScanType;
   InSearchProcess:=True;
   Searchtimes:=1;
   NowProcess:=0;
   AttachedNum:=0;
//////////////////////////////////////
OldScanType:=ScanType;
OldVarType:=VarType;
if ArchiveEditForm.checkAndgetFilesize(FilepathName)=0 then exit;
totalProcess:=ArchiveEditForm.checkAndgetFilesize(FilepathName);


tempFileMemStream:=TmemoryStream.Create;
try
  begin
 tempFileMemStream.LoadFromFile(FilePathName);
 tempFileMemStream.Seek(0,sofrombeginning);
/////////Lets Real Start !真正开始!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////////

////////////////////////////////////////////////////////////

if ScanType=Number_Scan then
begin
    Time1:=GetTickCount;
    TempLength:=tempFileMemStream.Size;
    
    if vartype=Byte_value then  //byte
    begin
    TempSize:=TempLength;
      for i:=0 to TempSize-1 do
      begin
       tempFileMemStream.Seek(i,sofrombeginning); 
       tempFileMemStream.ReadBuffer(readByte,1);
        if readByte=ByteValue then
              begin
              inc(AttachedNum);
              tempAddress:=i;
              AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;   //byte end
 
    if vartype=Word_value then //word
    begin
    TempSize:=TempLength;
      for i:=0 to TempSize-2 do
      begin
       tempFileMemStream.Seek(i,sofrombeginning); 
       tempFileMemStream.ReadBuffer(readWord,2);
        if readWord=WordValue then
              begin
              inc(AttachedNum);
              tempAddress:=i;
              AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;  //word end

   if vartype=Dword_value then //dword
   begin
    TempSize:=TempLength;
      for i:=0 to TempSize-4 do
      begin
       tempFileMemStream.Seek(i,sofrombeginning);
       tempFileMemStream.ReadBuffer(readDWord,4);
        if readDWord=DWordValue then
              begin
              inc(AttachedNum);
              tempAddress:=i;
              AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;  //dowrd end

   if vartype=Int64_value then //int64
   begin
    TempSize:=TempLength;
      for i:=0 to TempSize-8 do
      begin
       tempFileMemStream.Seek(i,sofrombeginning);
       tempFileMemStream.ReadBuffer(readInt64,8);
        if readInt64=Int64Value then
              begin
              inc(AttachedNum);
              tempAddress:=i;
              AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;   //int64 end

   if vartype=Single_value then //Single
   begin
      PHelpSingleDword:=@singlevalue;
      HelpSingleDword1:=(PHelpSingleDword^ shr 23);
      TempSize:=TempLength;
      for i:=0 to TempSize-4 do
      begin
       tempFileMemStream.Seek(i,sofrombeginning);
       tempFileMemStream.ReadBuffer(HelpsingleDword2,4);
         ///single的1位符号位与8位指数为相同
        HelpsingleDWord2:=HelpsingleDWord2 shr 23;
        if helpsingleDWord2=helpsingleDWord1 then
              begin
              inc(AttachedNum);
              tempAddress:=i;
              AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;  ///single end

   if vartype=Double_value then //Double
   begin
      PHelpDoubleint64:=@Doublevalue;
      HelpDoubleint641:=(PHelpDoubleInt64^ shr 52);
      TempLength:=tempFileMemStream.Size;
      TempSize:=TempLength;
      for i:=0 to TempSize-8 do
      begin
        tempFileMemStream.Seek(i,sofrombeginning);
        tempFileMemStream.ReadBuffer(HelpDoubleInt642,8);
           ///double的1位符号位与11位指数为相同
          HelpDoubleInt642:=HelpDoubleint642 shr 52;
          if helpDoubleInt642=helpDoubleInt641 then
                 begin
                 inc(AttachedNum);
                 tempAddress:=i;
                 AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
                 end;
        inc(NowProcess);
      end;
    end;//double end

  NowProcess:=totalProcess;
  time2:=getTickCount;
  CanUpdateFileTask:=messageBox(Application.handle,
                 pchar(Format(String_FileTaskResult,[name,AttachedNum,(Time2-Time1)/1000])),                 //pchar('任务:'+name+#13#10+'总共找到'+intToStr(AttachedNum)+'个结果 耗时'+FloattoStr((Time2-Time1)/1000)+'秒'),
                 pchar(String_FileTaskResultTitle),
                 MB_OK);

end; //Number_Scan end

//text String scan
if scantype=string_scan then
  begin
    time1:=getTickCount;
    helpStringLength:=length(scanvalue);
    TempLength:=tempFileMemStream.Size;
    TempSize:=TempLength;
    CharToFind:=1;
    for i:=0 to TempLength-1 do
    begin
    tempFileMemStream.Seek(i,sofrombeginning);
    tempFileMemStream.ReadBuffer(ReadcharByte,1);
    if chr(readcharByte)=scanvalue[CharToFind] then
       begin
         inc(charToFind);
            if CharToFind>=Dword(helpStringLength)+1 then //found the string
            begin
            inc(AttachedNum);
            tempAddress:=i-helpStringLength+1;
            AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
            CharToFind:=1;
            end;
       end else CharToFind:=1;
       inc(NowProcess);
    end;
    NowProcess:=totalProcess;
    time2:=getTickCount;
    CanUpdateFileTask:=messageBox(Application.handle,
                 pchar(Format(String_FileTaskResult,[name,AttachedNum,(Time2-Time1)/1000])),                 //pchar('任务:'+name+#13#10+'总共找到'+intToStr(AttachedNum)+'个结果 耗时'+FloattoStr((Time2-Time1)/1000)+'秒'),
                 pchar(String_FileTaskResultTitle),
                 MB_OK);
end; //text String scan

///低阶扫描初始化////////////
//if (scantype<>Number_scan) and (scantype<>String_scan) then
if (VarType=LowLevel_Value) then
begin
  tempFileMemStream.SaveToFile(SaveFileName);
  NowProcess:=totalProcess;
  CanUpdateFileTask:=messageBox(Application.handle,
                 pchar(format(String_FileInitialLowLevel,[name])),
                 pchar(String_FileTaskResultTitle),
                 MB_OK);
end;

InSearchProcess:=False;

   end;  ///try end;
  finally
  FreeAndNil(tempFileMemStream);
  end;
end;//with scan end;

end;
//////////////////////////////////////////////////////////////////////////////////////////


constructor TFileNextScanThread.Create(theIndex:integer);
begin
TheTaskIndex:=theIndex;
inherited Create(False);
end;


///////////////////第二次三次..的扫描///////////////////////////////////////////////////////////////
Procedure TFileNextScanThread.Execute;
var TempLength: DWORD;
    TempSize:DWORD;

    ReadByte: Byte;
    ReadWord: Word;
    ReadDWord: Dword;
    ReadInt64: Int64;
  //  ReadSingle: Single;
   // Readdouble: double;
    ReadCharByte:Byte;
    
    PhelpSingleDword:^Dword;
    helpsingleDWord1:DWord;  //存放原数的符号位与指数位
    HelpSingleDword2:Dword;

    PhelpDoubleint64:^int64;
    helpDoubleint641:int64;  //存放原数的符号位与指数位
    HelpDoubleint642:int64;
    
   // ReadMemory_ArrayStringByte:Array[0..$FF] of Byte;
    HelpStringLength:Byte;
    chartoFind:integer;

    Time1:Dword;
    Time2:Dword;

    i: integer;
    j: integer;
   // k: integer;


    ByteValue: Byte;
    WordValue: Word;
    DWordValue: Dword;
    Int64Value: Int64;
    SingleValue: Single;
    doubleValue: double;

    FileReadByte:Byte;
    FileReadByteNew:Byte;
    TempAddress:Dword;
    AddressMemStreamNew:TmemoryStream;   //////新地址
    tempFileMemStream:TmemoryStream;      ///打开文件
    tempFileMemStreamNew:TmemoryStream;   ///保存的低阶文件
begin
FreeOnTerminate:=True;
with theFileTask[theTaskIndex] do
begin
/////////////////////////////////////////////////
/////////////再次并得到最终数据/////////////////////////////////////////
if (scanType=Number_Scan)then
begin
    if Vartype=Byte_value then
    begin
      val(scanvalue,bytevalue,i);
      if i>0 then raise Exception.Create(Format(String_InvalidByte,[scanvalue]));
    end;
    if vartype=word_value then
    begin
      val(scanvalue,wordvalue,i);
      if i>0 then raise Exception.Create(Format(String_InvalidWord,[scanvalue]));
    end;
    if vartype=dword_value then
    begin
      val(scanvalue,dwordvalue,i);
      if i>0 then raise Exception.Create(Format(String_InvalidDword,[scanvalue]));
    end;
    if vartype=Int64_value then
    begin
      val(scanvalue,Int64value,i);
      if i>0 then raise Exception.Create(Format(String_InvalidInt64,[scanvalue]));
    end;
   if vartype=single_value then
    begin
      val(scanvalue,singlevalue,i);
      if i>0 then raise Exception.Create(Format(String_InvalidSingle,[scanvalue]));
    end;
    if vartype=double_value then
    begin
      val(scanvalue,doublevalue,i);
      if i>0 then raise Exception.create(Format(String_InvalidDouble,[scanvalue]));
    end;
    if vartype=String_value then
    begin
    if Length(scanvalue)>255 then raise Exception.create(Format(String_InvalidString,[scanvalue]));
    end;

end;//if end
////////////////////////////////////////////////////////////////////////////
  InSearchProcess:=True;
  NowProcess:=0;
  AttachedNum:=0;
  INC(SearchTimes);
   OldScanType:=ScanType;
  AddressMemStream.Seek(0,soFromBeginning);
  OldScanType:=ScanType;
  OldVarType:=VarType;
/////////NextScan真正开始!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////////

tempFileMemStream:=TmemoryStream.Create;
 tempFileMemStream.LoadFromFile(FilePathName);
 AddressMemStreamNew:=TmemoryStream.Create;
////////////////////////////////////////////////////////////
if (scanType=number_Scan) then
begin
    Time1:=GetTickCount;
    TempLength:=AddressMemStream.Size;
    TempSize:=TempLength shr 2;
    
  if vartype=Byte_value then  //Byte
    begin
      for i:=0 to TempSize-1 do
      begin
       AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
       tempFileMemStream.Seek(TempAddress,sofrombeginning);
       TRY
       tempFileMemStream.ReadBuffer(readByte,1);
       EXCEPT
       continue;
       END;
        if readByte=ByteValue then
              begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end; //byte end
 
  if vartype=Word_value then  //Word
    begin
      for i:=0 to TempSize-1 do
      begin
       AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
       tempFileMemStream.Seek(TempAddress,sofrombeginning);
       Try
       tempFileMemStream.ReadBuffer(readWord,2);
       except
       continue;
       end;
        if readWord=WordValue then
              begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;  //word end

    
  if vartype=DWord_value then  //DWord
    begin
      for i:=0 to TempSize-1 do
      begin
       AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
       tempFileMemStream.Seek(TempAddress,sofrombeginning);
       try
       tempFileMemStream.ReadBuffer(readDWord,4);
       except
       continue;
       end;
        if readDWord=DWordValue then
              begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;

  if vartype=int64_value then  //int64
    begin
      for i:=0 to TempSize-1 do
      begin
       AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
       tempFileMemStream.Seek(TempAddress,sofrombeginning);
       try
       tempFileMemStream.ReadBuffer(readInt64,8);
       except
       continue;
       end;
        if readInt64=Int64Value then
              begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;

   if vartype=Single_value then //Single
   begin
      PHelpSingleDword:=@singlevalue;
      HelpSingleDword1:=(PHelpSingleDword^ shr 23);
      for i:=0 to TempSize-1 do
      begin
       AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
       tempFileMemStream.Seek(TempAddress,sofrombeginning);
       try
       tempFileMemStream.ReadBuffer(HelpSingleDword2,4);
       except
       continue;
       end;
        ///single的1位符号位与8位指数为相同
        HelpsingleDWord2:=HelpsingleDWord2 shr 23;
        if HelpSingleDword2=HelpSingleDword1 then
              begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;

   if vartype=Double_value then //Double
   begin
      PHelpDoubleInt64:=@Doublevalue;
      HelpDoubleint641:=(PHelpDoubleInt64^ shr 52);
      for i:=0 to TempSize-1 do
      begin
       AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
       tempFileMemStream.Seek(TempAddress,sofrombeginning);
       try
       tempFileMemStream.ReadBuffer(HelpDoubleint642,8);
       except
       continue;
       end;

       ///Double的1位符号位与11位指数为相同
        HelpDoubleint642:=HelpDoubleint642 shr 52;
        if HelpDoubleint642=HelpDoubleint641 then
              begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
        inc(NowProcess);
      end;
    end;
    AddressMemStream.Clear;
    AddressMemStream.CopyFrom(AddressMemStreamNew,0);
    NowProcess:=totalProcess;
    time2:=getTickCount;
    CanUpdateFileTask:=messageBox(Application.handle,
                 pchar(Format(String_FileTaskResult,[name,AttachedNum,(Time2-Time1)/1000])),
                 pchar(String_FileTaskResultTitle),
                 MB_OK);
end; //Number_Scan end

//text String scan
if scantype=string_scan then
  begin
  time1:=getTickCount;
  TempLength:=AddressMemStream.Size;
  TempSize:=TempLength shr 2;
  helpStringLength:=length(scanvalue);
  CharToFind:=1;
  for i:=0 to TempSize-1 do
    begin
     AddressMemStream.ReadBuffer(TempAddress,sizeof(TempAddress));
     tempFileMemStream.Seek(TempAddress,sofrombeginning);
       for j:=1 to helpStringLength do
       begin
         try
         tempFileMemStream.ReadBuffer(ReadcharByte,1);
         except
         continue;
         end;
         if chr(readcharByte)=scanvalue[CharToFind] then
         begin
         inc(charToFind);
            if CharToFind>=Dword(helpStringLength)+1 then //found the string
            begin
            inc(AttachedNum);
            AddressmemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
            CharToFind:=1;
            break;
            end;
         end else
         begin
         CharToFind:=1;
         break;
         end;
       end;
     inc(NowProcess);
    end;
    
    AddressMemStream.Clear;
    AddressMemStream.CopyFrom(AddressMemStreamNew,0);
    NowProcess:=totalProcess;
    time2:=getTickCount;
    CanUpdateFileTask:=messageBox(Application.handle,
                 pchar(Format(String_FileTaskResult,[name,AttachedNum,(Time2-Time1)/1000])),
                 pchar(String_FileTaskResultTitle),
                 MB_OK);

end;

////////////////////////////第二三..次低阶扫描/////////////////////////////////////////
///if (scantype<>number_scan) and (scantype<>String_Scan)and (scantype<>InitialLowLevel_Scan) then
if VarType=LowLevel_value then
begin
Time1:=GetTickCount;
if ArchiveEditForm.checkAndgetfileSize(Filepathname)=0 then exit;
if ArchiveEditForm.checkAndgetfileSize(SaveFilename)=0 then exit;
     
    if (SearchTimes=2) then
    begin
     TempLength:=ArchiveEditForm.checkAndgetfileSize(Filepathname);
     TempSize:=TempLength;
    end else
    begin
     TempLength:=AddressMemStream.Size;
     TempSize:=TempLength shr 2;    ////Dword  Address Dword Size
    end;
     AttachedNum:=0;
     tempFileMemStreamNew:=TmemoryStream.Create;
     tempFileMemStreamNew.LoadFromFile(SaveFilename);

if SearchTimes=2 then
begin
   AddressMemStream.Clear;
   AddressMemStream.Seek(0,soFromBeginning);
   time1:=GetTickCount;
    For i:=0 to TempSize-1 do
     begin
     tempFileMemStream.Seek(i,sofrombeginning);
     try
     tempFileMemStream.ReadBuffer(FileReadByte,1);
     except
      continue;
     end;
     tempFileMemStreamNew.Seek(i,sofrombeginning);
     try
     tempFileMemStreamNew.ReadBuffer(FileReadByteNew,1);
     except
     continue;
     end;
       Application.ProcessMessages;
       //////_+++++//////////////////////////
       if scantype=Increased_Scan then
       begin
        if  FileReadByte>FileReadByteNew then
          begin
            TempAddress:=i;
            AddressMemStreamNew.WriteBuffer(TempAddress,Sizeof(TempAddress));
            inc(AttachedNum);
          end;
     inc(NowProcess);
     Continue;
      end;

      //////--------//////////////////////////
     if scantype=Decreased_Scan then
       begin
        if  FileReadByte<FileReadByteNEw then
          begin
            TempAddress:=i;
            AddressMemStreamNew.WriteBuffer(TempAddress,Sizeof(TempAddress));
            inc(AttachedNum);
          end;
     inc(NowProcess);
     Continue;
      end;
//////!!!!!!!!!!!!//////////////////////////
     if scantype=Changed_Scan then
       begin
        if  FileReadByte<>FileReadByteNew then
          begin
            TempAddress:=i;
            AddressMemStreamNew.WriteBuffer(TempAddress,Sizeof(TempAddress));
            inc(AttachedNum);
          end;
     inc(NowProcess);
     Continue;
      end;
 //////============//////////////////////////
     if scantype=UnChanged_Scan then
       begin
        if  FileReadByte=FileReadByteNew then
          begin
            TempAddress:=i;
            AddressMemStreamNew.WriteBuffer(TempAddress,Sizeof(TempAddress));
            inc(AttachedNum);
          end;
        inc(NowProcess);
        Continue;
        end;
        
     end;///for end
///
end else       ///searchtimes=2
begin
   AddressMemStream.Seek(0,soFromBeginning);
   time1:=GetTickCount;
    for i:=0 to TempSize-1 do
    begin
     Application.ProcessMessages;
     try
     AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
     except
     continue;
     end;
     tempFileMemStream.Seek(TempAddress,sofrombeginning);
     try
     tempFileMemStream.ReadBuffer(FileReadByte,1);
     except
      continue;
     end;
     tempFileMemStreamNew.Seek(TempAddress,sofrombeginning);
     try
     tempFileMemStreamNew.ReadBuffer(FileReadByteNew,1);
    except
      continue;
     end;
     //////_+++++//////////////////////////
       if scantype=Increased_Scan then
       begin
        if  FileReadByte>FileReadByteNew then
          begin
            TempAddress:=i;
            AddressMemStreamNEw.WriteBuffer(TempAddress,Sizeof(TempAddress));
            inc(AttachedNum);
          end;
     inc(NowProcess);
     Continue;
      end;

      //////--------//////////////////////////
     if scantype=Decreased_Scan then
       begin
        if  FileReadByte<FileReadByteNEw then
          begin
            TempAddress:=i;
            AddressMemStreamNEw.WriteBuffer(TempAddress,Sizeof(TempAddress));
            inc(AttachedNum);
          end;
     inc(NowProcess);
     Continue;
      end;
//////!!!!!!!!!!!!//////////////////////////
     if scantype=Changed_Scan then
       begin
        if  FileReadByte<>FileReadByteNew then
          begin
            TempAddress:=i;
            AddressMemStreamNEw.WriteBuffer(TempAddress,Sizeof(TempAddress));
            inc(AttachedNum);
          end;
     inc(NowProcess);
     Continue;
      end;
 //////============//////////////////////////
     if scantype=UnChanged_Scan then
       begin
        if  FileReadByte=FileReadByteNew then
          begin
            TempAddress:=i;
            AddressMemStreamNEw.WriteBuffer(TempAddress,Sizeof(TempAddress));
            inc(AttachedNum);
          end;      
     inc(NowProcess);
     Continue;
      end;
////////////////////////////////////////////////////////////
     end; ///for end

 end;///ebnd if else searchtime>2
  AddressMemStream.Clear;
  AddressMemStream.CopyFrom(AddressMemStreamNew,0);
  FreeAndNil(tempFileMemStreamNew);
 tempFileMemStream.SaveToFile(SaveFileName); /////覆盖
 NowProcess:=totalProcess;
 Time2:=getTickCount;
 CanUpdateFileTask:=messageBox(Application.handle,
                 pchar(Format(String_FileTaskResult,[name,AttachedNum,(Time2-Time1)/1000])),
                 pchar(String_FileTaskResultTitle),
                 MB_OK);

end; ////if VarType=LowLevel_value
   InSearchProcess:=False;
   FreeandNil(TempFileMemStream);
   FreeandNil(AddressMemStreamNew);

end;//with scan end;

end;  ///





procedure TArchiveEditForm.DisplayFileScanProcessTimer(Sender: TObject);
begin
if FiletaskNum=0 then exit;
with theFiletask[CurrentFileTaskIndex] do
begin
if (Scan_Gauge.MaxValue<>totalProcess) then   Scan_Gauge.MaxValue:=TotalProcess;
Scan_Gauge.Progress:=NowProcess;
///只有在扫描过程中更新
UpdateTaskInfo(CurrentFileTaskIndex);
   /////////////
if CanUpdateFileTask=IDOK then
 begin
  AddFoundToListView(CurrentFileTaskIndex);
   CanUpdateFileTask:=-999;
  end;
end;

end;

procedure TArchiveEditForm.InputHelp_SBClick(Sender: TObject);
begin
if not assigned(InputhelpForm)then  InputhelpForm:=TInputhelpForm.Create(self);
InputhelpForm.Showmodal;
InputhelpForm.Free;
InputhelpForm:=nil;

end;

procedure TArchiveEditForm.Value_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then Scan_bn.Click;

end;

procedure TArchiveEditForm.VarType_CBChange(Sender: TObject);
begin
if (FileTaskNUm=0) or (theFileTask[CurrentFileTaskIndex].InSearchProcess) then exit;
theFileTask[CurrentFileTaskIndex].VarType:=VarType_cb.ItemIndex;

end;

procedure TArchiveEditForm.ClearFileTask_menuClick(Sender: TObject);
var i,SelListIndex,theIndex:integer;
begin
if Filetasknum=0 then Exit;

for I:=1 to Filetasks_LV.Items.Count  do
begin
 SelListIndex:=i;
 theIndex:=ListToFileTaskIndex[SelListIndex];
 if theFileTask[theIndex].InSearchProcess  then
 begin
 MessageBox(Application.Handle,pchar(String_FileInScan),pchar(String_FileInScanTitle),
           MB_OK or MB_ICONINFORMATION);

  Exit;
 end;
end;

for I:=1 to Filetasks_LV.Items.Count  do
begin
 SelListIndex:=i;
 theIndex:=ListToFileTaskIndex[SelListIndex];
 theFileTask[theIndex].Applyed:=False;
 theFileTask[theIndex].AddressMemStream.Clear;
 DeleteFile(theFileTask[theIndex].SaveFileName);
end;

FiletaskNUm:=0;
FileTasks_lv.Items.Clear;
UpdateTaskInfo(theFileTask[theIndex].Index);

end;


procedure TArchiveEditForm.Found_LVDblClick(Sender: TObject);
begin
if Found_LV.Selected=nil then exit;
  FileRecordForm.Show;

end;

Function TArchiveEditForm.ReadFileData(theFileName:String;theAddress:Dword;valuetype:integer):string;
var AddressBuf:Dword;
    i:Integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempStringBYTE:BYTE;
    Tempstring:string;
    tempFileStream:TmemoryStream;
begin
result:='Error!';

if checkAndGetFileSize(theFileName)=0  then exit;
tempFileStream:=TmemoryStream.Create;
 try
   tempFileStream.LoadFromFile(theFileName);
   tempFileStream.Seek(theAddress,soFrombeginning);
   
   try

     case ValueType of
         Byte_value: begin
                     tempFileStream.ReadBuffer(TempByte,1);
                     result:=IntTOStr(TempByte);
                     end;
         Word_value: begin
                     tempFileStream.ReadBuffer(TempWord,2);
                     result:=IntTOStr(TempWord);
                     end;
         Dword_value:begin
                     tempFileStream.ReadBuffer(TempDWord,4);
                     result:=IntTOStr(TempDword);
                     end;
         Int64_value:begin
                     tempFileStream.ReadBuffer(TempInt64,8);
                     result:=IntTOStr(Tempint64);
                     end;
         Single_value:begin
                      tempFileStream.ReadBuffer(TempSingle,4);
                      result:=FloatTOStr(TempSingle);
                     end;
         Double_value:begin
                      tempFileStream.ReadBuffer(TempDouble,8);
                      result:=FloatTOStr(TempDouble);
                     end;
         String_Value:begin
                      Tempstring:='';
                      for i:=1 to 16 do
                      begin
                      tempFileStream.ReadBuffer(TempStringBYTE,1);
                      Tempstring:=Tempstring+chr(TempstringBYTE);
                      end;
                      Result:=Tempstring;
                     end;
     end;//case end
   except
   end;

   finally
    FreeandNIl(tempFileStream);
   end;

end;

procedure TArchiveEditForm.Found_LVMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var tempAddress:Dword;
    Ecode:integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempString:String[16];
begin
if Found_LV.Selected=nil then exit;

Val('$'+Found_lv.Selected.Caption,tempAddress,Ecode);
File_Data_Caption:='Money';
File_name:=theFileTask[CurrentFiletaskIndex].FilepathName;
EditFileName:=File_name;
File_Address:=tempAddress;
if (theFileTask[CurrentFiletaskIndex].ScanType<>Number_Scan) and
   (theFileTask[CurrentFiletaskIndex].ScanType<>String_Scan) then
File_ValueType:=Word_Value else
File_ValueType:=theFileTask[CurrentFiletaskIndex].VarType;
case File_ValueType of
Byte_value:  begin
            File_value:=ReadFileData(File_name,File_Address,Byte_value);
             end ;
Word_value:  begin
            File_value:=ReadFileData(File_name,File_Address,Word_value);
             end ;
Dword_value:  begin
            File_value:=ReadFileData(File_name,File_Address,DWord_value);
             end ;
Int64_value:  begin
            File_value:=ReadFileData(File_name,File_Address,Int64_value);
             end ;
Single_value:  begin
             File_value:=ReadFileData(File_name,File_Address,Single_value);
             end ;
Double_value:  begin
             File_value:=ReadFileData(File_name,File_Address,Double_value);
             end ;
String_value:  begin
             File_value:=ReadFileData(File_name,File_Address,String_value);
             end ;
end;
 File_Info:=0;
FileRecordForm.FormRefresh;
end;

procedure TArchiveEditForm.EditFile_SbClick(Sender: TObject);
begin
if Filetasknum=0 then Exit;
if FileEditForm.Visible then FileEditForm.Close;
  File_name:=theFileTask[CurrentFiletaskIndex].FilepathName;
  EditFileName:=File_name;
if checkandGetFileSize(EditFileName)=0 then exit;
  NowPos:=0; 
  FileEditForm.Show;
end;

procedure TArchiveEditForm.EditAddressClick(Sender: TObject);
var TempAddress:DWORD;
    ECode:integer;
begin
if Found_LV.Selected=nil then Exit;
if Filetasknum=0 then Exit;
if FileEditForm.Visible then FileEditForm.Close;
File_name:=theFiletask[CurrentFileTaskIndex].FilepathName;
EditFileName:=File_name;
if checkandGetFileSize(EditFileName)=0 then exit;
  Val('$'+Found_LV.Selected.Caption,TempAddress,Ecode);
    Nowpos:=TempAddress;
  FileEditForm.Show;
  
end;

procedure TArchiveEditForm.DeleteFileEditAddressClick(Sender: TObject);
begin
if Edit_lv.Selected<>nil then 
Edit_lv.Selected.Delete;

end;

procedure TArchiveEditForm.ClearAllAddressClick(Sender: TObject);
begin
Edit_lv.Clear;

end;

procedure TArchiveEditForm.ModifyFileEditClick(Sender: TObject);
var TempAddress:DWORD;
    ECode:integer;
begin
if Edit_lv.Selected=nil then exit;
  FileRecordForm.Show;
  
end;

procedure TArchiveEditForm.Edit_LVMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var tempAddress:Dword;
    Ecode:Integer;
begin
if Edit_lv.Selected=nil then exit;
    File_Data_Caption:=Edit_lv.Selected.Caption;
    //File_name:string;
    ///File_Address:Dword;
    ///File_value:String;
    ///File_ValueType:integer;
    File_Info:=2;
 File_name:=Edit_lv.Selected.SubItems[3];
 EditFilename:=File_name;
if checkandGetFileSize(File_name)=0 then exit;
  Val('$'+Edit_lv.Selected.subitems[0],TempAddress,Ecode);
    File_Address:=TempAddress;
  File_value:=Edit_lv.Selected.subitems[1];

    if Edit_lv.Selected.subitems[2]='Byte_Type' then File_ValueType:=Byte_value else
    if Edit_lv.Selected.subitems[2]='Word_Type' then File_ValueType:=Word_value  else
    if Edit_lv.Selected.subitems[2]='Dword_Type'then File_ValueType:=Dword_value else
    if Edit_lv.Selected.subitems[2]='Int64_Type' then File_ValueType:=Int64_value else
    if Edit_lv.Selected.subitems[2]='Single_Type' then File_ValueType:=Single_value else
    if Edit_lv.Selected.subitems[2]='Double_Type' then File_ValueType:=Double_value else
    if Edit_lv.Selected.subitems[2]='String_Type'then File_ValueType:=String_value;
FileRecordForm.FormRefresh;

end;

procedure TArchiveEditForm.EditFileAddressClick(Sender: TObject);
var TempAddress:DWORD;
    ECode:integer;
begin
if Edit_LV.Selected=nil then Exit;
if Filetasknum=0 then Exit;
if FileEditForm.Visible then FileEditForm.Close;
File_Name:=Edit_lv.Selected.subitems[3];
EditFileName:=File_Name;
if checkandGetFileSize(File_Name)=0 then exit;
  Val('$'+Edit_lv.Selected.subitems[0],TempAddress,Ecode);
    Nowpos:=TempAddress;
  FileEditForm.Show;
  
end;

end.
