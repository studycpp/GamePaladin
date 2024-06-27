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
unit CapturePicUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ChildFormUnit, ExtCtrls, StdCtrls, ComCtrls, ToolWin, ImgList,
  ExtDlgs,shellApi,registry;
resourcestring
String_CannotMkdir='不能创建目录:<%s>.';


type
  TCapturePicForm = class(TChildForm)
    Panel2: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Cappic_save: TToolButton;
    cappic_edit: TToolButton;
    ScrollBox1: TScrollBox;
    cappicImageList: TImageList;
    SavePictureDialog1: TSavePictureDialog;
    Panel1: TPanel;
    Image1: TImage;
    Clear_tb: TToolButton;
    Stretch_cb: TCheckBox;
    procedure Cappic_saveClick(Sender: TObject);
    procedure cappic_editClick(Sender: TObject);
    procedure Stretch_cbClick(Sender: TObject);
    procedure Clear_tbClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WMhotkeyhandle(var msg:Tmessage); message wm_hotkey;
  end;

var
  CapturePicForm: TCapturePicForm;
  Picnum:Integer=0;

implementation

uses MainUnit;

{$R *.dfm}
 {
procedure Capture1(bm:Tbitmap);
var   DeskTopDC: HDc;
  DeskTopCanvas: TCanvas;
  DeskTopRect: TRect;
begin
 // DeskTopDC := GetWindowDC(GetDeskTopWindow);
  DeskTopDC := GetDC(0);
  DeskTopCanvas := TCanvas.Create;
  DeskTopCanvas.Handle := DeskTopDC;
  DeskTopRect := Rect(0,0,Screen.Width,Screen.Height);
   with bm do
  begin
    Width := Screen.Width;
    Height:= Screen.Height;
    PixelFormat := pfDevice;
  end;
end;
 }



procedure ScreenShot(x : integer; y : integer; Width : integer; Height : integer; bm : TBitMap);
var
   dc: HDC;
   lpPal : PLOGPALETTE;
begin
{test width and height}
if ((Width = 0) OR (Height = 0)) then exit;

bm.Width := Width;
bm.Height := Height;
{get the screen dc}
dc := GetDc(0);
if (dc = 0) then exit;

{do we have a palette device?}
if (GetDeviceCaps(dc, RASTERCAPS) AND RC_PALETTE = RC_PALETTE) then begin
   {allocate memory for a logical palette}
   GetMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
   {zero it out to be neat}
   FillChar(lpPal^, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)), #0);
   {fill in the palette version}
   lpPal^.palVersion := $300;
   {grab the system palette entries}
   lpPal^.palNumEntries := GetSystemPaletteEntries(dc, 0, 256, lpPal^.palPalEntry);
   if (lpPal^.PalNumEntries <> 0) then begin
       {create the palette}
       bm.Palette := CreatePalette(lpPal^);
   end;
   FreeMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
end;

{copy from the screen to the bitmap}
BitBlt(bm.Canvas.Handle, 0, 0, Width ,Height, Dc, x, y, SRCCOPY);
{release the screen dc}
ReleaseDc(0, dc);
end;

procedure TCapturePicForm.Wmhotkeyhandle(var msg:Tmessage);
var
  Bitmap: TBitmap;
  I:integer;
begin
 if (msg.LParamHi=GPOptions.CaptureHotKey_value) and (msg.lparamLo=GPOptions.CaptureHotKey_mode) then
 begin
  msg.Result:=1; //该消息已经处理
  Bitmap := TBitmap.Create;

 begin
 Bitmap.Width := Screen.Width;
 Bitmap.Height := Screen.Height;
 //Capture1(Bitmap);
 ScreenShot(0,0,Bitmap.Width, Bitmap.Height, Bitmap);
 End;


  //how to use
  case GPOptions.CaptureSaveMode of
  1:begin
    if SavePictureDialog1.Execute then
     Bitmap.SaveToFile (SavePictureDialog1.FileName);
    end;
  2:begin
    if not DirectoryExists(GPOptions.CaptureSavePath) then
       begin
       if not Createdir(GPOptions.CaptureSavePath) then
          begin
          MainForm.SetOptions_tb.Down:=true;
          MainForm.SetOptions_tb.Click;
          MainForm.Options_PageControl.ActivePageIndex:=1;
          MainForm.CaptureSavepath_Edit.SetFocus;
          showmessage(Format(String_CannotMkdir,[GPOptions.CaptureSavePath]));
          end;
       end;
    for i:=0 to 10000 do
    begin
     if FileExists(GPOptions.CaptureSavePath+intToHex(PicNum,2)+'.bmp') then
      inc(PicNum);
    end;
    Bitmap.SaveToFile (GPOptions.CaptureSavePath+intToHex(PicNum,2)+'.bmp');
    end;
  3:begin
      Image1.Picture.Assign(Bitmap);
      Panel1.Align:=alNone;
      Panel1.Width:=Bitmap.width;
      Panel1.Height:=Bitmap.Height;
      Image1.Stretch:=Stretch_cb.Checked;
      if Stretch_cb.Checked then
       Panel1.Align:=alClient else
         begin
         Panel1.Align:=alNone;
         Panel1.Width:=Image1.Picture.Width;
         Panel1.Height:=Image1.picture.Height;
         end;
      
    end;

  end; //case end;
  
  Bitmap.Free;
  end;
end;


procedure TCapturePicForm.Cappic_saveClick(Sender: TObject);
begin
if Image1.Picture=nil then exit;
if SavePictureDialog1.Execute then
Image1.Picture.SaveToFile(SavePictureDialog1.FileName);

end;

procedure TCapturePicForm.cappic_editClick(Sender: TObject);
begin
Image1.Picture.SaveToFile(Apppath+'temp\temp.bmp');
ShellExecute(Application.Handle,pchar('Edit'),
              pchar(Apppath+'temp\temp.bmp'),
              pchar(Apppath+'temp\'),
              nil,
              SW_SHOW);

end;

procedure TCapturePicForm.Stretch_cbClick(Sender: TObject);
begin

Image1.Stretch:=Stretch_cb.Checked;
if Stretch_cb.Checked then 
 Panel1.Align:=alClient else
 begin
  Panel1.Align:=alNone;
   Panel1.Width:=Image1.Picture.Width;
  Panel1.Height:=Image1.picture.Height;

 end;
end;

procedure TCapturePicForm.Clear_tbClick(Sender: TObject);
begin
Image1.Picture:=nil;

end;

end.
