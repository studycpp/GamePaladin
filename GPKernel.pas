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

unit GPKernel;

interface

uses Windows,StdCtrls,Classes,SysUtils,dialogs,tlhelp32,forms,
     ComCtrls,Controls,math,Shellapi,CommCtrl;

resourcestring

String_GetProcesses='枚举进程出错.请检查Windows系统或者重新启动' ;
String_CreateToolhelp32Snapshot='发生错误(不支持WindowNT 4.0及其以下)'#13#10'请用应用程序列表选择任务';
String_InvalidInput='不合法的输入,请检查.';
String_InvalidByte='%s 不是合法的 Byte 数据类型,请检查';
String_InvalidWord='%s 不是合法的 Word 数据类型,请检查';
String_InvalidDword='%s 不是合法的 Dword 数据类型,请检查';
String_InvalidInt64='%s 不是合法的 Int64 数据类型,请检查';
String_InvalidSingle='%s 不是合法的 Single 数据类型,请检查';
String_InvalidDouble='%s 不是合法的 Double 数据类型,请检查';
String_InvalidString='%s 不是合法的 Text 数据类型,请检查';
String_TaskResult='任务: %s '#13#10'找到 %d 个地址,'#13#10'用时 %f 秒.';
String_TaskResultTitle='搜索结果';
String_Nomemory='找不到该进程中可用内存!请检查!' ;
String_InitialLowLevel='任务:%s'#13#10'低阶搜索初始化完成.';

procedure InittheTask(theID:Integer);
Procedure GetProcessList(ProcessList: TListView;ImageList,HeadImageList:TimageList);
procedure GetWindowList(ProcessList: TListView;ImageList,HeadImageList:TimageList);
Function  GetScanTypeAndTempVar(InputValue:String;theTaskIndex:integer):Integer;
Function  HexIntChange(inStr:string):String;
Function  GetVarTypeAndVarValue(InputValue:String;theTaskIndex:integer):Integer;

Procedure GetMemoryRanges(theTaskIndex:integer);
function AnalyseScan(theIndex:Integer):integer;

Function ReadMemory(theProcessID,StartAddress:Dword;ValueAddressPointer:Pointer;ValueType:Integer):boolean;
Function ReadMemory_Array(theProcessID,StartAddress:DWORD):boolean;
Function WriteMemory(theProcessID,StartAddress:Dword;ValueAddressPointer:pointer;ValueType,ValueLen:Integer):boolean;

Type
TFirstScanThread=class(TThread)
 private
   TheTaskIndex:integer;
 protected
 procedure Execute; override;
 public
  constructor Create(theIndex:Integer);
end;

type
TNextScanThread=class(TThread)
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
  

Type TMemoryRegion = record
       BaseAddress: Dword;
       MemorySize:  Dword;
end;
type
  TProcesstask =record
    Applyed:Boolean;                   ///是否占用
    Name:String;                       //名字
    Index:integer;                    //task array
    ProcessID:Dword;                 //对应进程id
    ProcessHandle:Dword;            //对应进程句柄
    ScanType:integer;                //scan type
    OldScanType:integer;           //上一次扫描类型
    VarType:integer;
    OldVarType:integer;            ///应付自动类型
    ScanValue:String;
    FromAddress:Dword;                   ///from
    ToAddress:Dword;                      //to
    TotalProcess:Dword;                   ///应扫描总的地指数shr
    NowProcess:Dword;                    ////扫描数量
    InSearchProcess:Boolean;               ///是否正在扫描，防止多次点击
    SearchTimes:Integer;                   //扫描次数
    AttachedNum:DWORD;                    //匹配数目
    MemoryFileName:String;                  ///低阶内存映射文件
    MemoryFileNameNew:String;               ///低阶内存映射文件
    AddressMemStream:TMemoryStream;         //几下每个符合的地址
    AdvancedAddressMemStream:TMemoryStream;  //几下低阶符合的地址范围及大小
    MemoryRegions: array [0..20000] of TMemoryRegion;   ///内存范围
    MemoryRegionsIndex:Integer;                        // 内存范围序号
    MBI:_MEMORY_BASIC_INFORMATION;                     //内存信息变量
end;



Const maxTaskNUm=256;
var   TaskNUm:Integer=0;  ///任务个数
      thetask:array[1..maxTaskNUm] of TProcessTask;
      ListToTaskIndex:array[1..maxTaskNUm] of Integer; //listview 对应任务Index
      CurrentTaskIndex:Integer;
      CurrentProcessID:DWord;
      DefaultFromAddress:DWORD=$00010000;
      DeFaultToAddress:DWORD=$86500000;

var   MemReadStartAddress:DWORD;
      MemReaddata:array[1..256] of Integer;
      MemWriteStartAddress:Dword;






{   转变成每一个任务的私有成员变量
   var MemoryRegions: array [0..20000] of TMemoryRegion;
    MemoryRegionsIndex:Integer;
    MBI:_MEMORY_BASIC_INFORMATION;
   转变成每一个进程的私有变量
    ReadMemory_ArrayByte: Array[0..$FFFF] of Byte;
    ReadMemory_ArrayWord: Array[0..$7FFF] of Word;
    ReadMemory_ArrayDWord: Array[0..$3FFF] of Dword;
    ReadMemory_ArrayInt64: Array[0..$1FFF] of Int64;
    ReadMemory_ArraySingleDword:Array[0..$3FFF] of Dword; //single length is same to dowrd
    ReadMemory_ArrayDoubleInt64: Array[0..$1FFF] of int64; //Double length is same to int64
    ReadMemory_ArrayStringByte:Array[0..$FF] of Byte;
    AdvancedReadMemory_ArrayByte:Array[0..$FFFF] of Byte;
    AdvancedReadFile_ArrayByte:Array[0..$FFFF] of Byte;

  ///数组过大将无法读出
  }
type
  TLockRecord = record
        Applyed:Boolean;
        Description : string[40];
        Address : Dword;
        valueStr:String[20];
        VarType : integer;
        ProcessID:DWord;
        Frozen : boolean;
