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
unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, ExtCtrls, Buttons, StdCtrls, Menus,
  Gauges, Grids, XPMan,mmsystem, OleCtrls, shlobj,comobj,activex,shellapi,SHDocVw,Registry;


resourcestring
String_notask='没有内存搜索任务;请新建加入;';
String_Addtask='没有内存搜索任务；现在就创建加入吗?';
String_Addtasktitle='没有任务信息';
String_noresult='搜索次数: 0 , 找到数目:0  ';
String_NoResultAgain='抱歉,找不到任何匹配的地址,是否再次搜索?';
String_NoResultAgainTitle='无结果信息';
String_TypeNoMatch='输入的类型不匹配上次类型(高阶/低阶),'+
                   '你想进行新类型的搜索吗? ';
String_TypeNoMatchTitle='输入的类型不匹配信息';
String_ScanResult='搜索次数:%d , 找到数目:%d ';
String_ByteType='Byte Type';
String_WordType='Word Type';
String_DWordType='DWord Type';
String_Int64Type='Int64 Type';
String_SingleType='Single Type';
String_DoubleType='Double Type';
String_StringType='Text Type';
String_applying='有效';
String_noapplying='不可用';
String_invalidSave='不能载入该文件,请检查是否为江湖行II(Game Paladin II)的存档文件';
String_AskRepeatInitLowLevel='已经进行了初始化内存的低阶搜索，'#13#10+
                         '是否再次初始化?';
String_AskRepeatInitLowLevelTitle='内存低阶搜索重复初始化信息';
String_InScan='当前的任务正在进行,请等待.';
String_InScanTitle='任务进行信息';
String_Taskinvalid='对应的进程/应用程序已经关闭.  ';
String_Maxtask='最多加入 %d 个任务,请删除部分无用的任务;';
String_NeedSeletedtask='请选择一个已有的任务.';
String_NotSethotkey1='主窗口弹出热键不合法或者该热键已经被另一程序占用;请重新设置.';
String_NotSethotkey2='抓图热键不合法或者该热键已经被另一程序占用.请重新设置';
string_setok='成功应用新的选项.';
String_selectdir='请选择一个目录:';

type
  TMainForm = class(TForm)
    MainImageList: TImageList;
    MainPageControl: TPageControl;
    MyFavorites_TS: TTabSheet;
    MemoryScan_TS: TTabSheet;
    archiveEdit_TS: TTabSheet;
    CapPic_TS: TTabSheet;
    Main_cb: TCoolBar;
    Main_TB: TToolBar;
    MemEdit_TB: TToolButton;
    archiveEdit_TB: TToolButton;
    CapPic_TB: TToolButton;
    SetOptions_TB: TToolButton;
    Help_TB: TToolButton;
    MyFavorite_TB: TToolButton;
    GameRecord_TB: TToolButton;
    GameRecord_TS: TTabSheet;
    SET_TS: TTabSheet;
    help_TS: TTabSheet;
    temp_Panel1: TPanel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    MiddleImageList: TImageList;
    taskListPopupMenu: TPopupMenu;
    delTasks_Menu: TMenuItem;
    N2: TMenuItem;
    ClearAlltasks_menu: TMenuItem;
    FoundPopMenu: TPopupMenu;
    FoundMem_Memu: TMenuItem;
    FoundAdd_memu: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    EditLock_Memu: TMenuItem;
    Panel4: TPanel;
    LockPopMenu: TPopupMenu;
    LockMod_memu: TMenuItem;
    LockAddress_menu: TMenuItem;
    N7: TMenuItem;
    LockRemove_menu: TMenuItem;
    N9: TMenuItem;
    Panel5: TPanel;
    AddNew: TPopupMenu;
    New1_menu: TMenuItem;
    N3: TMenuItem;
    new2_menu: TMenuItem;
    Lock_Clear: TMenuItem;
    openLockRecordDialog: TOpenDialog;
    SaveLockRecordDialog: TSaveDialog;
    Lockcopy_memu: TMenuItem;
    Lockpaste_menu: TMenuItem;
    N6: TMenuItem;
    ImageList1: TImageList;
    DisplayProcess: TTimer;
    XPManifest1: TXPManifest;
    Options_TreeView: TTreeView;
    Option_ImageList: TImageList;
    Options_PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Set_1_RB1: TRadioButton;
    Set_1_RB2: TRadioButton;
    Set_1_RB3: TRadioButton;
    Set_1_RB4: TRadioButton;
    set_FromEdit: TEdit;
    Set_toEdit: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Lock_Frequency_LB: TLabel;
    Lock_TrackBar: TTrackBar;
    TabSheet3: TTabSheet;
    Set_1_OK: TButton;
    Label4: TLabel;
    Main_HotKey: THotKey;
    Capture_HotKey: THotKey;
    SaveWay_RG: TGroupBox;
    SaveMode1: TRadioButton;
    SaveMode2: TRadioButton;
    CaptureSavepath_Edit: TEdit;
    SaveMode3: TRadioButton;
    Label8: TLabel;
    Set_2_ok: TButton;
    Help_popMenu: TPopupMenu;
    Content1: TMenuItem;
    Homepage1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    GroupBox3: TGroupBox;
    EnabledAlphaBlend_cb: TCheckBox;
    Alphablend_TrackBar: TTrackBar;
    set_autoRun: TCheckBox;
    Support1: TMenuItem;
    Makeappshortcut: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    path_bn: TButton;
    ToolBar1: TToolBar;
    newtask_TB: TToolButton;
    deltask_tb: TToolButton;
    MainPanel2: TPanel;
    Scan_bn: TSpeedButton;
    InputHelp_SB: TSpeedButton;
    backtogame_bn: TSpeedButton;
    Value_Edit: TEdit;
    VarType_CB: TComboBox;
    Panel3: TPanel;
    StaticText1: TStaticText;
    Task_info_Name_LB: TStaticText;
    Task_Info_SearchResult_LB: TStaticText;
    Scan_Gauge: TGauge;
    Found_LV: TListView;
    Panel6: TPanel;
    ToolBar4: TToolBar;
    SelMemEdit_TB: TToolButton;
    AddToLock_Tb: TToolButton;
    EditAddress_tb: TToolButton;
    lockRemove_TB: TToolButton;
    OpenLockRecord_TB: TToolButton;
    SaveLockRecord_TB: TToolButton;
    Splitter2: TSplitter;
    Lock_LV: TListView;
    Panel2: TPanel;
    tasks_LV: TListView;
    procedure FormCreate(Sender: TObject);
    procedure deltask_tbClick(Sender: TObject);
    procedure newtask_TBClick(Sender: TObject);
    procedure Scan_bnClick(Sender: TObject);
    procedure InputHelp_SBClick(Sender: TObject);
    procedure VarType_CBChange(Sender: TObject);
    procedure tasks_LVClick(Sender: TObject);
    procedure Value_EditKeyPress(Sender: TObject; var Key: Char);
    procedure SelMemEdit_TBClick(Sender: TObject);
    procedure tasks_LVEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure ClearAlltasks_menuClick(Sender: TObject);
    procedure EditAddress_tbClick(Sender: TObject);
    procedure FoundMem_MemuClick(Sender: TObject);
    procedure Found_LVDblClick(Sender: TObject);
    procedure EditLock_MemuClick(Sender: TObject);
    procedure New1_menuClick(Sender: TObject);
    procedure Lock_LVDblClick(Sender: TObject);
    procedure Found_LVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LockRemove_menuClick(Sender: TObject);
    procedure FoundAdd_memuClick(Sender: TObject);
    procedure Lock_ClearClick(Sender: TObject);
    procedure LockAddress_menuClick(Sender: TObject);
    procedure Lock_LVEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure Lock_LVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SaveLockRecord_TBClick(Sender: TObject);
    procedure OpenLockRecord_TBClick(Sender: TObject);
    procedure Lockcopy_memuClick(Sender: TObject);
    procedure Lockpaste_menuClick(Sender: TObject);
    procedure Set_1_RB1Click(Sender: TObject);
    procedure Set_1_RB2Click(Sender: TObject);
    procedure Set_1_RB3Click(Sender: TObject);
    procedure Set_1_RB4Click(Sender: TObject);
    procedure Lock_TrackBarChange(Sender: TObject);
    procedure MyFavorite_TBClick(Sender: TObject);
    procedure MemEdit_TBClick(Sender: TObject);
    procedure archiveEdit_TBClick(Sender: TObject);
    procedure CapPic_TBClick(Sender: TObject);
    procedure SetOptions_TBClick(Sender: TObject);
    procedure Help_TBClick(Sender: TObject);
    procedure backtogame_bnClick(Sender: TObject);
    procedure tray_minClick(Sender: TObject);
    procedure DisplayProcessTimer(Sender: TObject);
    procedure GameRecord_TBClick(Sender: TObject);
    procedure Options_TreeViewClick(Sender: TObject);
    procedure Set_1_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Set_2_okClick(Sender: TObject);
    procedure EnabledAlphaBlend_cbClick(Sender: TObject);
    procedure Alphablend_TrackBarChange(Sender: TObject);
    procedure set_autoRunClick(Sender: TObject);
    procedure MakeappshortcutClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure path_bnClick(Sender: TObject);
    procedure Homepage1Click(Sender: TObject);
    procedure Support1Click(Sender: TObject);
  private
  //FSaveEditForm:TSaveEditForm;
    { Private declarations }
  public
  function NameToCode(RegName:String;out RegString:String):Boolean;
  function SelectDir(ParentHWnd: HWnd; const Root: WideString; out Directory: string): Boolean;
  function HotKeyToShortCut(mode,value:UINT):TShortCut;
  function ShortCutToHotKey_Mode(Value: TShortCut):UINT;
  function ShortCutToHotKey_Value(Value: TShortCut):UINT;
   procedure WMhotkeyhandle(var msg:Tmessage); message wm_hotkey;
    Procedure UpdateTaskInfo(theIndex:integer);
    Procedure AddTasktoList(theIndex:integer);
   Procedure AddFoundToListView(theIndex:integer);
   Procedure UpdateLockInfo(theIndex,theListIndex:integer);
   Function CheckForScan:boolean;
   procedure RaiseInputError;
   procedure SaveOptions;
       { Public declarations }

  end;

