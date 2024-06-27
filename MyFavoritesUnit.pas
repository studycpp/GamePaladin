unit MyFavoritesUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ChildFormUnit, ComCtrls, ToolWin, ImgList, StdCtrls, Buttons,shellapi,
  ExtCtrls,commCtrl, Menus;
  
resourcestring
String_InvalidApplcation='%s 不是一个合法的应用程序.';
String_FilePathName='名称:';
String_FileName='名称:';
String_FileSize='大小:';
String_FileAccessTime='最后访问时间:';
String_FileVersion='版本:';
String_FileCompany='公司:';
String_InValidFavoritesFile='不合法的收藏文件记录，是否删除?';
String_InValidFavoritesFileTitle='不合法的收藏文件记录信息';
String_MAXFavorites='收藏文件记录最多加入%d ';
String_CanNotExecuteFile='%s 不能被执行,请检查.';
String_ClearFavoritesConfirm='你想删除所有的收藏文件记录吗?';
String_ClearFavoritesConfirmTitle='清空收藏文件记录';
Type
  TMyFavoriteExeinfo=record
  FilePathName:String[255];
  SizeofFile:Dword;
  FileVersion:string[40];
  CompanyName:string[40];
  AccessTime:String[20];
  theIcon:Hicon;
end;
type
  TMyFavoritesForm = class(TChildForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    OpenDialog1: TOpenDialog;
    ImageList2: TImageList;
    add_tb: TToolButton;
    delOne_tb: TToolButton;
    execute_tb: TToolButton;
    clear_tb: TToolButton;
    bkScrollBox: TScrollBox;
    EventImage: TImage;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure AddFavoritesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure clear_tbClick(Sender: TObject);
    procedure delOne_tbClick(Sender: TObject);
    procedure EventImageClick(Sender: TObject);
    procedure EventImageDblClick(Sender: TObject);
    procedure bkScrollBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure  DrawInfo(theindex:integer;theImage:Timage;theExeinfo:TMyFavoriteExeinfo);
    procedure AddFavorite(theExeinfo:TMyFavoriteExeinfo);
    procedure DelFavorite(theIndex:Integer);
    procedure DeleteFavoritesName(theIndex:Integer);
    function VCLNameToFileIndex(thename:string):integer;

    { Public declarations }
  end;


const MAX_FavoritesNUm=255;
var
  MyFavoritesForm: TMyFavoritesForm;
  FavoritesFile:String;
  FavoritesNum:integer=0;
  SelectPanel:TPanel;
  SelectImage:TImage;
  UseNameIndex:Integer; ///保证名字依次选取
  VCLList:array[1..MAX_FavoritesNUm] of String;
implementation

{$R *.dfm}

////////获取文件信息/////////////////////////
function GetFavoriteFileinfo(theFile:pchar):TMyFavoriteExeinfo;
var theresult:TMyFavoriteExeinfo;
    SHFILEINFO:TSHFILEINFO;
    FileAttr:WIN32_FILE_ATTRIBUTE_DATA;
    MyFileTime:SYSTEMTIME;
    FileVerinfosize:dword;
    VerInfo:Pointer;
    Translation: Pointer;
    InfoPointer: Pointer;
    unused:Dword;
    VersionValue:String;
const SFinfo='\StringFileInfo\';
begin
///initalize
with  theresult do
begin
FilePathName:=theFile;
SizeofFile:=0;
FileVersion:='';
CompanyName:='';
AccessTime:='';
theIcon:=LoadIcon(0,IDI_WINLOGO);
end;

if ShGetFileInfo(thefile,0,SHFILEINFO,sizeof(SHFILEINFO),SHGFI_ICON)<>0 then
  theresult.theIcon:=SHFILEINFO.hIcon;

if GetFileAttributesEx(thefile,GetFileExInfoStandard,@FileAttr) then
  theresult.SizeofFile:=FileAttr.nFileSizeLow;

if FileTimeToSystemTime(FileAttr.ftLastAccessTime,MyFileTime) then
   theresult.AccessTime:=Format('%d-%d-%d',[MyFileTime.wYear,MyFileTime.wMonth,MyFileTime.wDay]);
unused:=0;
FileVerinfosize:=GetFileVersionInfoSize(pchar(theFile),unused);
if FileVerInfosize>0 then
   begin
   GetMem(VerInfo,FileVerinfosize);
   if GetFileVersionInfo(thefile,0,FileVerinfosize,VerInfo) then
     begin
      VerQueryValue(VerInfo,'\VarFileInfo\Translation', Translation,FileVerinfosize);
      VersionValue:=SFInfo+IntToHex(LoWord(Longint(Translation^)),4)+IntToHex(HiWord(Longint(Translation^)),4)+'\';
      VerQueryValue(VerInfo, pchar(VersionValue+'CompanyName'),InfoPointer, FileVerinfosize);
      theresult.CompanyName := string(pchar(InfoPointer));
      VerQueryValue(VerInfo, pchar(VersionValue + 'FileVersion'),InfoPointer, FileVerinfosize);
      theresult.FileVersion := string(pchar(InfoPointer));
     end;
    FreeMem(VerInfo);
   end;
result:=theresult;
end;

//////鼠标进入画法////////////
procedure  TMyFavoritesForm.DrawInfo(theindex:integer;theImage:Timage;theExeinfo:TMyFavoriteExeinfo);
var     MyIcon:Ticon;
begin
MyIcon:=nil;
MyIcon:=TICon.Create;
 try
with theImage,theExeinfo do
begin
 Canvas.Brush.Color:=clskyBlue;
 Canvas.FillRect(theImage.ClientRect);
 Canvas.Brush.Color:=clskyBlue;
 Canvas.Font.Color:=clBlack;
 Canvas.Font.Size:=10;
 ImageList2.GetIcon(0,MyIcon);
 Canvas.Draw(10,30,Myicon);
 ImageList2.Clear;
 Canvas.Font.Color:=clBlue;
 Canvas.Font.Style:=Canvas.Font.Style+[fsBold];
 Canvas.TextOut(40,10,UpperCase(ExtractFileName(FilePathName)));
 Canvas.Font.Style:=Canvas.Font.Style-[fsBold];
 Canvas.Font.Color:=clBlack;
 Canvas.TextOut(450,15,String_FileVersion+FileVersion);
 Canvas.TextOut(40,35,String_FileAccessTime+AccessTime);
 Canvas.TextOut(450,35,String_FileSize+inttoStr(SizeofFile));
 Canvas.TextOut(40,55,String_FilePathName+FilePathName);
 Canvas.TextOut(450,55,String_FileCompany+CompanyName);
end;
finally
 FreeandNil(MyIcon);
end;
end;
////////控件名对应文件中存放位置////////////////////////////////////////////
Function TMyFavoritesForm.VCLNameToFileIndex(theName:string):integer;
var I:integer;
begin
result:=-999;
for i:=1 to FavoritesNum do
begin
 if VCLList[i]=theName then
 begin 
 result:=i;
 exit;
 end;

end;

end;

/////////////动态增加控件/////////////////////////
procedure TMyFavoritesForm.AddFavorite(theExeinfo:TMyFavoriteExeinfo);
var MyPanel:TPanel;
    MyImage:TImage;
begin
  Inc(favoritesNum);
   inc(UseNameIndex);
 MyPanel:=TPanel.Create(self);
  with MyPanel do
  begin
 Name:='Panel'+intToStr(UseNameIndex);
 Parent:=bkScrollBox;
 Left:=200;
 if  favoritesNum>0 then top:=85*(favoritesNum+1);///确保排在最后
 Width:=100;
 Height:=85;
 align:=altop;
 BevelInner:=BvLowered;
  BevelOuter:=bvLowered;
  MyPanel.BorderWidth:=3;
  Caption:=theExeinfo.FilePathName;   ///////
  Tag:=999;/////////删除时区别普通
  end;
 
 //MyImage:=nil;
 MyImage:=TImage.Create(self);
  with MyImage do
  begin
 Name:='Image'+intToStr(UseNameIndex);
 Parent:=MyPanel;
 Align:=alClient;
 Left:=0;
 Width:=800;
 Height:=85;
 Transparent:=false;
 Cursor:=crHandPoint;
 OnClick:=EventImageClick;
 OnDblClick:=EventImageDblClick;
  end;
 VCLList[favoritesNum]:=MyImage.Name;
 DrawInfo(FavoritesNum-1,MyImage,theExeinfo);
end;
//////////////////////////////////////
procedure TMyFavoritesForm.DeleteFavoritesName(theIndex:Integer);
var theMemStreamSource:TMemoryStream;
    theMemStreamTarget:TMemoryStream;
    I:integer;
begin
  theMemStreamSource:=TMemoryStream.Create;
  try
  theMemStreamSource.LoadFromFile(FavoritesFile);
   begin
   I:=theMemStreamSource.Size mod 255;
   if i<>0 then exit;
   I:=theMemStreamSource.Size div 255;
   if i=0 then exit;
    try
    I:=theMemStreamSource.Size;
    theMemStreamTarget:=TmemoryStream.Create;
    theMemStreamTarget.Seek(0,sofrombeginning);
     begin       
       if  theindex=1 then
       begin
     theMemStreamSource.Seek(theindex*255,sofrombeginning);
     if (i-255)=0 then theMemStreamTarget.SetSize(0) else
     theMemStreamTarget.CopyFrom(theMemStreamSource,i-255);
        end;
       if theindex>1 then
        begin
         theMemStreamSource.Seek(0,sofrombeginning);
         theMemStreamTarget.CopyFrom(theMemStreamSource,(theindex-1)*255);
         theMemStreamSource.Seek(theindex*255,sofrombeginning);
         if (i-theindex*255)>0  then
         theMemStreamTarget.CopyFrom(theMemStreamSource,i-theindex*255);
        end;
        theMemStreamTarget.SaveToFile(FavoritesFile);
     end;
    finally
      FreeAndNil(theMemStreamTarget);
     end;
   end;
  finally
   FreeAndNil(theMemStreamSource);
  end;

end;
////////////////////////////////////////////
procedure TMyFavoritesForm.DelFavorite(theIndex:Integer);
var theComponent:Tcomponent;
begin
    theComponent:=FindComponent('Panel' + IntToStr(theIndex));
    FreeAndNil(theComponent);
    theComponent:=FindComponent('Image' + IntToStr(theIndex));
    FreeAndNil(theComponent);
    DeleteFavoritesName(theIndex);
end;


procedure TMyFavoritesForm.AddFavoritesClick(Sender: TObject);
var SHFILEINFO:TSHFILEINFO;
    FavoriteSaveFile:TFileStream;
    MyFavotiteFileinfo:TMyFavoriteExeinfo;
begin
  if favoritesNum>=MAX_FAvoritesNUm then
   begin
   Showmessage(Format(String_MAXFavorites,[MAX_FavoritesNUm]));
   exit;
   end;
if OpenDialog1.Execute then
begin
 if 0=ShGetFileInfo(pchar(OpenDialog1.Filename),0,SHFILEINFO,sizeof(SHFILEINFO),SHGFI_EXETYPE) then
 begin
 showmessage(Format(String_InvalidApplcation,[OpenDialog1.Filename]));
 exit;
 end;
 MyFavotiteFileinfo:=GetFavoriteFileinfo(pchar(OpenDialog1.Filename));

 try
  FavoriteSaveFile:=TFileStream.Create(FavoritesFile,fmopenreadwrite or fmshareDenyNone);
  FavoriteSaveFile.Seek(0,soFromEnd);
  FavoriteSaveFile.WriteBuffer(MyFavotiteFileinfo.FilePathName,255);
 finally
 FreeAndNil(FavoriteSaveFile);
 end;
  imagelist_addicon(imageList2.Handle,MyFavotiteFileinfo.theIcon);
  AddFavorite(MyFavotiteFileinfo);
end;

end;

procedure TMyFavoritesForm.FormCreate(Sender: TObject);
var theFileName:String[255];
    TempFileName:String;
    I,FHandle:Integer;
    SHFILEINFO:TSHFILEINFO;
    FavoritesMemStream:TmemoryStream;
    RealFavoritesStream:TmemoryStream;
    MyFavotiteFileinfo:TMyFavoriteExeinfo;
begin
UseNameIndex:=0;
favoritesNum:=0;
FavoritesFile:=pchar(ExtractFilePath(application.ExeName)+'MyFavorites.pkt');
if not FileExists(FavoritesFile) then
 begin
 FHandle:=FileCreate(FavoritesFile);
 if FHandle=-1 then exit;
 CloseHandle(FHandle);
 end;


  FavoritesMemStream:=TmemoryStream.Create;
try
  FavoritesMemStream.LoadFromFile(FavoritesFile);

 if FavoritesMemStream.Size=0 then Exit;
 if (FavoritesMemStream.Size mod 255<>0) then
  begin
   if IDYES=MessageBox(Application.Handle,pchar(String_InValidFavoritesFile),
                pchar(String_InValidFavoritesFileTitle),MB_YESNO) then
   begin
   FavoritesMemStream.clear;
   deleteFile(FavoritesFile);
   exit;
   end   else    Exit;
  end;

  RealFavoritesStream:=TmemoryStream.Create;
  FavoritesMemStream.Seek(0,soFromBeginning);
  for i:=1 to (FavoritesMemStream.Size div 255) do
  begin
   FavoritesMemStream.Read(theFileName,255);
   if not FileExists(theFileName) then    Continue;
   tempFileName:=theFileName;
   if 0=ShGetFileInfo(pchar(tempFileName),0,SHFILEINFO,sizeof(SHFILEINFO),SHGFI_EXETYPE) then
    begin
     showmessage(Format(String_InvalidApplcation,[tempFileName]));
     continue;
    end;
    
    RealFavoritesStream.WriteBuffer(theFileName,255);
    MyFavotiteFileinfo:=GetFavoriteFileinfo(pchar(tempFileName));
    imagelist_addicon(imageList2.Handle,MyFavotiteFileinfo.theIcon);
    AddFavorite(MyFavotiteFileinfo);
    if favoritesNum>=MAX_FavoritesNUm then
     begin
      Showmessage(Format(String_MAXFavorites,[MAX_FavoritesNUm]));
      exit;
     end;
  end; //for end

  try
  RealFavoritesStream.SaveToFile(FavoritesFile);
  finally
  FreeAndNil(RealFavoritesStream);
  end;

  finally
  FreeAndNil(FavoritesmemStream);
  end;



end;

procedure TMyFavoritesForm.clear_tbClick(Sender: TObject);
var    i: Integer;
      Temp:TComponent;
      TempStream:TMemoryStream;
begin
if FavoritesNum=0 then exit;
if IDCANCEL=MessageBox(Application.Handle,
                       pchar(String_ClearFavoritesConfirm),
                       pchar(String_ClearFavoritesConfirmTitle),
                       MB_OKCANCEL)
                        then exit;
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TPanel)and (Temp.Tag<>0) then ///tag 区别普通
    begin
      FreeAndNil(Temp);
    end;
  end;
  