end;

Const maxLockNUm=256;
var LockNUm:Integer=0;  ///锁定个数
    ListToLockIndex:array[1..maxLockNUm]of integer;
    MemLockRecord:Array[1..maxLockNUm]of TLockRecord;
    CopyLockRecord:TLockRecord;
    CanPasteLockRecord:boolean=false;
const   MaxShow=1000;
        SplitValue=$FFFE;    ///max stream =$FFFe never error

var CanUpdateTask:Integer=-999; ///防止更新闪烁，



implementation



//////////////初始化任务//////////////////////////////////
procedure Initthetask(theID:Integer);
begin
with theTask[theId] do
begin
    Applyed:=True;
    Name:='XGQ Game Paladin';
    //index:=1;
    ProcessID:=0;                 //进程id
    ProcessHandle:=0;            //对应进程句柄 实际中需要判断是否存在
    ScanType:=Number_Scan;            //Number_Scan:=  ]
    OldScanType:=ScanType;
    VarType:=Auto_value;            //选择某一类型后,实际搜索类型auto
    OldVarType:=Auto_value;
    ScanValue:='';
    TotalProcess:=0;
    NowProcess:=0;
    FromAddress:=DefaultFromAddress;
    ToAddress:=DeFaultToAddress;
    SearchTimes:=0;
    AttachedNum:=0;
    InSearchProcess:=False;
    MemoryFileName:='';
    MemoryFileNameNew:='';
    if Assigned(AddressmemStream)then
       AddressMemStream.SetSize(0) else
       AddressMemStream:=TmemoryStream.Create;
    if Assigned(AdvancedAddressMemStream)then
      AdvancedAddressMemStream.SetSize(0) else
      AdvancedAddressMemStream:=TmemoryStream.Create;
end;
end;

///////////////////获取进程列表////////////////////////
procedure GetProcessList(ProcessList: TListView;ImageList,headImageList:TimageList);
var lppe: TProcessEntry32;
    Foundlppe: boolean;
    SnapHandle: THandle;
    HAppIcon:Hicon;
    FWinIcon:HIcon;
begin
ProcessList.Items.BeginUpdate;
ProcessList.Items.Clear;
processlist.SmallImages:=nil;
ImageList.Clear;
HappIcon:=0;
FWinIcon:=LoadIcon(0,IDI_WINLOGO);
SnapHandle:= CreateToolhelp32Snapshot(TH32CS_SNAPALL,0);
if SnapHandle>0 then
begin
  lppe.dwSize:=Sizeof(lppe);
  Foundlppe:= Process32First(SnapHandle,lppe);
  if (not Foundlppe) then Raise Exception.Create(String_GetProcesses);
  ImageList.AddImages(headImageList);
  while Foundlppe do
  begin
      HAppIcon:=ExtractIcon(HAppIcon,lppe.szExeFile,0);
      if HappIcon=0 then HAppIcon:=FWinIcon;
      with ProcessList.Items.Add  do
       begin
        Caption:=lppe.szExeFile;
        Subitems.Add(intToStr(lppe.th32ProcessID));
        ImageIndex:=ImageList_AddIcon(ImageList.Handle,HappICon);
       end;
      Foundlppe:=Process32Next(SnapHandle,lppe);
  end;

end else Raise Exception.Create(String_CreateToolhelp32Snapshot);
ProcessList.SmallImages:=Imagelist;
CloseHandle(SnapHandle);
DestroyIcon(HappIcon);
DestroyIcon(FWinICon);
ProcessList.Items.EndUpdate;
end;

////////////////////获取窗口列表////////////////////////////
procedure GetWindowList(ProcessList: TListView;ImageList,headImageList:TimageList);
var winhandle: Hwnd;
    winprocess: Dword;
    title:pchar;
    HAppIcon:Hicon;
    FWinIcon:HIcon;
begin
  ProcessList.Items.BeginUpdate;
  HappIcon:=0;
  processlist.Items.clear;
  processlist.SmallImages:=nil;
  ImageList.Clear;
  FWinIcon:=LoadIcon(0,IDI_WINLOGO);
  Getmem(title,255);
  winhandle:=GetWindow(GetForeGroundWindow,GW_HWNDFIRST);
  ImageList.AddImages(headImageList);
  while winhandle<>0 do
  begin
   if (isWindowvisible(winhandle) and IsWindowEnabled(winhandle) and IsWindow(winhandle)) then
    begin
    GetWindowThreadProcessId(winhandle,@winprocess);
    GetWindowText(winhandle,title,255);
    if Length(title)<>0 then
     begin
        HAppIcon:=GetClassLong(winHandle,GCL_HICON);
        if HappIcon=0 then HAppIcon:=FWinIcon;
        With ProcessList.Items.Add do
          begin
          Caption:=title;
          Subitems.Add(intToStr(winprocess));
          ImageIndex:=ImageList_AddIcon(ImageList.Handle,HappICon);
          end;
      end;
    end;
    winhandle:=GetWindow(winhandle,GW_HWNDNEXT);
  end;

ProcessList.SmallImages:=Imagelist;
Freemem(title);
CloseHandle(winHandle); 
DestroyIcon(HappIcon);
DestroyIcon(FWinICon);
ProcessList.Items.EndUpdate;
end;


///////////根据输入的值判断scantype//////////////////////////////////////////////////
Function GetScanTypeAndTempVar(InputValue:String;thetaskIndex:integer):Integer;
var Len:integer;
begin
Result:=-999;
with thetask[theTaskIndex] do
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
Function  GetVarTypeAndVarValue(InputValue:String;theTaskIndex:integer):Integer;
var ByteTemp:Byte;
    WordTemp:word;
    DwordTemp:Dword;
    Int64Temp:int64;
    SingleTemp:Single;
    DoubleTemp:Double;
    ECode:integer;
begin
Result:=-999; //error value
with theTask[theTaskIndex] do
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
/////////////得到进程在内存的起始位置大小/////////////////////////////////
Procedure GetMemoryRanges(theTaskIndex:integer);
var TempStartAddress: Dword;
    TempEndAddress:Dword;
    Tempsize:DWord;
    i,j,k,m:Integer;
    NewMemoryRegions:array [0..20000] of TmemoryRegion;