type
  MyOption=record
  WhichPage:Byte;
  AlphaBlend:byte;
  AlphaBlendValue:byte;
  MainHotKey_mode:UINT;
  MainHotKey_value:UINT;
  ScanAddressMode:byte;
  DefaultFromAddress:Dword;
  DefaultToAddress:Dword;
  CaptureSaveMode:byte;
  CaptureSavePath:String[255];
  CaptureHotKey_mode:UINT;
  CaptureHotKey_value:UINT;
  setActivePage:Byte;
  Lock_Interval:Word;
  FormWidth:WORD;
  FormHeigth:WORD;
end;

type
TTimerThread=class(TThread)
 private
  procedure ProcessLock;
 protected
 procedure Execute; override;
 public
 constructor Create;
end;


var   MainForm: TMainForm;
      ErrorInputNum:Byte;
      Apppath:String;
      String_GPSAVE:string[$30];
      GPOptions:MyOption;
      Lock_Enable:Boolean;
      HotKeyID_Main:Integer;
      HotKeyID_Capture:Integer;
implementation

uses GetProcessIDUnit,GPKernel, InputhelpUnit, MemEditUnit, MemRecordUnit,
     MyCalcUnit,CapturePicUnit, GameRecordUnit,MyfavoritesUnit,
     ArchiveEditUnit, HelpWebBrowserUnit, RegisterUnit;

{$R *.dfm}
function TmainForm.NameToCode(RegName:String;out RegString:String):Boolean;
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

function TmainForm.SelectDir(ParentHWnd: HWnd; const Root: WideString;
  out Directory: string): Boolean;
var
  BrowseInfo: TBrowseInfo;
  Buffer: PChar;
  //RootItemIDList: PItemIDList;
   ItemIDList: PItemIDList;
  ShellMalloc: IMalloc;
  //IDesktopFolder: IShellFolder;
  //Eaten, Flags: LongWord;
begin
  Result := False;
  Directory := '';
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
  begin
    Buffer := ShellMalloc.Alloc(MAX_PATH);
    try
      //SHGetDesktopFolder(IDesktopFolder);
      //IDesktopFolder.ParseDisplayName(Application.Handle, nil, POleStr(Root), Eaten, RootItemIDList, Flags);
      with BrowseInfo do
      begin
        hwndOwner := ParentHWnd;
        //pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := PChar(String_selectdir);
        ulFlags := BIF_RETURNONLYFSDIRS; 
      end;
      ItemIDList := ShBrowseForFolder(BrowseInfo);
      Result :=  ItemIDList <> nil;
      if Result then
      begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        Directory := Buffer;
      end;
    finally
      ShellMalloc.Free(Buffer);
    end;
  end;
end;

constructor TTimerThread.Create;
begin
FreeOnTerminate:=True;
inherited Create(False);
end;

Procedure TTimerThread.ProcessLock;
var i,theIndex:integer;
    Ecode:integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempString:String[16];
    theStatus:boolean;
begin
if (LockNum=0) then exit;
for i:=1 to lockNum do
begin   ///for
  theindex:=ListToLockIndex[i];
  MemLockRecord[theindex].Frozen:=MainForm.Lock_Lv.Items.Item[i-1].Checked;
if MainForm.Lock_Lv.Items.Item[i-1].Checked then
 try
 begin

 with MemLockRecord[theindex] do
 begin
  case VarType of
Byte_value:  begin
             val(valueStr,tempByte,Ecode);
             theStatus:=WriteMemory(ProcessID,Address,@tempByte,Byte_value,1);
             if theStatus then MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_applying else
                               MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_noapplying;
             end ;
Word_value:  begin
             val(valueStr,tempWord,Ecode);
             theStatus:=WriteMemory(ProcessID,Address,@tempWord,Word_value,2);
             if theStatus then MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_applying else
                               MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_noapplying;
             end ;
Dword_value:  begin
             val(valueStr,tempDWord,Ecode);
             theStatus:=WriteMemory(ProcessID,Address,@tempDWord,Dword_value,4);
             if theStatus then MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_applying else
                               MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_noapplying;
             end ;
Int64_value:  begin
             val(valueStr,tempInt64,Ecode);
             theStatus:=WriteMemory(ProcessID,Address,@tempInt64,Int64_value,8);
             if theStatus then MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_applying else
                               MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_noapplying;
             end ;
Single_value:  begin
              val(valueStr,tempSingle,Ecode);
             theStatus:=WriteMemory(ProcessID,Address,@tempSingle,Single_value,4);
             if theStatus then MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_applying else
                               MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_noapplying;
             end ;
Double_value:  begin
              val(valueStr,tempDouble,Ecode);
             theStatus:=WriteMemory(ProcessID,Address,@tempDouble,Double_value,8);
             if theStatus then MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_applying else
                               MainForm.Lock_Lv.Items.Item[i].SubItems[4]:=String_noapplying;
             end ;
String_value:  begin
             tempString:=valueStr;
             theStatus:=WriteMemory(ProcessID,Address,@tempString[1],String_value,Length(tempString));
             if theStatus then MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_applying else
                               MainForm.Lock_Lv.Items.Item[i-1].SubItems[4]:=String_noapplying;
             end ;


end; ///case

    end;  ///with

    end;//try end;
    except
    Continue;
    end;

 end; ///for

end;

Procedure TTimerThread.Execute;
begin
while (Lock_Enable)do
begin
Synchronize(ProcessLock);
sleep(GPOptions.Lock_Interval);
end;
end;

