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
unit RegisterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Registry, ComCtrls,shellapi, ExtCtrls;
{
Resourcestring
String_InvalidName='Register Name must have 4 character at least.';
String_Restartcheck='Please restart GamePaladin or reopen About Dialog for verify registration.';
String_havereg='This software is registered to: %s';
String_Expired='Expired! Please visiter www.AdvNetsoft.com to Register!';
String_limited='Remained days: %d .';
 }
type
  TRegisterForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    author_lb: TLabel;
    myweb_lb: TLabel;
    Close_bn: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    procedure Register_bnClick(Sender: TObject);
    procedure Close_bnClick(Sender: TObject);
    procedure Tryit_bnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure myweb_lbClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterForm: TRegisterForm;
  RealReg:Boolean;
  Expired:Boolean;
implementation

uses MainUnit;
{$R *.dfm}



procedure TRegisterForm.Register_bnClick(Sender: TObject);
{var Reg:TRegistry;
    RegName:String;
    RegCode:string;  }
begin
{
RegName:=Edit1.Text;
RegCode:=Edit2.Text;
if Length(RegName)<4 then
 begin
  showmessage(String_InvalidName);
  exit;
 end;
Reg:=TRegistry.Create;
Reg.Rootkey:=HKEY_LOCAL_MACHINE;
if Reg.OpenKey('SOFTWARE\XGQsoft\GamePaladin\',true) then
begin
Reg.WriteString('Registration Name',RegName);
Reg.WriteString('Registration Code',RegCode);
end;
Reg.Free;
showmessage(String_Restartcheck);
close;
}
end;

procedure TRegisterForm.Close_bnClick(Sender: TObject);
begin
//if Expired then Application.Terminate;
close;
end;

procedure TRegisterForm.Tryit_bnClick(Sender: TObject);
begin
//close;
end;

procedure TRegisterForm.FormCreate(Sender: TObject);
{var Reg:TRegistry;
    REadRegName:String;
    ReadRegCode:string;
    TrueCode:String;
    NowDate:Integer;
    RegDate:Integer; }
begin
/////////////////
author_lb.Left:=24;
author_lb.Top:=99;
author_lb.Visible:=true;
author_lb.Caption:='作者:XuGanQuan';
myweb_lb.Left:=56;
myweb_lb.Top:=120;
myweb_lb.Visible:=true;
myweb_lb.Caption:='http://www.AdvNetsoft.com';
{
/////////////
RealReg:=False;
Expired:=True;
Reg:=TRegistry.Create;
Reg.Rootkey:=HKEY_LOCAL_MACHINE;
if Reg.OpenKey('SOFTWARE\XGQsoft\GamePaladin\',true) then
begin
ReadRegName:=Reg.ReadString('Registration Name');
ReadRegCode:=Reg.ReadString('Registration Code');
Reg.CloseKey;
end;
if (not MainForm.Nametocode(ReadRegName,TrueCode) ) or
   (ReadRegCode<>TrueCode) then
RealReg:=false else RealReg:=true;


if  RealReg then
begin
Expired:=False;
GroupBox2.Visible:=false;
reg1_lb.Visible:=false;
reg2_lb.Visible:=false;
edit1.Visible:=false;
edit2.Visible:=false;
Tryit_bn.Visible:=false;
Register_bn.Visible:=false;
HaveReg_LB.Caption:=format(String_havereg,[ReadRegName]);
HaveReg_LB.Visible:=true;
GroupBox1.Top:=GroupBox1.Top-60;
//Close_bn.Top:=Close_bn.Top-60;
end else
begin
Expired:=True;
GroupBox2.Visible:=true;
reg1_lb.Visible:=true;
reg2_lb.Visible:=true;
edit1.Visible:=true;
edit2.Visible:=true;
Tryit_bn.Visible:=true;
Register_bn.Visible:=true;
HaveReg_LB.Visible:=false; 
end;

  Reg.Rootkey:= HKEY_LOCAL_MACHINE;
  if (not RealReg) and Reg.OpenKey('SOFTWARE\XGQsoft\GamePaladin\',true) then
  begin
   RegDate:=Strtointdef(Reg.ReadString('Registration Date'),0);
   RegDate:=RegDate xor 790726;
   NowDate:=Trunc(Now);
   ProgressBar1.Position:=ABS(RegDate-NowDate);
    if  ABS(RegDate-Now)>45 then
     begin
     Expired:=True;
     tryit_bn.Visible:=false;
     expired_lb.Caption:=String_expired;
     end else
     begin
     Expired:=False;
     tryit_bn.Visible:=True;
     expired_lb.Caption:=Format(String_limited,[45-ABS(RegDate-NowDate)]);
     end;
    reg.CloseKey;
  end;
Reg.free;
 }
end;

procedure TRegisterForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
Close_bn.Click;
end;

procedure TRegisterForm.myweb_lbClick(Sender: TObject);
begin
 shellexecute(application.Handle,
             pchar('open'),
             pchar('http://www.AdvNetsoft.com'),
             nil,
             nil,
             SW_SHOWNORMAL);
end;

end.