begin
With theTask[theTaskIndex] do
begin
   MemoryRegionsIndex:=0;
   TempStartAddress:=FromAddress;
   TempEndAddress:=ToAddress;

////////////////////////////////
While (VirtualQueryEx(ProcessHandle,pointer(TempStartAddress),MBI,sizeof(MBI))>0) and (TempStartAddress<TempEndAddress) do
begin
   if (MBI.State=MEM_COMMIT)   then  //许可操作内存??
    begin      
        if (MBI.Protect=PAGE_READWRITE) or
           (MBI.Protect=PAGE_WRITECOPY) or
           (MBI.Protect=PAGE_EXECUTE_READWRITE) or
           (MBI.Protect=PAGE_EXECUTE_WRITECOPY) 
        then
        begin
          MemoryRegions[MemoryRegionsIndex].BaseAddress:=Dword(MBI.BaseAddress);
          MemoryRegions[MemoryRegionsIndex].MemorySize:=MBI.RegionSize;
          inc(MemoryRegionsIndex); /// so MemoryRegions[MemoryRegionsIndex]is invalid
        end;
    end;
    TempStartAddress:=Dword(MBI.BaseAddress)+MBI.RegionSize;
end;
if MemoryRegionsIndex=0 then Exit;
////检查由VirtualQueryEx内存范围是否真的在用户指定范围 ///////////////,
with  MemoryRegions[0] do
begin
  if (BaseAddress<FromAddress)  and  (BaseAddress+MemorySize-FromAddress>0 )  then
  begin
    MemorySize:=BaseAddress+MemorySize-FromAddress;
    BaseAddress:=FromAddress;
  end;
end;
////右边界//////////////////
with  MemoryRegions[MemoryRegionsIndex-1] do
begin
 if (BaseAddress+MemorySize)>ToAddress   then
 begin
 Dec( MemorySize,(BaseAddress+MemorySize-ToAddress) );
 end;
end;

////////////////////
//!!!!!!!!!!!警告内存块不能过大否则以后不能正常读写///////////////////////////
/////将连续的内存块整合起来/////////////////////////////////////////////////////////////////////////
  j:=0;
  TempStartaddress:=memoryregions[0].BaseAddress;
  Tempsize:=memoryregions[0].MemorySize;

  for i:=1 to memoryregionsIndex-1 do
  begin
    if memoryregions[i].BaseAddress=TempStartaddress+Tempsize then
    begin
      inc(Tempsize,memoryregions[i].MemorySize);
    end
    else
    begin
      memoryregions[j].BaseAddress:=TempStartaddress;
      memoryregions[j].MemorySize:=Tempsize;

      TempStartaddress:=memoryregions[i].BaseAddress;
      Tempsize:=memoryregions[i].MemorySize;
      inc(j);
    end;
  end;

  memoryregions[j].BaseAddress:=TempStartaddress;
  memoryregions[j].MemorySize:=Tempsize;
  memoryregionsIndex:=j+1;       // fit MemoryRegions[MemoryRegionsIndex]is invalid

///分隔内存如果某一块过大以后用Stream,以及动态数组都将退出程序  ////////////////////////

  j:=0;
  i:=0;
  while i<=MemoryregionsIndex-1 do
  begin
    k:=(memoryregions[i].MemorySize div SplitValue);
    if k>0 then
    begin
      for m:=0 to k do
      begin
      NewMemoryRegions[j].BaseAddress:=Memoryregions[i].BaseAddress+SplitValue*m;

      if m<k then    NewMemoryRegions[j].MemorySize:=Splitvalue else
      NewMemoryRegions[j].MemorySize:=Memoryregions[i].MemorySize-SplitValue*m;
      inc(j);
      end;
    end else
    begin
     Newmemoryregions[j].BaseAddress:=Memoryregions[i].BaseAddress;
     Newmemoryregions[j].MemorySize:=Memoryregions[i].MemorySize;
     inc(j);
    end;
   
  inc(i);
  end;
//////////////////////////////////////////////
  MemoryRegionsIndex:=j; //  MemoryRegions[MemoryRegionsIndex]is invalid
  for i:=0 to MemoryRegionsIndex-1 do
  begin
  Memoryregions[i].BaseAddress:=Newmemoryregions[i].BaseAddress;
  Memoryregions[i].MemorySize:=NewMemoryregions[i].MemorySize;
  end;
///////////////////////////////////////////////////////////////////////////////

 for i:=0 to MemoryRegionsIndex-1 do
TotalProcess:=TotalProcess+MemoryRegions[i].MemorySize;
NowProcess:=0;
     
end;////end with
end;
//////必须考虑前面的搜索类型
function AnalyseScan(theIndex:Integer):integer;
var thehandle:Dword;
    TempLength:Dword;
    TempSize:Dword;
begin
result:=-999;
with theTask[theIndex] do
begin
    ////////////////////检查应用程序是否关闭 /////////////////////////////////////
    theHandle:=OpenProcess(PROCESS_ALL_ACCESS,False,ProcessID);
    if theHandle=0 then
    begin
    Result:=0;
     Exit;
    end;
    ProcessHandle:=thehandle;
    ////////////////////////////////////////////////////////////
    if  SearchTimes=0 then
    begin
     Result:=4;
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
     TempLength:=AdvancedAddressMemStream.Size;
     TempSize:=TempLength shr 3;  ////Dword  Address Dword Size
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

//////////////////初次扫描////////////////////////////////
constructor TFirstScanThread.Create(theIndex:integer);
begin
TheTaskIndex:=theIndex;
FreeOnTerminate:=True;
inherited Create(False);
end;


