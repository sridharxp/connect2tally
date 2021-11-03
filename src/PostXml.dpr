(*
Copyright (C) 2013, Sridharan S

This file is part of Tally Connector.

Tally Connector is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Tally Connector is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License version 3
along with Integration Tools for Tally. If not, see <http://www.gnu.org/licenses/>.
*)
program PostXml;

uses
//  FastMM4 in '..\..\dl\FastMM4991\FastMM4.pas',
//  FastMM4Messages in '..\..\dl\FastMM4991\FastMM4Messages.pas',
  Forms,
  MemoXml in 'MemoXml.pas' {postxmlfrm},
  bjXml3_1 in '..\..\DL\bjxml\bjxml3_1.pas',
  Client in '..\..\DL\Tool\DLL\Client.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tpostxmlfrm, postxmlfrm);
  Application.Run;
end.
