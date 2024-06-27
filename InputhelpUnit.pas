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
unit InputhelpUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  StdCtrls;

type
  TInputHelpForm = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InputHelpForm: TInputHelpForm;

implementation

{$R *.dfm}

procedure TInputHelpForm.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
if (key=chr(VK_ESCAPE)) or (key=chr(VK_Return)) then
close;
end;

end.