Procedure TFirstScanThread.Execute;
var ReadMemory_ArrayByte: Array[0..$FFFF] of Byte;
    ReadMemory_ArrayWord: Array[0..$7FFF] of Word;
    ReadMemory_ArrayDWord: Array[0..$3FFF] of Dword;
    ReadMemory_ArrayInt64: Array[0..$1FFF] of Int64;
    ReadMemory_ArraySingleDword:Array[0..$3FFF] of Dword; //single length is same to dowrd
    ReadMemory_ArrayDoubleInt64: Array[0..$1FFF] of int64; //Double length is same to int64
    ReadMemory_ArrayStringByte:Array[0..$FF] of Byte;
    AdvancedReadMemory_ArrayByte:Array[0..$FFFF] of Byte;
    AdvancedReadFile_ArrayByte:Array[0..$FFFF] of Byte;
    
var TempLength: DWORD;               ////每个内存块的大小字节
    TempSize:DWORD;                 ////缓存区array num的数目
    ActualRead:Dword;
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
    j: integer;
    k: integer;

    ByteValue: Byte;
    WordValue: Word;
    DWordValue: Dword;
    Int64Value: Int64;
    SingleValue: Single;
    doubleValue: double;


    tempAddress:Dword;
    actualwrite:Dword;
    MemoryFileStream:TFileStream;  ///低阶内存svae to memroyFilename
begin

with theTask[theTaskIndex] do
begin
GetMemoryRanges(theTaskIndex);
if MemoryRegionsIndex=0 then
begin
Raise Exception.Create(String_Nomemory);
Exit;
end;

/////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
/////////////再次并得到最终数据/////////////////////////////////////////
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
   InSearchProcess:=True;
   Searchtimes:=1;
   NowProcess:=0;
   AttachedNum:=0;
   OldScanType:=ScanType;
   OldVarType:=VarType;
   AddressMemStream.Seek(0,soFromBeginning);
/////////Lets Real Start !真正开始!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////////
////////////////////////////////////////////////////////////

if ScanType=Number_Scan then
begin
Time1:=GetTickCount;
    if vartype=Byte_value then  //byte
    begin
      for i:=0 to memoryregionsIndex-1 do
      begin
        TempLength:=MemoryRegions[i].MemorySize;
        TempSize:=TempLength;
        if not ReadProcessMemory(ProcessHandle,pointer(MemoryRegions[i].BaseAddress),@ReadMemory_ArrayByte,TempLength,actualread) then continue;
        begin
          if (actualread>0) then
          begin
          TempSize:=actualread;
            for j:=0 to TempSize-1 do
            begin
            if ReadMemory_ArrayByte[j]=ByteValue then
              begin
              inc(AttachedNum);
              tempAddress:=MemoryRegions[i].BaseAddress+j;
              AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
              end;
            end;
          end;
        end;
        inc(NowProcess,MemoryRegions[i].MemorySize);
      end;
    end;   //byte end
 
    if vartype=Word_value then //word
    begin
      for i:=0 to MemoryRegionsIndex-1 do
      begin
        for k:=0 to 1 do                    //k表示错位组合成类型
        begin
        TempLength:=(MemoryRegions[i].MemorySize-k);   
        TempSize:=TempLength shr 1;
        if not ReadProcessMemory(processhandle,pointer(MemoryRegions[i].BaseAddress+k),@ReadMemory_ArrayWord,TempLength,actualread) then continue;
          if actualread>0 then
            begin
              TempSize:=actualread shr 1;
              for j:=0 to TempSize-1 do
              begin
                if ReadMemory_ArrayWord[j]=wordvalue then
                   begin
                   inc(AttachedNum);
                   tempAddress:=(MemoryRegions[i].BaseAddress+k)+j*2;
                   AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
                   end;
              end;
            end;
        end;
        inc(NowProcess,MemoryRegions[i].MemorySize);
      end;
    end;   //word end

   if vartype=Dword_value then //dword
   begin
      for i:=0 to MemoryRegionsIndex-1 do
      begin
        for k:=0 to 3 do                       //k表示错位组合成类型
        begin
        TempLength:=(MemoryRegions[i].MemorySize-k);
        TempSize:=TempLength shr 2;
        ////////内存随时在变化,故判断,绝对经验
        if not ReadProcessMemory(processhandle,pointer(MemoryRegions[i].BaseAddress+k),@ReadMemory_ArrayDWORD,TempLength,actualread) then continue;
          if actualread>0 then
          begin
          TempSize:=actualread shr 2;
            for j:=0 to TempSize-1 do
              begin
               if Readmemory_ArrayDWord[j]=Dwordvalue then
               begin
               inc(AttachedNum);
               tempAddress:=(MemoryRegions[i].BaseAddress+k)+j*4;
               AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
               end;
              end;
          end;
        end;
        inc(NowProcess,MemoryRegions[i].MemorySize);
      end;
    end;   ///dword

   if vartype=Int64_value then //int64
   begin
      Time1:=GetTickCount;
      for i:=0 to MemoryRegionsIndex-1 do
      begin
        for k:=0 to 7 do                               //k表示错位组合成类型
        begin
        TempLength:=(MemoryRegions[i].MemorySize-k);
        TempSize:=TempLength shr 3;
        if not ReadProcessMemory(processhandle,pointer(MemoryRegions[i].BaseAddress+k),@ReadMemory_Arrayint64,TempLength,actualread) then continue;
          if actualread>0 then
           begin
           TempSize:=actualread shr 3;
            for j:=0 to TempSize-1 do
              begin
               if Readmemory_Arrayint64[j]=int64value then
               begin
               inc(AttachedNum);
               tempAddress:=(MemoryRegions[i].BaseAddress+k)+j*8;
               AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
               end;
              end;

           end;
        end;
        inc(NowProcess,MemoryRegions[i].MemorySize);
      end;
    end;  //int64 end

   if vartype=Single_value then //Single
   begin
      PHelpSingleDword:=@singlevalue;
      HelpSingleDword1:=(PHelpSingleDword^ shr 23);
      for i:=0 to MemoryRegionsIndex-1 do
      begin
        for k:=0 to 3 do                                     //k表示错位组合成类型
        begin
        TempLength:=(MemoryRegions[i].MemorySize-k);
        TempSize:=TempLength shr 2;
        if not ReadProcessMemory(processhandle,pointer(MemoryRegions[i].BaseAddress+k),@ReadMemory_ArraysingleDword,TempLength,actualread) then continue;
          if actualread>0 then
            begin
            TempSize:=actualread shr 2;
            for j:=0 to TempSize-1 do
              begin
               ///single的1位符号位与8位指数为相同
                 HelpsingleDWord2:=ReadMemory_ArraysingleDword[j] shr 23;
                 if helpsingleDWord2=helpsingleDWord1 then
                 begin
                 inc(AttachedNum);
                 tempAddress:=(MemoryRegions[i].BaseAddress+k)+j*4;
                 AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
                 end;
               end;
            end;
            
        end;  //for all loop
        inc(NowProcess,MemoryRegions[i].MemorySize);
      end;  //for all MemoryrangesIndex
    end;    ///single end

   if vartype=Double_value then //Double
   begin
      PHelpDoubleint64:=@Doublevalue;
      HelpDoubleint641:=(PHelpDoubleInt64^ shr 52);
      for i:=0 to MemoryRegionsIndex-1 do
      begin
        for k:=0 to 7 do                                     //k表示错位组合成类型
        begin
        TempLength:=(MemoryRegions[i].MemorySize-k);
        TempSize:=TempLength shr 3;
        if not ReadProcessMemory(processhandle,pointer(MemoryRegions[i].BaseAddress+k),@ReadMemory_ArrayDoubleInt64,TempLength,actualread) then continue;
          if actualread>0 then
          begin
          TempSize:=actualread shr 3;
            for j:=0 to TempSize-1 do
              begin
               ///double的1位符号位与11位指数为相同
                 HelpDoubleInt642:=ReadMemory_ArrayDoubleInt64[j] shr 52;
                 if helpDoubleInt642=helpDoubleInt641 then
                 begin
                 inc(AttachedNum);
                 tempAddress:=(MemoryRegions[i].BaseAddress+k)+j*8;
                 AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
                 end;
              end;
           end;

        end;  //for all loop
        inc(NowProcess,MemoryRegions[i].MemorySize);
      end;  //for all MemoryrangesIndex
    end;  //double end
    
    NowProcess:=totalProcess;
    time2:=getTickCount;
    CanUpdateTask:=messageBox(Application.handle,
                 pchar(Format(String_TaskResult,[name,AttachedNum,(Time2-Time1)/1000])),                 //pchar('任务:'+name+#13#10+'总共找到'+intToStr(AttachedNum)+'个结果 耗时'+FloattoStr((Time2-Time1)/1000)+'秒'),
                 pchar(String_TaskResultTitle),
                 MB_OK);
