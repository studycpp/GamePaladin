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
unit AddFileTaskUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;
resourcestring
string_NotExists='%s 不存在.';
string_cannotopen='不能够打开文件 %s,请检查.';
String_InvalidFile='%s 不是一个有效的存档文件(0<文件尺寸<67108864(64M) 字节,请检查.';
String_FileMaxtask='最多加入 %d 个文件任务,请删除部分无用的任务.';
type
  TAddFileTaskForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    OK_sb: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure OK_sbClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddFileTaskForm: TAddFileTaskForm;

implementation

uses archiveEditUnit;
{$R *.dfm}


procedure TAddFileTaskForm.SpeedButton1Click(Sender: TObject);
begin
if openDialog1.Execute then
 begin
  if ArchiveEditForm.checkAndGetFileSize(openDialog1.FileName)=0 then  exit;
  edit1.Text:=ExtractFileName(openDialog1.FileName);
  edit2.Text:=openDialog1.FileName;
 end;
end;

procedure TAddFileTaskForm.OK_sbClick(Sender: TObject);
var I:integer;
begin
   if FileTaskNum>=Max_FileTaskNum then
   begin
    showmessage(Format(String_FileMaxtask,[Max_FileTaskNum]));
    Exit;
    Close;
   end;

   if ArchiveEditForm.checkAndGetFileSize(edit2.text)=0  then  exit;

   
    /////查找空余任务//////////////
   for i:=1 to Max_FileTaskNum do  if theFileTask[i].Applyed=False then   Break;

   INC(FileTaskNum); 
   ArchiveEditForm.InitFileTask(i);
   TheFileTask[i].Applyed:=True;
   ListToFileTaskindex[FileTaskNum]:=i;

   

   With TheFiletask[i] do
   begin
   TheFiletask[i].name:=edit1.text;
   TheFileTask[i].Index:=i;
   TheFiletask[i].FilepathName:=edit2.text;
   TheFiletask[i].SaveFileName:=ExtractFilepath(paramStr(0))+'temp\File'+intToStr(i)+'.TMP1';
   end;

   CurrentFileTaskIndex:=TheFileTask[i].Index;
   ArchiveEditForm.AddTasktoList(i);
   ArchiveEditForm.UpdateTaskInfo(i);
   close;

end;

procedure TAddFileTaskForm.SpeedButton2Click(Sender: TObject);
begin
close;
end;

end.