UseNameIndex:=0;
FavoritesNum:=0;
TempStream:=TmemoryStream.Create;
try
TempStream.SetSize(0);
TempStream.SaveToFile(FavoritesFile);
finally
FreeAndNIl(TempStream);
end;

end;

procedure TMyFavoritesForm.delOne_tbClick(Sender: TObject);
var I:Integer;
   TempIndex:integer;
begin
if (FavoritesNum>0) and (SelectImage<>nil) and (SelectImage<>nil)  then
begin
TempIndex:=VCLNameToFileIndex(SelectImage.Name);
if TempIndex<0 then exit;
DeleteFavoritesName(TempIndex);
FreeAndNIl(SelectImage);
FreeAndNIl(SelectPanel);
if (FavoritesNum<>1) or (TempIndex<>FavoritesNum)then
  begin
      for I :=TempIndex  to FavoritesNum-1 do
      begin
      VCLList[i]:=VCLList[i+1];
      end;
  end;
DEC(FavoritesNum);
end;

end;

procedure TMyFavoritesForm.EventImageClick(Sender: TObject);
var I:integer;
    Temp:TComponent;
begin
if sender is TImage then
begin
SelectImage:=Timage(sender);
SelectPanel:=Tpanel(Timage(sender).Parent);
end;
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TPanel) then
    begin
     TPanel(Temp).BevelInner:=bvNone;
     TPanel(Temp).BevelOuter:=bvRaised;
     TPanel(Temp).Color:=clBtnFace;
    end;
  end;
  SelectPanel.BevelInner:=bvLowered;
  SelectPanel.BevelOuter:=bvLowered;
  SelectPanel.Color:=clblue;