end; //Number_Scan end

//text String scan
if scantype=string_scan then
  begin
    time1:=getTickCount;
    helpStringLength:=length(scanvalue);
    for i:=0 to memoryregionsindex-1 do
    begin
      TempLength:=memoryregions[i].MemorySize;
      TempSize:=TempLength;
      if not readprocessmemory(processhandle,pointer(Memoryregions[i].BaseAddress),@ReadMemory_ArrayStringByte,Memoryregions[i].MemorySize,actualread) then continue;
      if actualread>helpStringLength then
      begin
        CharToFind:=1;
        TempSize:=actualread;
        for j:=0 to TempSize-1 do
        begin
          if chr(ReadMemory_ArrayStringByte[j])=scanvalue[CharToFind] then
          begin
            inc(charToFind);
            if CharToFind>=Dword(helpStringLength)+1 then //found the string
            begin
            inc(AttachedNum);
            tempAddress:=(MemoryRegions[i].BaseAddress)+j-(helpStringLength-1);
            AddressmemStream.WriteBuffer(tempAddress,Sizeof(tempAddress));
            CharToFind:=1;
            end;
          end else CharToFind:=1;
        end;
      end;
        inc(NowProcess,MemoryRegions[i].MemorySize);
    end;
    NowProcess:=totalProcess;
    time2:=getTickCount;
      CanUpdateTask:=messageBox(Application.handle,
                 pchar(Format(String_TaskResult,[name,AttachedNum,(Time2-Time1)/1000])),                 //pchar('任务:'+name+#13#10+'总共找到'+intToStr(AttachedNum)+'个结果 耗时'+FloattoStr((Time2-Time1)/1000)+'秒'),
                 pchar(String_TaskResultTitle),
                 MB_OK);
end;

///低阶扫描初始化(存放的是地址范围，以后存放具体地址)////////////
//if (scantype<>Number_scan) and (scantype<>String_scan) then
if (VarType=LowLevel_Value) then
begin
   try
   MemoryFileStream:=TFileStream.Create(MemoryFileName,fmCreate or FmShareDenyNone);
   MemoryFileStream.Seek(0,soFrombeginning);
    for i:=0 to memoryregionsindex-1 do
    begin
      TempLength:=MemoryRegions[i].MemorySize;
      TempSize:=TempLength;
      if not readprocessmemory(processhandle,pointer(Memoryregions[i].BaseAddress),@AdvancedReadMemory_ArrayByte,TempLength,actualread) then continue;
      if actualread>0 then
      begin
      ActualWrite:=MemoryFileStream.Write(AdvancedReadMemory_ArrayByte,actualread);
      Memoryregions[i].MemorySize:=ActualWrite;
      AdvancedAddressMemStream.WriteBuffer(Memoryregions[i],Sizeof(Memoryregions[i]));
      end;
        inc(NowProcess,MemoryRegions[i].MemorySize);
    end;
      NowProcess:=totalProcess;
      CanUpdateTask:=messageBox(Application.handle,
                 pchar(format(String_InitialLowLevel,[name])),
                 pchar(String_TaskResultTitle),
                 MB_OK);

    finally
      FreeAndNil(MemoryFileStream);
    end;
end;

InSearchProcess:=False;
closehandle(ProcessHandle);
end;//with scan end;

end;
//////////////////////////////////////////////////////////////////////////////////////////


