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
unit GetProcessIDUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,TlHelp32, ImgList, ExtCtrls, Buttons;
resourcestring
String_processInvalid='不能加入选择的进程/应用程序.'#13#10+
            '1.这是一个系统关键进程,请选择其他的进程;'#13#10+
            '2.不存在,点击<刷新> 按钮，重新选择.';
String_processInvalidTitle='Unreachable process information';
type
  TProcessListForm = class(TForm)
    ListPageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListView2: TListView;
    ImageListhead: TImageList;
    Panel1: TPanel;
    SelectOK_Bn: TButton;
    Close_Bn: TButton;
    Refresh_BN: TButton;
    ListView1: TListView;
    ImageList2: TImageList;
    ImageList1: TImageList;
    CloseAfterChoose_cb: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    procedure ListViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure Refresh_BNClick(Sender: TObject);
    procedure Close_BnClick(Sender: TObject);
    procedure SelectOK_BnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView2SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProcessListForm: TProcessListForm;
var   UpDown: array [0..1] of Boolean;

implementation
uses GPkernel, MainUnit;

{$R *.dfm}


function CustomSortProc(Item1, Item2: TListItem; ParamSort: integer):int64; stdcall;
var ecode:integer;
    Temp1,temp2:Cardinal;
begin
  Result:=0;
  case ParamSort of
    0:
    begin
      if UpDown[0] = True then
        Result := CompareText(Item1.Caption,Item2.Caption)
      else
        Result := -CompareText(Item1.Caption,Item2.Caption)
    end;
    1:
    begin
     val(Item1.SubItems[0],Temp1,Ecode);
     val(Item2.SubItems[0],Temp2,Ecode);
      if UpDown[1] = True then
        Result := temp1-temp2
      else
        Result := -(temp1-temp2);

    end;
  end;
end;

procedure TProcessListForm.ListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
if Sender is TListView then
begin
(Sender as TListView).CustomSort(@CustomSortProc,Column.Index);

  //升序
  if UpDown[Column.Index] = True then
    Column.ImageIndex :=0  //Clolumn图标2
  else
  //降序
    Column.ImageIndex :=1; //Clolumn图标2
  UpDown[Column.Index] := not UpDown[Column.Index];
end;
end;

procedure TProcessListForm.Refresh_BNClick(Sender: TObject);
begin
GPKernel.GetWindowList(Listview1,ImageList1,ImageListhead);
GPKernel.GetProcessList(Listview2,ImageList2,ImageListhead);
end;

procedure TProcessListForm.Close_BnClick(Sender: TObject);
begin
Close;
end;

procedure TProcessListForm.SelectOK_BnClick(Sender: TObject);
var  taskName:String;
     i:integer;
     TempHandle:Thandle;
     TempID:Dword;
     Ecode:integer;
begin
TempID:=0;
case ListPageControl.ActivePageIndex  of
0:if ListView1.Selected<>nil then
  begin
  Val(ListView1.Selected.SubItems[0],TempID,Ecode);
  end;
1:if ListView2.Selected<>nil then
  begin
  Val(ListView2.Selected.SubItems[0],TempID,Ecode);
  end;
end;
 taskname:=Edit1.text;
  TempHandle:=OpenProcess(PROCESS_ALL_ACCESS,False,tempID);
  if Temphandle>0 then
  begin
   if TaskNum>=MaxTaskNum then
   begin
    showmessage(Format(String_Maxtask,[MaxTaskNum]));
    Exit;
    Close;
   end;
   
    /////查找空余任务//////////////
   for i:=1 to MaxTaskNum do  if theTask[i].Applyed=False then   Break;

   INC(TaskNum); 
   GPKernel.InittheTask(i);
   TheTask[i].Applyed:=True;
   ListToTaskindex[TaskNum]:=i;

   
   
   With Thetask[i] do
   begin
   TheTask[i].Name:=taskName;
   TheTask[i].Index:=i;
   TheTask[i].ProcessID:=TempID;
   TheTask[i].ProcessHandle:=TempHandle; ///ProcessHandle actual is no used
   TheTask[i].MemoryFileName:=AppPath+'temp\Memory'+intToStr(i)+'.TMP1';
   TheTask[i].MemoryFileNameNew:=AppPath+'temp\Memory'+intToStr(i)+'.TMP2';
   end;
   
   CurrentTaskIndex:=TheTask[i].index;
   CurrentProcessID:=TheTask[i].ProcessID;

   mainForm.AddTasktoList(i);
   mainForm.UpdateTaskInfo(i);
   MainForm.VarType_cb.ItemIndex:=theTask[i].OldVarType;
   MainForm.AddFoundToListView(i);

   if CloseAfterChoose_cb.Checked then Close;
  end else
  begin
  Messagebox(handle,
             pchar(String_processInvalid),
             pchar(String_processInvalidTitle),
             MB_OK or MB_ICONINFORMATION	);
  end;
closehandle(Temphandle);
end;

procedure TProcessListForm.FormCreate(Sender: TObject);
begin
ListPageControl.ActivePageIndex:=0;
GPKernel.GetWindowList(Listview1,ImageList1,Imagelisthead);
GPKernel.GetProcessList(Listview2,ImageList2,Imagelisthead);

end;

procedure TProcessListForm.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
 Edit1.Text:=pchar(Item.Caption);
end;

procedure TProcessListForm.ListView2SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
Edit1.Text:=pchar(Item.Caption);
end;

end.