end;

procedure TMyFavoritesForm.EventImageDblClick(Sender: TObject);
var StartInfo : TStartupInfo;
  FProcessInfo : TProcessInformation;
begin
if SelectPanel<>nil then
begin
  //init StartInformation
  StartInfo.cb:=sizeof(TStartupInfo);
       StartInfo.lpReserved := NIL;
         StartInfo.lpDesktop:=NIL;
          StartInfo.lpTitle := nil;
  StartInfo.dwFillAttribute := 0;
      StartInfo.cbReserved2 :=0;
      StartInfo.lpReserved2 := NIL;    //这个参数控制Create Window形态
        //STARTF_USESHOWWINDOW 指定这个标志位，指示用ShowWindow的参数建立窗口
          StartInfo.dwFlags := STARTF_USESHOWWINDOW;
      StartInfo.wShowWindow := SW_SHOW;
   //Clear ProcessInfo Structure
  FProcessInfo.hProcess := 0;
  FProcessInfo.hThread := 0;
  FProcessInfo.dwProcessId := 0;
  FProcessInfo.dwThreadId := 0;
if not CreateProcess(NIL,
                  pchar(SelectPanel.Caption),
                  nil,
                  nil,
                  false,
                  CREATE_NEW_CONSOLE or   { creation flags }
                  NORMAL_PRIORITY_CLASS,
                  nil,
                  pchar(ExtractFilePath(SelectPanel.Caption)),
                  StartInfo,
                  FProcessInfo)
                  then

begin
 ShowMessage(Format(String_CanNotExecuteFile,[SelectPanel.Caption]));
 exit;
end;
end;
end;

procedure TMyFavoritesForm.bkScrollBoxClick(Sender: TObject);
var I:integer;
     Temp:Tcomponent;
begin
  for I := ComponentCount - 1 downto 0 do
  begin
    Temp := Components[I];
    if (Temp is TPanel) then
    begin
     TPanel(Temp).BevelInner:=bvNone;
     TPanel(Temp).BevelOuter:=bvRaised;
     TPanel(Temp).Color:=clBtnFace;
    end;
  end;
SelectPanel:=nil;
SelectImage:=nil;
end;

end.