constructor TNextScanThread.Create(theIndex:integer);
begin
TheTaskIndex:=theIndex;
FreeOnTerminate:=True;
inherited Create(False);
end;


///////////////////第二次三次..的扫描///////////////////////////////////////////////////////////////
Procedure TNextScanThread.Execute;
var TempLength: DWORD;
    TempAddress:Dword;
    ReadMemory_Byte:Byte;
    ReadMemory_Word:Word;
    ReadMemory_DWord:Dword;
    ReadMemory_Int64:Int64;
    ReadMemory_SingleDword:Dword; //single length is same to dowrd
    ReadMemory_DoubleInt64:int64; //Double length is same to int64
    AdvancedReadMemory_Byte:Byte;
    AdvancedReadFile_Byte:Byte;
    AdvancedReadMemory_ArrayByte:Array[0..$FFFF] of Byte;
    AdvancedReadFile_ArrayByte:Array[0..$FFFF] of Byte;
    
    PhelpSingleDword:^Dword;
    helpsingleDWord1:DWord;  //存放原数的符号位与指数位
    HelpSingleDword2:Dword;

    PhelpDoubleint64:^int64;
    helpDoubleint641:int64;  //存放原数的符号位与指数位
    HelpDoubleint642:int64;
    
    ReadMemory_ArrayStringByte:Array[0..$FF] of Byte;
    HelpStringLength:Byte;
    chartoFind:integer;

    Time1:Dword;
    Time2:Dword;

    i: integer;
    j: integer;
    k: integer;
    ActualRead:Dword;

    ByteValue: Byte;
    WordValue: Word;
    DWordValue: Dword;
    Int64Value: Int64;
    SingleValue: Single;
    doubleValue: double;
    
    AddressMemStreamNew:TmemoryStream;         //新的每一个地址
    TempSize:DWORD;
    TempMemoryRegion:TmemoryRegion;
    MemoryFileStream:TFileStream;              ///低阶内存Readto memroyFilename
    MemoryFileStreamNew:TFileStream;           ////阶内存Readto memroyFilename
    actualwrite:Dword;
begin
with theTask[theTaskIndex] do
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
  INC(SearchTimes);
  NowProcess:=0;
  AttachedNum:=0;
  OldScanType:=ScanType;
  OldVarType:=VarType;
  AddressMemStream.Seek(0,soFromBeginning);
  AddressMemStreamNew:=TmemoryStream.Create;
/////////NextScan真正开始!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////////
////////////////////////////////////////////////////////////
if (scanType=number_Scan) then
begin
     time1:=getTickCount;
     ////初始化
     TempLength:=AddressMemStream.Size;
     TempSize:=TempLength shr 2;
   ///按类型搜索
  if vartype=Byte_value then  //byte
    begin
      for i:=1 to TempSize do
      begin
        AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
        if not ReadProcessMemory(ProcessHandle,pointer(TempAddress),@ReadMemory_Byte,1,actualread) then continue;
          if (actualread>0) and (ReadMemory_Byte=ByteValue)then
            begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
            end;
        inc(NowProcess);
      end;
    end;     //byte end
 
  if vartype=Word_value then  //Word
    begin
      for i:=1 to TempSize do
      begin
        AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
        if not ReadProcessMemory(ProcessHandle,pointer(TempAddress),@ReadMemory_Word,2,actualread)then continue;
          if (actualread>0) and (ReadMemory_Word=WordValue)then
            begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
            end;
        inc(NowProcess);
      end;
    end;  //word end

    
  if vartype=DWord_value then  //DWord
    begin
      for i:=1 to TempSize do
      begin
        AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
        if not ReadProcessMemory(ProcessHandle,pointer(TempAddress),@ReadMemory_DWord,4,actualread) then continue;
          if (actualread>0) and (ReadMemory_DWord=DWordValue)then
            begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
            end;
        inc(NowProcess);
      end;
    end;    //dword end

  if vartype=int64_value then  //int64
    begin
      for i:=1 to TempSize do
      begin
        AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
        if not ReadProcessMemory(ProcessHandle,pointer(TempAddress),@ReadMemory_int64,8,actualread) then continue;
          if (actualread>0) and (ReadMemory_int64=int64Value)then
            begin
              inc(AttachedNum);
              AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
            end;
        inc(NowProcess);
      end;
    end;   //int64 end

   if vartype=Single_value then //Single
   begin
      PHelpSingleDword:=@singlevalue;
      HelpSingleDword1:=(PHelpSingleDword^ shr 23);
      for i:=1 to TempSize do
      begin
        AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
        if not ReadProcessMemory(ProcessHandle,pointer(TempAddress),@ReadMemory_SingleDword,4,actualread)then continue;
          if actualread>0 then
          begin
               ///single的1位符号位与8位指数为相同
                 HelpsingleDWord2:=ReadMemory_singleDword shr 23;
                 if helpsingleDWord2=helpsingleDWord1 then
                 begin
                 inc(AttachedNum);
                 AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
                 end;
           inc(NowProcess);
          end;
        end;  //for all loop
    end;  //single end

   if vartype=Double_value then //Double
   begin
      PHelpDoubleInt64:=@Doublevalue;
      HelpDoubleint641:=(PHelpDoubleInt64^ shr 52);
      for i:=1 to TempSize do
      begin
        AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
        if not ReadProcessMemory(ProcessHandle,pointer(TempAddress),@ReadMemory_DoubleInt64,8,actualread)then continue;
          if actualread>0 then
          begin
               ///Double的1位符号位与11位指数为相同
                 HelpDoubleint642:=ReadMemory_DoubleInt64 shr 52;
                 if HelpDoubleint642=HelpDoubleint641 then
                 begin
                 inc(AttachedNum);
                 AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
                 end;
           inc(NowProcess);
          end;
        end;  //for all loop
    end;   ///double end
    
    AddressMemStream.Clear;
    AddressMemStream.CopyFrom(AddressMemStreamNew,0);
    NowProcess:=totalProcess;
      time2:=getTickCount;
      CanUpdateTask:=messageBox(Application.handle,
                 pchar(Format(String_TaskResult,[name,AttachedNum,(Time2-Time1)/1000])),
                 pchar(String_TaskResultTitle),
                 MB_OK);
