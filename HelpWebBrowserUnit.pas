{

name:(1999.12.1 -jhx1)
			½­ºþÐÐ II jhx2 
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
unit HelpWebBrowserUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,childFormUnit, OleCtrls, SHDocVw, ComCtrls, ToolWin, ImgList,shellapi;

type
  THelpWebBrowserForm = class(TChildForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    WebBrowser1: TWebBrowser;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HelpWebBrowserForm: THelpWebBrowserForm;

implementation

uses RegisterUnit,MainUnit;

{$R *.dfm}

procedure THelpWebBrowserForm.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
 TabSheet1.Caption:=URL;

end;

procedure THelpWebBrowserForm.ToolButton4Click(Sender: TObject);
begin
RegisterForm:=TregisterForm.Create(self);
RegisterForm.ShowModal;
FreeandNil(RegisterForm);

end;

procedure THelpWebBrowserForm.ToolButton1Click(Sender: TObject);
var theAdd:OleVariant;
begin

theAdd:='mk:@MSITStore:'+Apppath+'GPHelp.chm::/index.html';
///ms-its:C:\i386\CALC.CHM::/calc_scientific.htm
HelpWebBrowserForm.WebBrowser1.Navigate2(theAdd);

end;

procedure THelpWebBrowserForm.ToolButton2Click(Sender: TObject);
begin
shellexecute(application.Handle,
             pchar('open'),
             pchar('http://www.AdvNetsoft.com'),
             nil,
             nil,
             SW_SHOWNORMAL);

end;

procedure THelpWebBrowserForm.ToolButton3Click(Sender: TObject);
begin
shellexecute(application.Handle,
             pchar('open'),
             pchar('mailto:support@AdvNetsoft.com'),
             nil,
             nil,
             SW_SHOWNORMAL);

end;

end.