procedure TMainForm.Wmhotkeyhandle(var msg:Tmessage);
begin
 if (msg.LParamHi=GPOptions.MainHotKey_value) and (msg.lparamLo=GPOptions.MainHotKey_mode) then
 begin
  msg.Result:=1; //该消息已经处理
  SetActiveWindow(MainForm.Handle);
  DefWindowProc(MainForm.Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
  SetForegroundWindow(MainForm.Handle);
  application.BringToFront;
 end;


end;

Procedure TmainForm.RaiseInputError;
begin
with theTask[CurrenttaskIndex] do
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


procedure TMainForm.FormCreate(Sender: TObject);
var TheOptionStream:TMemoryStream;
    OptionsFileName:String;
      Reg:TRegistry;
  //  ReadRegName:string;
  //  ReadRegCode:string;
  //  TrueRegCode:string;
  //  RegDate:Integer;
begin

Reg:=Tregistry.Create;
Reg.Rootkey:= HKEY_LOCAL_MACHINE;
////////////////////////
{
if Reg.OpenKey('SOFTWARE\XGQsoft\GamePaladin\',true) then
begin
 if not reg.ValueExists('Registration Date') then
 begin
 RegDate:=Trunc(now) xor 790726;
 Reg.WriteString('Registration Date',inttoStr(RegDate));
 end;
Reg.CloseKey;
end; 

Reg.Rootkey:= HKEY_LOCAL_MACHINE;
if Reg.OpenKey('SOFTWARE\XGQsoft\GamePaladin\',true) then
begin
ReadRegName:=Reg.ReadString('Registration Name');
ReadRegCode:=Reg.ReadString('Registration Code');
Reg.CloseKey;
end;
if (not Nametocode(ReadRegName,TrueRegCode) ) or
   (ReadRegCode<>TrueRegCode) then
begin
RegisterForm:=TregisterForm.Create(self);
RegisterForm.ShowModal;
FreeandNil(RegisterForm);
end;
}
////////////////////////

String_GPSAVE:='XuGanQuan Software of Game Paladin II';
apppath:=ExtractFilePath(Application.ExeName);
if not DirectoryExists(apppath+'temp') then CreateDirectory(pchar(apppath+'temp'),nil);
MyFavoritesForm:=TMyFavoritesForm.Create(Application,Myfavorites_TS);
MyFavoritesForm.show;
ArchiveEditForm:=TArchiveEditForm.Create(Application,ArchiveEdit_TS);
ArchiveEditForm.Show;
CapturePicForm:=TCapturePicForm.Create(Application,CapPic_TS);
CapturePicForm.Show;
GameRecordForm:=TGameRecordForm.Create(Application,GameRecord_TS);
GameRecordForm.Show;
TTimerThread.Create;

hotkeyid_Main:=GlobalAddAtom(pchar('XGQ_GamePaladin_HotKey01'))-$C000;
hotkeyid_Capture:=GlobalAddAtom(pchar('XGQ_GamePaladin_HotKey02'))-$C000;

TheOptionStream:=TMemoryStream.Create;
TheOptionStream.SetSize(0);
OptionsFileName:=Apppath+'GPOptions.dat';
if FileExists(OptionsFileName) then TheOptionStream.LoadFromFile(Apppath+'GPOptions.dat');

///读取或者还原默认值
try

if TheOptionStream.size<>sizeof(GPOptions) then
 begin
  with GpOptions do
  begin
  WhichPage:=1;
  AlphaBlend:=0;
  AlphaBlendValue:=120;
  MainHotKey_mode:=MOD_SHIFT or MOD_CONTROL;
  MainHotKey_value:=$77; ////F8
  ScanAddressMode:=1;
  DefaultFromAddress:=$0001000;
  DefaultToAddress:=$86500000;
  CaptureSaveMode:=1;
  CaptureSavePath:=apppath+'capture\';
  CaptureHotKey_mode:=MOD_SHIFT or MOD_CONTROL;
  CaptureHotKey_value:=$78; ///F9
  setActivePage:=1;
  Lock_Interval:=500;
  FormWidth:=650;
  FormHeigth:=460;
 end;
 SaveOptions;
 end else  TheOptionStream.ReadBuffer(GPOptions,sizeof(GPOptions));

finally
 freeandNil(TheOptionStream);
end;

////////校正/////////////////////////
 with GpOptions do
 begin
  if WhichPage>7 then WhichPage:=1;
  if AlphaBlend>1 then AlphaBlend:=0; 
  if AlphaBlendValue<=80 then AlphaBlendValue:=200;
  //MainHotKey_mode:=MOD_SHIFT or MOD_CONTROL;
 // MainHotKey_value:=$77; ////F8
  if ScanAddressMode>4 then ScanAddressMode:=1;
  if  DefaultFromAddress>=DefaultToAddress then
  begin
  DefaultFromAddress:=$0001000;
  DefaultToAddress:=$86500000;
  end;
  if CaptureSaveMode>3 then CaptureSaveMode:=1;
  //CaptureSavePath:=apppath+'capture\';
  //CaptureHotKey_mode:=MOD_SHIFT or MOD_CONTROL;
 // CaptureHotKey_value:=$78; ///F9
  if setActivePage>3 then setActivePage:=1;
  if Lock_Interval>5000 then Lock_Interval:=500;
 end;
/////////////显示////////////////////////////////////////////
with GpOptions do
begin

 MainForm.Width:=FormWidth;
 MainForm.Height:=FormHeigth;
 
if AlphaBlend=0 then
  begin
    MainForm.AlphaBlend:=false;
    EnabledAlphaBlend_cb.State:=cbUnChecked;
  end
  else
  begin
  EnabledAlphaBlend_cb.State:=cbChecked;
  MainForm.AlphaBlend:=true;
  end;
Alphablend_TrackBar.Position:=AlphaBlendValue;
case  WhichPage  of
1:begin MyFavorite_TB.Down:=true;MyFavorite_TB.Click; end;
2:begin MemEdit_TB.Down:=true;    MemEdit_TB.Click; end;
3:begin archiveEdit_TB.Down:=true; archiveEdit_TB.Click; end;
4:begin CapPic_tb.Down:=true;      CapPic_tb.Click; end;
5:begin GameRecord_Tb.Down:=true;  GameRecord_Tb.Click; end;
6:begin SetOptions_tb.Down:=true;  SetOptions_tb.Click; end;
7:begin Help_Tb.Down:=true;         Help_Tb.Click; end;
end;

case  ScanAddressMode of
1:Set_1_Rb1.Checked:=true;
2:Set_1_Rb2.Checked:=true;
3:Set_1_Rb3.Checked:=true;
4:Set_1_Rb4.Checked:=true;
end;

Options_PageControl.ActivePageIndex:=setActivePage-1;

set_FromEdit.Text:=inttoHex(DefaultFromAddress,8);
set_ToEdit.Text:=inttoHex(DefaultToAddress,8);
Lock_TrackBar.Position:=Lock_Interval div 100;
Main_HotKey.HotKey:=HotKeyToShortCut(MainHotKey_mode,MainHotKey_value);
UnRegisterhotkey(MainForm.handle,hotkeyid_Main);
if not RegisterHotkey(MainForm.handle,hotkeyid_Main,MainHotKey_mode,MainHotKey_value)then
    begin
    SetOptions_tb.Down:=true;
    SetOptions_tb.Click;
    Options_PageControl.ActivePageIndex:=0;
    showmessage(String_NotSethotkey1);
    end;

if CaptureSaveMode=1 then SaveMode1.Checked:=true else
if CaptureSaveMode=2 then SaveMode2.Checked:=true else
if CaptureSaveMode=3 then SaveMode3.Checked:=true;
CaptureSavepath_Edit.Text:=CaptureSavePath;
UnRegisterhotkey(CapturePicForm.handle,hotkeyid_Capture);
if not RegisterHotkey(CapturePicForm.handle,hotkeyid_Capture,CaptureHotKey_mode,CaptureHotKey_value)then
    begin
    SetOptions_tb.Down:=true;
    SetOptions_tb.Click;
    Options_PageControl.ActivePageIndex:=1;
    showmessage(String_NotSethotkey2);
    end;

    
Reg.Rootkey:= HKEY_LOCAL_MACHINE;
Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true);
if reg.ReadString('GamePaladin')=application.exename then  Set_autoRun.state:=cbchecked else
Set_autoRun.state:=cbUNchecked; 
reg.CloseKey;
Reg.Free;



end;  ////with end;
Lock_Enable:=true;
TTimerThread.Create;
end;


///////////////任务相关////////////////////////////////////////////////////////////////////////
Procedure TmainForm.AddTasktoList(theIndex:integer);
begin
  with Tasks_LV.Items.Add do
   begin
   Caption:=theTask[theIndex].Name;
  // SubItems.Add(intToStr(theTask[theIndex].Index));
  // SubItems.Add(intToStr(theTask[theIndex].ProcessID))
   end;
end;


Procedure TmainForm.UpdateTaskInfo(theIndex:integer);
begin
if taskNum=0 then
begin
  Task_info_Name_LB.Caption:=String_notask;
  Task_Info_SearchResult_LB.Caption:=String_noresult;
  Found_lv.Clear;
end else
begin
  With theTask[theIndex] do
   begin
   Task_info_Name_LB.Caption:=Name;
   Task_Info_SearchResult_LB.Caption:=Format(String_ScanResult,[SearchTimes,AttachedNum]);
   end;

end;
end;


////////将搜索到的数值加入列表////////////////////
Procedure TmainForm.AddFoundToListView(theIndex:integer);
var BufSize:Int64;
    AddressBuf:Dword;
    i,j:Integer;
    TempByte:Byte;
    TempWord:Word;
    TempDword:Dword;
    Tempint64:int64;
    TempSingle:Single;
    TempDouble:Double;
    TempStringBYTE:Array[1..16] of BYTE;
    Tempstring:string;
begin
Found_LV.Items.BeginUpdate;///防止闪烁
Found_LV.Items.Clear;
with thetask[theIndex] do
begin
AddressmemStream.Seek(0,soFrombeginning); ////低阶搜索BufSize=0;
BufSize:= AddressMemStream.Size;
if (BufSize>0) and ( not thetask[theIndex].InSearchProcess) then
begin
BufSize:=BufSize shr 2;
if BufSize>200 then BufSize:=200;  ///只显示前面200个值
  For i:=1 to BufSize do        
  begin
    try

   AddressMemStream.ReadBuffer(AddressBuf,Sizeof(AddressBuf));
   GPKernel.Readmemory(ProcessID,AddressBuf,@TempByte,Byte_value);
   GPKernel.Readmemory(ProcessID,AddressBuf,@TempWord,Word_value);
   GPKernel.Readmemory(ProcessID,AddressBuf,@TempDword,Dword_value);
   GPKernel.Readmemory(ProcessID,AddressBuf,@TempInt64,Int64_value);
   GPKernel.Readmemory(ProcessID,AddressBuf,@TempSingle,Single_value);
   GPKernel.Readmemory(ProcessID,AddressBuf,@TempDouble,Double_value);
   GPKernel.Readmemory(ProcessID,AddressBuf,@TempStringBYTE,String_value);
   Tempstring:='';
   for  j:=1 to 16 do
     Tempstring:=Tempstring+chr(TempstringBYTE[j]);

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
    Continue;   //float ofent make error
   end;

  end;//for end

end; //if end

end;///with end
Found_lv.Items.EndUpdate;
end;

Procedure TMainForm.UpdateLockInfo(theIndex,theListIndex:integer);
var TypeStr:String;
begin
if memLockRecord[theIndex].Applyed then
 begin

     case memLockRecord[theIndex].VarType of
     Byte_value:TypeStr:=String_ByteType;
     Word_value:TypeStr:=String_WordType;
     Dword_value:TypeStr:=String_DWordType;
     Int64_value:TypeStr:=String_Int64Type;
     Single_value:TypeStr:=String_SingleType;
     Double_value:TypeStr:=String_DoubleType;
     String_value:TypeStr:=String_StringType;
     else
      TypeStr:=String_WordType;
     end;

      With Lock_LV.Items.item[theListIndex] do
      begin
       Caption:=memLockRecord[theIndex].Description;
       Subitems[0]:=(intToHex(memLockRecord[theIndex].Address,8));
       Subitems[1]:=(memLockRecord[theIndex].valueStr);
       Subitems[2]:=(TypeStr);
       Subitems[3]:=(intToStr(memLockRecord[theIndex].ProcessID));
       Subitems[4]:=(String_applying);
       if memLockRecord[theIndex].Frozen then Checked:=True else  Checked:=False;
      end;

 end;
end;

procedure TMainForm.Deltask_tbClick(Sender: TObject);
var i,SelListIndex,theIndex:integer;
begin
if tasknum=0 then Exit;
if Tasks_LV.Selected<>nil then
begin
SelListIndex:=Tasks_LV.Selected.Index+1;
theIndex:=ListToTaskIndex[SelListIndex];
if theTask[theindex].InSearchProcess  then
 begin
 MessageBox(Application.Handle,pchar(String_InScan),pchar(String_InScanTitle),
           MB_OK or MB_ICONINFORMATION);

  exit;
 end;
theTask[theindex].Applyed:=False;
theTask[theIndex].AddressMemStream.Clear;
theTask[theIndex].AdvancedAddressMemStream.Clear;
Dec(taskNUm);
  for i:=SelListIndex to TaskNum do
   begin
    ListToTaskIndex[i]:=ListToTaskIndex[i+1];
   end;
Tasks_lv.selected.Delete;
DeleteFile(theTask[theIndex].MemoryFileName);
DeleteFile(theTask[theIndex].MemoryFileNameNew);
UpdateTaskInfo(theTask[theIndex].Index);
end;
end;

procedure TMainForm.newtask_TBClick(Sender: TObject);
begin
 ProcessListForm.Refresh_BN.Click;
 ProcessListForm.Show;
end;
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////任务辅助/////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
function Tmainform.CheckForScan:boolean;
begin
Result:=false;
with thetask[CurrentTaskIndex] do begin

case AnalyseScan(CurrentTaskIndex) of
0: begin
   Raise Exception.Create(String_Taskinvalid);
   end;
1: begin
      if MessageBox(Application.Handle,pchar(String_AskRepeatInitLowLevel),
              pchar(String_AskRepeatInitLowLevelTitle),
              MB_YESNO or MB_ICONINFORMATION)=IDYES then
       begin
         TotalProcess:=0;
         SearchTimes:=0;
         AttachedNum:=0;
         AdvancedAddressMemStream.Clear;
         AddressMemStream.Clear;
         Result:=True;
         Exit;
      end else exit;

    end;
2: begin
     if MessageBox(Application.Handle,pchar(String_TypeNoMatch),
              pchar(String_TypeNoMatchTitle),
              MB_YESNO or MB_ICONINFORMATION)=IDYES then
     begin
        TotalProcess:=0;
         SearchTimes:=0;
         AttachedNum:=0;
         AdvancedAddressMemStream.Clear;
         AddressMemStream.Clear;
         Result:=True;
         exit;
     end else Exit;
    end;
3:  begin
      if MessageBox(Application.Handle,pchar(String_NoResultAgain),
              pchar(String_NoResultAgainTitle),
              MB_YESNO or MB_ICONINFORMATION)=IDYES then
      begin
         TotalProcess:=0;
         SearchTimes:=0;
         AttachedNum:=0;
         AdvancedAddressMemStream.Clear;
         AddressMemStream.Clear;
         Result:=True;
         Exit;
      end else Exit;

    end;
4:  Result:=True;
   end;  ///case end

 end;///with edn

end;





///////////////////////////////////////////////////////////////////////

procedure TMainForm.Scan_bnClick(Sender: TObject);
begin
if TaskNum=0 then
begin
if MessageBox(Application.Handle,pchar(String_Addtask),pchar(String_Addtasktitle),
           MB_YESNO or MB_ICONINFORMATION)=IDYES then

 NewTask_TB.Click;
 Exit;
end;

with theTask[CurrenttaskIndex] do
begin
  if InSearchProcess then
   begin
  MessageBox(Application.Handle,pchar(String_InScan),pchar(String_InScanTitle),
           MB_OK or MB_ICONINFORMATION);
  exit;
   end;///防止搜索过程中不断点击

  ScanType:=GetScanTypeAndTempVar(Value_Edit.text,CurrentTaskIndex);
  if  ScanType=-999 then begin RaiseInputError;exit;end;
  /////Vartype必须考虑Combobox的选择
  theTask[CurrentTaskIndex].VarType:=VarType_cb.ItemIndex;
  varType:=GetVarTypeAndVarValue(ScanValue,CurrentTaskIndex);
  if  varType=-999 then begin RaiseInputError;exit;end;

  if not CheckForScan then exit;



if SearchTimes=0 then
begin
TFirstScanThread.Create(CurrentTaskIndex);
end  else
begin
TNextScanThread.Create(CurrentTaskIndex);
end;

end;///with end;

end;

procedure TMainForm.InputHelp_SBClick(Sender: TObject);
begin
if not assigned(InputhelpForm)then  InputhelpForm:=TInputhelpForm.Create(self);
InputhelpForm.Showmodal;
InputhelpForm.Free;
InputhelpForm:=nil;
end;

procedure TMainForm.VarType_CBChange(Sender: TObject);
begin
if (TaskNUm=0) or (theTask[CurrentTaskIndex].InSearchProcess) then exit;
theTask[CurrentTaskIndex].VarType:=VarType_cb.ItemIndex;

end;

procedure TMainForm.tasks_LVClick(Sender: TObject);
var selListIndex:Integer;
begin
if tasks_LV.Selected=nil then  exit;

selListIndex:=Tasks_LV.Selected.Index+1;
CurrentTaskIndex:=ListTotaskIndex[selListIndex];
CurrentProcessID:=theTask[CurrentTaskIndex].ProcessID;
Scan_Gauge.MaxValue:=theTask[CurrentTaskIndex].TotalProcess;
Value_Edit.Text:=theTask[CurrentTaskIndex].ScanValue;
if theTask[CurrentTaskIndex].ScanType=String_Scan then
 Value_Edit.Text:=''''+theTask[CurrentTaskIndex].ScanValue+'''';
UpdateTaskInfo(CurrentTaskIndex);
VarType_cb.ItemIndex:=0; /////theTask[CurrentTaskIndex].VarType;
AddFoundToListView(CurrentTaskIndex);
  Task_name:=theTask[CurrentTaskIndex].Name;
  MemRecordForm.FormRefresh;
end;

procedure TMainForm.Value_EditKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Scan_bn.Click;
end;

procedure TMainForm.SelMemEdit_TBClick(Sender: TObject);
var tempAddress:Dword;
    Ecode:integer;
begin
if tasknum=0 then exit;
if (Found_LV.Selected=nil) and (Lock_LV.Selected=nil) then
begin
MemReadStartAddress:=$400000;
MemEditForm.Address_Edit.Text:='00400000';
   MemEditUnit.Myrect.Left:=1; //得到最后一位
  MemEditUnit.Myrect.Top:=1;
  MemEditUnit.Myrect.Right:=MemEditUnit.Myrect.Left;
  MemEditUnit.Myrect.Bottom:=1;
  MemEditUnit.MemEditForm.MEM_sg.Selection:=MemEditUnit.Myrect;
end
 else
begin
MemEditForm.Caption:=String_MemEditTitle +'<'+thetask[CurrenttaskIndex].Name+'>';
if (Found_LV.Selected<>nil) then Val('$'+Found_lv.Selected.Caption,tempAddress,Ecode);
if (Lock_LV.Selected<>nil) then Val('$'+Lock_lv.Selected.SubItems[0],tempAddress,Ecode);
 MemReadStartAddress:=(TempAddress and $FFFFFFF0);//去掉最后一位s
MemEditForm.Address_Edit.Text:=intToHex(MemReadStartAddress,8);

   MemEditUnit.Myrect.Left:=(TempAddress and $F)+1; //得到最后一位
  MemEditUnit.Myrect.Top:=1;
  MemEditUnit.Myrect.Right:=MemEditUnit.Myrect.Left;
  MemEditUnit.Myrect.Bottom:=1;
  MemEditUnit.MemEditForm.MEM_sg.Selection:=MemEditUnit.Myrect;
end;

MemEditForm.show;

end;

procedure TMainForm.tasks_LVEdited(Sender: TObject; Item: TListItem;
  var S: String);
begin
theTask[CurrenttaskIndex].Name:=S;
UpdateTaskInfo(CurrenttaskIndex);
end;

procedure TMainForm.ClearAlltasks_menuClick(Sender: TObject);
var i,SelListIndex,theIndex:integer;
begin


if tasknum=0 then Exit;
for i:=1 to Tasks_LV.Items.Count do  
begin
SelListIndex:=i;
theIndex:=ListToTaskIndex[SelListIndex];
if theTask[theindex].InSearchProcess  then
 begin
 MessageBox(Application.Handle,pchar(String_InScan),pchar(String_InScanTitle),
           MB_OK or MB_ICONINFORMATION);

  exit;
 end;
end;

for i:=1 to Tasks_LV.Items.Count do
begin
SelListIndex:=i;
theIndex:=ListToTaskIndex[SelListIndex];
theTask[theIndex].Applyed:=False;
theTask[theIndex].AddressMemStream.Clear;
theTask[theIndex].AdvancedAddressMemStream.Clear;
DeleteFile(theTask[theIndex].MemoryFileName);
DeleteFile(theTask[theIndex].MemoryFileNameNew);
end;

TaskNum:=0;
Tasks_LV.Items.Clear;
UpdateTaskInfo(theTask[theIndex].Index);

end;

procedure TMainForm.EditAddress_tbClick(Sender: TObject);
begin
memRecordForm.Show;
end;

procedure TMainForm.FoundMem_MemuClick(Sender: TObject);
var tempAddress:Dword;
    Ecode:integer;
begin
if (tasknum<>0)and(Found_lv.Selected<>nil) then
 begin
 Val('$'+Found_lv.Selected.Caption,tempAddress,Ecode);
 MemReadStartAddress:=(TempAddress and $FFFFFFF0);//去掉最后一位s
 MemEditForm.Caption:=String_MemEditTitle+thetask[CurrenttaskIndex].Name;
 memeditForm.Address_Edit.Text:=intToHex(MemReadStartAddress,8);
   MemEditUnit.Myrect.Left:=(TempAddress and $F)+1; //得到最后一位
  MemEditUnit.Myrect.Top:=1;
  MemEditUnit.Myrect.Right:=MemEditUnit.Myrect.Left;
  MemEditUnit.Myrect.Bottom:=1;
  MemEditUnit.MemEditForm.MEM_sg.Selection:=MemEditUnit.Myrect;
  MemEditForm.Show;
 end;

end;

procedure TMainForm.Found_LVDblClick(Sender: TObject);
begin
if Found_LV.Selected<>nil then  MemRecordForm.Show;
end;

procedure TMainForm.EditLock_MemuClick(Sender: TObject);
begin
if Found_LV.Selected<>nil then
 MemRecordForm.Show;
end;

procedure TMainForm.New1_menuClick(Sender: TObject);
var Temphandle:Thandle;
    i:integer;
begin
 if (taskNum=0)then
 begin
 ProcessListForm.Refresh_BN.Click;
 ProcessListForm.Show;
 end else
 if tasks_LV.Selected<>nil then
 begin
 Temphandle:=OpenProcess(PROCESS_ALL_ACCESS,False,CurrentProcessID);
 if  Temphandle>0 then
   begin
    ///判断是否超出任务数极限
    if TaskNum>=MaxTaskNum then
    begin
    showmessage(Format(String_Maxtask,[Maxtasknum]));
    Exit;
    end;
    INC(TaskNum);
    ///找到对应顺序
    for i:=1 to MaxTaskNum do   if thetask[i].Applyed=False then  Break;
    ///新任务付值,最主要的 为ID;
    GPKernel.Initthetask(i);
    TheTask[i].Applyed:=True;
    ListToTaskindex[TaskNum]:=i;
    
    With Thetask[i] do
    begin
    TheTask[i].Index:=i;
    TheTask[i].Name:=TheTask[CurrentTaskIndex].Name;
    TheTask[i].ProcessID:=TheTask[CurrentTaskIndex].ProcessID;     ///极为重要!!!!!!
    TheTask[i].ProcessHandle:=TheTask[CurrentTaskIndex].ProcessHandle;            //可有可无
    TheTask[i].MemoryFileName:=AppPAth+'temp\Memory'+intToStr(i)+'.TMP1';
    TheTask[i].MemoryFileNameNew:=AppPAth+'temp\Memory'+intToStr(i)+'.TMP2';
    end;

    CurrentTaskIndex:=TheTask[i].Index;
    CurrentProcessID:=TheTask[i].ProcessID;
    
    AddTasktoList(i);
    UpdateTaskInfo(i);
   end else
   begin
   Showmessage(String_Taskinvalid);
   ProcessListForm.Refresh_BN.Click;
   ProcessListForm.Show;
   end;
 CloseHandle(Temphandle);
 end else showmessage(String_NeedSeletedtask);
end;
{
procedure ttreLock_LVDblClick(Sender: TObject);
var tempAddress:Dword;
    Ecode:integer;
begin
if Found_lv.Selected<>nil then
 begin
 Val('$'+Found_lv.Selected.Caption,tempAddress,Ecode);
 MemReadStartAddress:=(TempAddress and $FFFFFFF0);//去掉最后一位s
 MemEditForm.Caption:='内存查看与修改 '+thetask[CurrenttaskIndex].Name;
 memeditForm.Address_Edit.Text:=intToHex(MemReadStartAddress,8);
 end;
MemEditForm.Show;
end;
 }
procedure TMainForm.Lock_LVDblClick(Sender: TObject);
begin
if (Lock_LV.Selected<>nil)and (lockNum>0) then MemRecordForm.Show;
end;


procedure TMainForm.Found_LVMouseDown(Sender: TObject;
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
if taskNum=0 then exit;
if Found_LV.Selected<>nil then
begin
Val('$'+Found_lv.Selected.Caption,tempAddress,Ecode);
Lock_Name:='Money';
Lock_Address:=tempAddress;
if (theTask[CurrenttaskIndex].ScanType<>Number_Scan) and
   (theTask[CurrenttaskIndex].ScanType<>String_Scan) then
Lock_ValueType:=Word_Value else
Lock_ValueType:=theTask[CurrenttaskIndex].VarType;
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
String_value:  begin
             ReadMemory(CurrentProcessID,tempAddress-1,@TempString,String_value);
             Lock_value:=tempString;
             end ;
end;
 Lock_Type:=0;
 Lock_Info:=1;
end;
Task_name:=theTask[CurrentTaskIndex].Name;
MemRecordForm.FormRefresh;
end;

procedure TMainForm.LockRemove_menuClick(Sender: TObject);
var i,SelListIndex,theIndex:integer;
begin
if (Lock_LV.Selected=nil)or (lockNum=0) then Exit;
Lock_Enable:=False;
SelListIndex:=Lock_LV.Selected.Index+1;
theIndex:=ListToLockIndex[SelListIndex];
MemlockRecord[theindex].Applyed:=False;
Dec(LockNUm);
  for i:=SelListIndex to LockNum do
   begin
    ListToLockIndex[i]:=ListToLockIndex[i+1];
   end;
Lock_lv.selected.Delete;

   for i:=1 to LockNum do
   begin
   theIndex:=ListToLockIndex[i];
   UpdateLockInfo(theIndex,i-1);
   end;
Lock_Enable:=true;
end;

procedure TMainForm.FoundAdd_memuClick(Sender: TObject);
var i:integer;
begin
if Found_LV.Selected<>nil then
 begin
   if LockNum>=MaxLockNum then
   begin
   Showmessage(Format(String_maxLockNum,[MaxLockNum]));
   Exit;
   end;
   
  for i:=1 to MaxLockNum do
   if memLockRecord[i].Applyed=False then  Break;

   
  Inc(LockNum);
  MemLockRecord[i].Applyed:=True;
  ListToLockIndex[LockNum]:=i;


  with memLockRecord[i] do
  begin
        Description:='Addr '+intToStr(i);
        Address:=StrToint('$'+Found_lv.Selected.Caption);
        valueStr:=Lock_value;
        VarType:=Lock_ValueType;            ///这些都在 Found_LVMouseDown
        ProcessID:=CurrentProcessID;
        Frozen :=True;
        Applyed:=true;      //运用/闲置标志
  end;

 with Lock_LV.Items.add do
 begin
  Caption:='';
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
 end;

 UpdateLockInfo(i,LockNum-1);
 
 end;
end;

procedure TMainForm.Lock_ClearClick(Sender: TObject);
var i:integer;
begin
Lock_Enable:=False;
Lock_lV.Items.Clear;
LockNum:=0;
 for i:=1 to maxLockNum do
 begin
  MemLockRecord[i].Applyed:=False;
 end;
Lock_Enable:=true;
end;

procedure TMainForm.LockAddress_menuClick(Sender: TObject);
var tempAddress:Dword;
    Ecode:integer;
begin

if (tasknum<>0) and( Lock_lv.Selected<>nil) then
 begin
 Val('$'+Lock_lv.Selected.SubItems[0],tempAddress,Ecode);
 MemReadStartAddress:=(TempAddress and $FFFFFFF0);//去掉最后一位s
 memeditForm.Address_Edit.Text:=intToHex(MemReadStartAddress,8);
   MemEditUnit.Myrect.Left:=(TempAddress and $F)+1; //得到最后一位
  MemEditUnit.Myrect.Top:=1;
  MemEditUnit.Myrect.Right:=MemEditUnit.Myrect.Left;
  MemEditUnit.Myrect.Bottom:=1;
  MemEditUnit.MemEditForm.MEM_sg.Selection:=MemEditUnit.Myrect;
  MemEditForm.Show;
 end;

end;

procedure TMainForm.Lock_LVEdited(Sender: TObject; Item: TListItem;
  var S: String);
var theIndex:integer;
begin
theIndex:=ListToLockIndex[Item.Index+1];
MemLockRecord[theIndex].Description:=S;
end;

procedure TMainForm.Lock_LVMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var theIndex:integer;
begin
if (Lock_LV.Selected<>nil)and (lockNum>0) then
begin
theIndex:=ListToLockIndex[Lock_LV.Selected.Index+1];
Lock_Address:=MemLockRecord[theIndex].Address;
Lock_Name:=MemLockRecord[theIndex].Description;
Lock_ValueType:=MemLockRecord[theIndex].VarType;
Lock_value:=MemLockRecord[theIndex].valueStr;
if MemLockRecord[theIndex].Frozen then Lock_Type:=0 else Lock_Type:=1;
Lock_Info:=2;
Task_name:=Lock_Name;
MemRecordForm.FormRefresh;
end; 
end;

procedure TMainForm.SaveLockRecord_TBClick(Sender: TObject);
var SaveStream:TFileStream;
    theIndex,I:Integer;
    
begin
if LockNum=0 then Exit;
if SaveLockRecordDialog.Execute then
begin
 try
  SaveStream:=TFileStream.Create(SaveLockRecordDialog.FileName,fmCreate or fmShareDenyNOne);
  SaveStream.WriteBuffer(String_GPSAVE,sizeof(String_GPSAVE));
  for i:=1 to LockNum do
  begin
   theIndex:=ListToLockIndex[i];
   SaveStream.WriteBuffer(MemLockRecord[theIndex],sizeof(MemLockRecord[theIndex]));
  end;
  finally
   FreeAndNil(SaveStream);
  end;
end;

end;

procedure TMainForm.OpenLockRecord_TBClick(Sender: TObject);
var I,J:Integer;
    OpenStream:TFileStream;
    TempRecord:TLockRecord;
    TempSize:Integer;
    TempSaveSignHead:string[$30];
begin
if LockNum=MaxLockNum then
begin
Showmessage(Format(String_maxLockNum,[MaxLockNum]));
 Exit;
end;
 if openLockRecordDialog.Execute then
  begin
  try
  begin///try begin

  OpenStream:=TFileStream.Create(OpenLockRecordDialog.FileName,fmOpenRead or fmShareDenyNOne);
   TempSize:=(OpenStream.Size-sizeof(String_GPSAVE)) div sizeof(TempRecord);
  if (TempSize<=0)   then
  begin
   showmessage(String_invalidSave);
   Exit;
  end;
  /////////////注意载入/////////
       try
       OpenStream.ReadBuffer(TempSaveSignHead,sizeof(String_GPSAVE));
       except
       showmessage(String_invalidSave);
       exit;
       end;

  if TempSaveSignHead<>String_GPSAVE then
       begin
       showmessage(String_invalidSave);
       exit;
       end;

    for i:=1 to TempSize do
     begin
     
       if LockNum=MaxLockNum then
       begin
       Showmessage(Format(String_maxLockNum,[MaxLockNum]));
       Exit;
       end;
       try
       OpenStream.ReadBuffer(TempRecord,sizeof(TempRecord));
       except
       showmessage(String_invalidSave);
       exit;
       end;
        for j:=1 to MaxLockNum do if memLockRecord[j].Applyed=False then  Break;

        try
        with memLockRecord[j] do
        begin
       
        Description:=TempRecord.Description;
        Address:=TempRecord.Address;
        valueStr:=TempRecord.valueStr;
        VarType:=TempRecord.VarType;            ///这些都在 Found_LVMouseDown
        ProcessID:=CurrentProcessID;
        Frozen:=True;
        //Applyed:=true;      //运用/闲置标志
        end;
        Except
         showmessage(String_invalidSave);
         exit;
        end;
         Lock_Enable:=False;
         Inc(LockNum);
         MemLockRecord[j].Applyed:=True;
         ListToLockIndex[LockNum]:=j;

        with Lock_LV.Items.add do
         begin
         Caption:='';
         Subitems.Add('');
         Subitems.Add('');
         Subitems.Add('');
         Subitems.Add('');
         Subitems.Add('');
         end;

        UpdateLockInfo(j,LockNum-1);
        Lock_Enable:=True;
     end;///循环读取结束
     
   end;////try end
  finally
   FreeAndNil(OpenStream);
  end;

  end; //opendioalog
end;

procedure TMainForm.Lockcopy_memuClick(Sender: TObject);
var theIndex:integer;
begin
if Lock_lv.Selected<>nil then
  begin
    theIndex:=ListToLockIndex[Lock_lv.Selected.Index+1];
    CopyLockRecord:=MemLockRecord[theIndex];
    CanPasteLockRecord:=true;
  end;



end;

procedure TMainForm.Lockpaste_menuClick(Sender: TObject);
var I:integer;
begin
if not CanPasteLockRecord then exit;
if LockNum>=MaxLockNum then
   begin
   Showmessage(Format(String_maxLockNum,[MaxLockNum]));
   Exit;
   end;
   Lock_Enable:=false;
  for i:=1 to MaxLockNum do
   if memLockRecord[i].Applyed=False then  Break;

   
  Inc(LockNum);
  MemLockRecord[i].Applyed:=True;
  ListToLockIndex[LockNum]:=i;
  memLockRecord[i]:=CopyLockRecord;

 with Lock_LV.Items.add do
 begin
  Caption:='';
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
  Subitems.Add('');
 end;

 UpdateLockInfo(i,LockNum-1);
 Lock_Enable:=true;
end;

procedure TMainForm.Set_1_RB1Click(Sender: TObject);
begin
set_FromEdit.Enabled:=False;
set_ToEdit.Enabled:=False;
set_FromEdit.Text:='00010000';
set_ToEdit.Text:='86500000';
end;

procedure TMainForm.Set_1_RB2Click(Sender: TObject);
begin
set_FromEdit.Enabled:=False;
set_ToEdit.Enabled:=False;
set_FromEdit.Text:='00040000';
set_ToEdit.Text:='6DA00000';
end;

procedure TMainForm.Set_1_RB3Click(Sender: TObject);
begin
set_FromEdit.Enabled:=False;
set_ToEdit.Enabled:=False;
set_FromEdit.Text:='80100000';
set_ToEdit.Text:='86500000';
end;

procedure TMainForm.Set_1_RB4Click(Sender: TObject);
begin
set_FromEdit.Enabled:=True;
set_ToEdit.Enabled:=True;
end;

procedure TMainForm.Lock_TrackBarChange(Sender: TObject);
begin

Lock_Frequency_LB.Caption:=intToStr(Lock_TrackBar.Position*100)+' ms';
end;

procedure TMainForm.MyFavorite_TBClick(Sender: TObject);
begin
MainPageControl.ActivePage:=MyFavorites_TS;
GPOptions.WhichPage:=1;
end;

procedure TMainForm.MemEdit_TBClick(Sender: TObject);
begin
MainPageControl.ActivePage:=MemoryScan_TS;
GPOptions.WhichPage:=2;
end;

procedure TMainForm.archiveEdit_TBClick(Sender: TObject);
begin
MainPageControl.ActivePage:=ArchiveEdit_TS;
GPOptions.WhichPage:=3;
end;

procedure TMainForm.CapPic_TBClick(Sender: TObject);
begin
MainPageControl.ActivePage:=CapPic_TS;
GPOptions.WhichPage:=4;
end;


procedure TMainForm.SetOptions_TBClick(Sender: TObject);
begin
 MainPageControl.ActivePage:=Set_ts;
 GPOptions.WhichPage:=6;
end;

procedure TMainForm.Help_TBClick(Sender: TObject);
var theAdd:OleVariant;
begin
MainPageControl.ActivePage:=Help_TS;
GPOptions.WhichPage:=7;
if HelpWebBrowserForm=nil then
begin
HelpWebBrowserForm:=THelpWebBrowserForm.Create(Application,Help_TS);
HelpWebBrowserForm.Show;
theAdd:='mk:@MSITStore:'+Apppath+'GPHelp.chm::/index.html';
///ms-its:C:\i386\CALC.CHM::/calc_scientific.htm
HelpWebBrowserForm.WebBrowser1.Navigate2(theAdd);
end;
end;

procedure TMainForm.backtogame_bnClick(Sender: TObject);
var winhandle:HWND;
    winprocess: Dword;
begin
winhandle:=GetWindow(GetForeGroundWindow,GW_HWNDFIRST);
  while winhandle<>0 do
  begin
     if isWindowvisible(winhandle) then
     begin
       GetWindowThreadProcessId(winhandle,@winprocess);
       if winprocess=CurrentProcessID then
          begin
          SetActiveWindow(winhandle);
          DefWindowProc(winhandle, WM_SYSCOMMAND, SC_RESTORE, 0);
          SetForegroundWindow(winhandle);
          Exit;
          end;

     end;
   winhandle:=GetWindow(winhandle,GW_HWNDNEXT);
  end;

end;

procedure TMainForm.tray_minClick(Sender: TObject);
begin
MainForm.Hide;
end;

procedure TMainForm.DisplayProcessTimer(Sender: TObject);
begin
if taskNum=0 then exit;
with thetask[CurrentTaskIndex] do
begin
if (Scan_Gauge.MaxValue<>Int(totalProcess)) then   Scan_Gauge.MaxValue:=TotalProcess;
Scan_Gauge.Progress:=NowProcess;
///只有在扫描过程中更新
UpdateTaskInfo(CurrentTaskIndex);
   /////////////
if CanUpdateTask=IDOK then
 begin
  AddFoundToListView(CurrentTaskIndex);
   CanUpdateTask:=-999;
  end;
end;

end;

procedure TMainForm.GameRecord_TBClick(Sender: TObject);
begin
MainPageControl.ActivePage:=GameRecord_TS;
GPOptions.WhichPage:=5;
end;

procedure TMainForm.Options_TreeViewClick(Sender: TObject);
begin
Options_PageControl.ActivePageIndex:=Options_treeView.Selected.Index;
GPOptions.setActivePage:=Options_PageControl.ActivePageIndex+1;
end;


function TMainForm.ShortCutToHotKey_Mode(Value: TShortCut):UINT;
begin
  Result:=0;
  if Value and scCtrl <> 0 then Result:=Result or MOD_CONTROL;
  if Value and scAlt <> 0 then Result:=Result or MOD_ALT;
  if Value and scShift <> 0 then Result:=Result or MOD_SHIFT;
end;

function TMainForm.HotKeyToShortCut(mode,value:UINT):TShortCut;
begin
  Result:=0;
  if mode and MOD_CONTROL <>0 then  Result:=Result or scCtrl;
  if mode and MOD_ALT <>0 then  Result:=Result or scAlt;
  if mode and MOD_SHIFT <>0 then  Result:=Result or scShift;
  Result:=Result or value;
end;

function  TMainForm.ShortCutToHotKey_value(Value: TShortCut):UINT;
begin
 result:=Value and $00FF;

end;

procedure TMainForm.Set_1_OKClick(Sender: TObject);
var TempDword1,TempDword2:Dword;
    Ecode:integer;
    TempMainHotKey_mode:UINT;
    TempMainHotKey_value:UINT;
begin
///搜索地址//////
val('$'+set_FromEdit.Text,TempDword1,Ecode);
if Ecode>0 then
 begin
  beep;
  set_FromEdit.SelectAll;
  exit;
 end;
val('$'+set_ToEdit.Text,TempDword2,Ecode);
if Ecode>0 then
 begin
  beep;
  set_ToEdit.SelectAll;
  exit;
 end;
if TempDword1>TempDword2 then
 begin
  beep;
  set_ToEdit.SelectAll;
  exit;
 end;

   TempMainHotKey_mode:=ShortCutToHotKey_Mode(Main_HotKey.HotKey);
   TempMainHotKey_value:=ShortCutToHotKey_Value(Main_HotKey.HotKey);
   
  UnRegisterhotkey(MainForm.handle,hotkeyid_Main);
  if not RegisterHotkey(MainForm.handle,hotkeyid_Main,TempMainHotKey_mode,TempMainHotKey_value)then
    raise Exception.Create(String_NotSethotkey1);

 if Set_1_Rb1.Checked then GPOptions.ScanAddressMode:=1 else
 if Set_1_Rb2.Checked then GPOptions.ScanAddressMode:=2 else
 if Set_1_Rb3.Checked then GPOptions.ScanAddressMode:=3 else
 if Set_1_Rb4.Checked then GPOptions.ScanAddressMode:=4 ;

 GPOptions.DefaultFromAddress:=TempDword1;
 GPOptions.DefaultToAddress:= TempDword2;
 GPKernel.DefaultFromAddress:=GPOptions.DefaultFromAddress;
 GPKernel.DefaultToAddress:=GPOptions.DefaultToAddress;
 GPOptions.Lock_Interval:=Lock_TrackBar.Position*100;
 GPOptions.MainHotKey_mode:=TempMainHotKey_mode;
 GPOptions.MainHotKey_value:=TempMainHotKey_value;
 Showmessage(string_setok);
end;

procedure TmainForm.SaveOptions;
var TheFile:TFileStream;
begin
TheFile:=TFileStream.Create(Apppath+'GPOptions.dat',fmCreate or fmOpenReadWrite or fmshareDenynone);
try
 TheFile.WriteBuffer(GPOptions,sizeof(GPOptions));
finally
FreeAndNil(TheFile);
end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
GPOptions.FormWidth:=Mainform.Width;
GPOptions.FOrmHeigth:=Mainform.Height;
SaveOptions;
DeleteAtom(HotKeyID_Main);
DeleteAtom(HotKeyID_Capture);
end;

procedure TMainForm.Set_2_okClick(Sender: TObject);
var TempCaptureHotKey_mode:UINT;
    TempCaptureHotKey_value:UINT;
begin
if SaveMode1.Checked then GPOptions.CaptureSaveMode:=1 else
if SaveMode2.Checked then GPOptions.CaptureSaveMode:=2 else
if SaveMode3.Checked then GPOptions.CaptureSaveMode:=3 ;
GPOptions.CaptureSavePath:=Copy(CaptureSavepath_Edit.Text,1,255);

TempCaptureHotKey_mode:=ShortCutToHotKey_Mode(Capture_HotKey.HotKey);
TempCaptureHotKey_value:=ShortCutToHotKey_Value(Capture_HotKey.HotKey);
UnRegisterhotkey(CapturePicForm.handle,hotkeyid_Capture);
if not RegisterHotkey(CapturePicForm.handle,hotkeyid_Capture,TempCaptureHotKey_mode,TempCaptureHotKey_value)then
    raise Exception.Create(String_NotSethotkey2);

 GPOptions.CaptureHotKey_mode:=TempCaptureHotKey_mode;
 GPOptions.CaptureHotKey_value:=TempCaptureHotKey_value;
 Showmessage(string_setok);
end;

procedure TMainForm.EnabledAlphaBlend_cbClick(Sender: TObject);
begin
if EnabledAlphaBlend_cb.State=cbChecked then
GpOptions.AlphaBlend:=1 else GpOptions.AlphaBlend:=0;
if  GpOptions.AlphaBlend=0 then    MainForm.AlphaBlend:=False else
    begin
     MainForm.AlphaBlend:=True;
     MainForm.AlphaBlendValue:= GpOptions.AlphaBlendValue;
    end;
end;

procedure TMainForm.Alphablend_TrackBarChange(Sender: TObject);
begin
GpOptions.AlphaBlendValue:=Alphablend_TrackBar.Position;
if  GpOptions.AlphaBlend=1 then MainForm.AlphaBlendValue:= GpOptions.AlphaBlendValue;
end;

procedure TMainForm.set_autoRunClick(Sender: TObject);
var
 Reg:Tregistry;
begin
Reg:=Tregistry.Create;
Reg.Rootkey:= HKEY_LOCAL_MACHINE;
Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',False); 
if (reg.ReadString('GamePaladin')=application.exename)and (set_autoRun.Checked=false)then
Reg.WriteString('GamePaladin','')
else  if (set_autoRun.Checked=true)  then
Reg.WriteString('GamePaladin',application.exename);
Reg.CloseKey;
Reg.Free;
end;

procedure TMainForm.MakeappshortcutClick(Sender: TObject);
var
tmpObject : IUnknown;
tmpSLink:IShellLink;
tmpPFile : IPersistFile;
PIDL : PItemIDList;
StartupDirectory : array[0..MAX_PATH] of Char;
StartupFilename : String;
LinkFilename : WideString;
begin
StartupFilename:=ParamStr(0);
tmpObject := CreateComObject(CLSID_ShellLink);//创建建立快捷方式的外壳扩展
tmpSLink := tmpObject as IShellLink;//取得接口
tmpPFile := tmpObject as IPersistFile;//用来储存*.lnk文件的接口
tmpSLink.SetPath(pChar(StartupFilename));//设定notepad.exe所在路径
tmpSLink.SetWorkingDirectory(pChar(ExtractFilePath(StartupFilename)));//设定工作目录
SHGetSpecialFolderLocation(0,CSIDL_DESKTOPDIRECTORY,PIDL);//获得桌面的Itemidlist
SHGetPathFromIDList(PIDL,StartupDirectory);//获得桌面路径
LinkFilename := StartupDirectory + '\GamePaladin.lnk';
tmpPFile.Save(pWChar(LinkFilename),FALSE);//保存*.lnk文件

end;

procedure TMainForm.About1Click(Sender: TObject);
begin
RegisterForm:=TregisterForm.Create(self);
RegisterForm.ShowModal;
FreeandNil(RegisterForm);
end;

procedure TMainForm.path_bnClick(Sender: TObject);
var path:String;
begin
if SelectDir(Handle,'',path) then
 CaptureSavepath_Edit.Text:=path;
end;

procedure TMainForm.Homepage1Click(Sender: TObject);
begin
shellexecute(application.Handle,
             pchar('open'),
             pchar('http://www.AdvNetsoft.com'),
             nil,
             nil,
             SW_SHOWNORMAL);
end;

procedure TMainForm.Support1Click(Sender: TObject);
begin
shellexecute(application.Handle,
             pchar('open'),
             pchar('mailto:support@AdvNetsoft.com'),
             nil,
             nil,
             SW_SHOWNORMAL);
end;

end.