end; //Number_Scan end

//text String scan
if scantype=string_scan then
  begin
     time1:=getTickCount;
     ////初始化
    TempLength:=AddressMemStream.Size;
    TempSize:=TempLength shr 2;
      
    
    helpStringLength:=length(scanvalue);
    for i:=1 to TempSize do
    begin
      AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
      if not readprocessmemory(processhandle,pointer(TempAddress),@ReadMemory_ArrayStringByte,helpStringLength,actualread)then continue;
      if actualread>0 then
      begin
        CharToFind:=1;
        for j:=0 to actualread-1 do
        begin
          if chr(ReadMemory_ArrayStringByte[j])=scanvalue[CharToFind] then
          begin
            inc(charToFind);
            if CharToFind=Dword(helpStringLength)+1 then //found the string
            begin
            inc(AttachedNum);
            AddressMemStreamNew.WriteBuffer(tempAddress,Sizeof(tempAddress));
            CharToFind:=1;
            end;
          end else CharToFind:=1;
        end;
      end;
          inc(NowProcess);
    end;
    NowProcess:=totalProcess;
    time2:=getTickCount;
      CanUpdateTask:=messageBox(Application.handle,
                 pchar(Format(String_TaskResult,[name,AttachedNum,(Time2-Time1)/1000])),
                 pchar(String_TaskResultTitle),
                 MB_OK);

    AddressMemStream.Clear;
    AddressMemStream.CopyFrom(AddressMemStreamNew,0);
end;

/////第二三..次低阶扫描低阶扫描(初始化存放的是地址范围，以后存放具体地址)/////////////////////////////////////////
///if (scantype<>number_scan) and (scantype<>String_Scan)and (scantype<>InitialLowLevel_Scan) then
if VarType=LowLevel_value then
begin
         ////初始化
    if (SearchTimes=2) then
    begin
     TempLength:=AdvancedAddressMemStream.Size;
     TempSize:=TempLength shr 3;  ////Dword  Address Dword Size
    end else
    begin
     TempLength:=AddressMemStream.Size;
     TempSize:=TempLength shr 2;
    end;
    
   MemoryFileStream:=TFileStream.Create(memoryFilename,fmOpenReadWrite or fmShareDenyNone);
   MemoryFileStream.Seek(0,soFrombeginning);

   MemoryFileStreamNew:=TFileStream.Create(memoryFilenameNew,fmCreate or fmOpenReadWrite or fmShareDenyNone);
   MemoryFileStreamNew.Seek(0,soFrombeginning);



if SearchTimes=2 then
begin
   time1:=GetTickCount;
   AddressMemStream.Clear;
   AdvancedAddressMemStream.Seek(0,soFromBeginning);
   
    For i:=1 to TempSize do
     begin
      AdvancedAddressMemStream.ReadBuffer(TempMemoryRegion,8);
      if not Readprocessmemory(processhandle,pointer(TempMemoryRegion.BaseAddress),@AdvancedReadMemory_ArrayByte,TempMemoryRegion.MemorySize,actualread) then continue;
      MemoryFileStream.Read(AdvancedReadFile_ArrayByte,TempMemoryRegion.MemorySize);

       For j:=0 to TempMemoryRegion.MemorySize-1 do
       begin
       Application.ProcessMessages;
       //////_+++++//////////////////////////
       if scantype=Increased_Scan then
       begin
          if  AdvancedReadMemory_ArrayByte[j]>AdvancedReadFile_ArrayByte[j] then
          begin
            TempAddress:=TempMemoryRegion.BaseAddress+j;
            AddressMemStream.WriteBuffer(TempAddress,Sizeof(TempAddress));
            MemoryFileStreamNew.WriteBuffer(AdvancedReadMemory_ArrayByte[j],1);
            inc(AttachedNum);
          end;
       Continue;
       end;
       /////////////////////////////////////
              //////--------//////////////////////////
       if scantype=Decreased_Scan then
       begin
          if  AdvancedReadMemory_ArrayByte[j]<AdvancedReadFile_ArrayByte[j] then
          begin
            TempAddress:=TempMemoryRegion.BaseAddress+j;
            AddressMemStream.WriteBuffer(TempAddress,Sizeof(TempAddress));
            MemoryFileStreamNew.WriteBuffer(AdvancedReadMemory_ArrayByte[j],1);
            inc(AttachedNum);
          end;
        Continue;
       end;
       /////////////////////////////////////
              //////!!!!!!!!!!!!//////////////////////////
       if scantype=Changed_Scan then
       begin
          if  AdvancedReadMemory_ArrayByte[j]<>AdvancedReadFile_ArrayByte[j] then
          begin
            TempAddress:=TempMemoryRegion.BaseAddress+j;
            AddressMemStream.WriteBuffer(TempAddress,Sizeof(TempAddress));
            MemoryFileStreamNew.WriteBuffer(AdvancedReadMemory_ArrayByte[j],1);
            inc(AttachedNum);
          end;
        Continue;
       end;
       /////////////////////////////////////
              //////============//////////////////////////
       if scantype=UnChanged_Scan then
       begin
          if  AdvancedReadMemory_ArrayByte[j]=AdvancedReadFile_ArrayByte[j] then
          begin
            TempAddress:=TempMemoryRegion.BaseAddress+j;
            AddressMemStream.WriteBuffer(TempAddress,Sizeof(TempAddress));
            MemoryFileStreamNew.WriteBuffer(AdvancedReadMemory_ArrayByte[j],1);
            inc(AttachedNum);
          end;
        Continue;
       end;

      end;///for end
       ////////////////////////////////////
       inc(NowProcess);
     end; ///大循环
     NowProcess:=totalProcess;
     Time2:=getTickCount;
     CanUpdateTask:=messageBox(Application.handle,
                 pchar(Format(String_TaskResult,[name,AttachedNum,(Time2-Time1)/1000])),
                 pchar(String_TaskResultTitle),
                 MB_OK);
end else  ///searchtimes=2
begin
 Time1:=GetTickCount;
 for i:=0 to TempSize-1 do
 begin
    Application.ProcessMessages;
    AddressMemStream.ReadBuffer(TempAddress,Sizeof(TempAddress));
    if not ReadProcessMemory(ProcessHandle,pointer(TempAddress),@AdvancedReadMemory_Byte,1,actualread) then continue;
    MemoryFileStream.Read(AdvancedReadFile_Byte,1);
   //////_+++++//////////////////////////
       if scantype=Increased_Scan then
       begin
          if  AdvancedReadMemory_Byte>AdvancedReadFile_Byte then
          begin
            AddressMemStreamNew.WriteBuffer(TempAddress,Sizeof(TempAddress));
            MemoryFileStreamNew.WriteBuffer(AdvancedReadMemory_Byte,1);
            inc(AttachedNum);
          end;
       Continue;
       end;
   //////------//////////////////////////
       if scantype=Decreased_Scan then
       begin
          if  AdvancedReadMemory_Byte<AdvancedReadFile_Byte then
          begin
            AddressMemStreamNew.WriteBuffer(TempAddress,Sizeof(TempAddress));
            MemoryFileStreamNew.WriteBuffer(AdvancedReadMemory_Byte,1);
            inc(AttachedNum);
          end;
       Continue;
       end;
   //////!!!!!!!!!!!!!!//////////////////////////
       if scantype=Changed_Scan then
       begin
          if  AdvancedReadMemory_Byte<>AdvancedReadFile_Byte then
          begin
            AddressMemStreamNew.WriteBuffer(TempAddress,Sizeof(TempAddress));
            MemoryFileStreamNew.WriteBuffer(AdvancedReadMemory_Byte,1);
            inc(AttachedNum);
          end;
       Continue;
       end;
   /////==============///////////////////////
       if scantype=UnChanged_Scan then
       begin
          if  AdvancedReadMemory_Byte=AdvancedReadFile_Byte then
          begin
            AddressMemStreamNew.WriteBuffer(TempAddress,Sizeof(TempAddress));
            MemoryFileStreamNew.WriteBuffer(AdvancedReadMemory_Byte,1);
            inc(AttachedNum);
          end;
       Continue;
       end;

 end;//for end
 NowProcess:=totalProcess;
 Time2:=GetTickCount;
 CanUpdateTask:=MessageBox(Application.handle,
            pchar(Format(String_TaskResult,[name,AttachedNum,(Time2-Time1)/1000])),
            pchar(String_TaskResultTitle),
            MB_OK);
 AddressMemStream.Clear;
 AddressMemStream.CopyFrom(AddressMemStreamNew,0);

end;   //esle end

   CopyFile(pchar(MemoryFileNameNew),pchar(MemoryFileName),FALSE);
   FreeAndNIl(MemoryFileStream);
   FreeAndNIl(MemoryFileStreamNew);
   
end; ////if VarType=LowLevel_value

FreeAndNil(AddressMemStreamNew);
closehandle(ProcessHandle);
InSearchProcess:=False;
end;//with scan end;

end;







//////读取某一进程256字节的指定内容///////////////////////////////////////////////////////
Function ReadMemory_Array(theProcessID,StartAddress:DWORD):boolean;
var k:integer;
    thehandle:Thandle;
    ReadByte:Byte;
    ActualRead:Dword;
begin
Result:=True;
thehandle:=OpenProcess(PROCESS_ALL_ACCESS,False,theProcessID);
if thehandle<>0 then
begin

for k:=1 to 256 do
begin
MemReadData[k]:=-999; /// mean error
ActualRead:=0;
  if ReadProcessMemory(theHandle,Pointer((StartAddress+k-1)),Addr(ReadByte),1,Actualread)then
  begin
    if  (Actualread=1) then  MemReadData[k]:=ReadByte;
  end ;
end;

end else Result:=False;
Closehandle(thehandle);
end;
/////////////////////////////////////////////////////
Function ReadMemory(theProcessID,StartAddress:Dword;ValueAddressPointer:Pointer;ValueType:Integer):boolean;
var thehandle:Thandle;
    ActualRead:Dword;
    ValueLen:integer;
begin
Result:=True;
case ValueType of
Byte_value:ValueLen:=1;
Word_value:ValueLen:=2;
Dword_value:ValueLen:=4;
Int64_value:ValueLen:=8;
Single_value:ValueLen:=4;
Double_value:ValueLen:=8;
String_Value:ValueLen:=16;
else ValueLen:=1;
end;   ///case end;

thehandle:=OpenProcess(PROCESS_ALL_ACCESS,False,theProcessID);
if thehandle<>0 then
begin
Result:=ReadProcessMemory(theHandle,Pointer(StartAddress),ValueAddressPointer,ValueLen,Actualread);
//if Actualread<>ValueLen then MemReadByte:=0; /// mean error
end else Result:=False;
Closehandle(thehandle);

end;

////////////写内存////////////////////////////////////////////////

Function WriteMemory(theProcessID,StartAddress:Dword;ValueAddressPointer:Pointer;ValueType,ValueLen:Integer):boolean;
var thehandle:Thandle;
    ActualWrite:Dword;
begin
Result:=True;
{
case ValueType of
Byte_value:ValueLen:=1;
Word_value:ValueLen:=2;
Dword_value:ValueLen:=4;
Int64_value:ValueLen:=8;
Single_value:ValueLen:=4;
Double_value:ValueLen:=8;
String_Value:ValueLen:=16;
else ValueLen:=1;
end;   ///case end;
 }
thehandle:=OpenProcess(PROCESS_ALL_ACCESS,False,theProcessID);
if thehandle<>0 then
begin
WriteProcessMemory(theHandle,Pointer(StartAddress),ValueAddressPointer,ValueLen,ActualWrite);
if ActualWrite<>ValueLen then Result:=False; /// mean error
end else Result:=False;
Closehandle(thehandle);

end;
////////////////////////////////////////////////////////////



///////////////////////////////////////////////////




end.
