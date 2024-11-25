function menuSetDataDirectory_Callback(hObject, eventdata)

% ***********************************************************************************************************
%  menuSetDataDirectory_Callback - this function sets the data directory for the project
% ***********************************************************************************************************
%
% MIT License
% 
% Copyright (c) 2022 Mark E. Willis
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%
% ***********************************************************************************************************


global CM
global XDAS

% *************************************************************************
% ask the user for a directory to put all of the exported shot data then export them
% *************************************************************************

dirDefault = pwd;

[path] = uigetdir(dirDefault,'Select Folder Name for Saving/Retreiving Shots');
if isequal(path,0)
   return
end

CM.paths.data = path;

set(XDAS.h.figure1, 'Name', [XDAS.releaseTitle 'Data Dir: ' CM.paths.data]);

set(XDAS.h.menu_setDataDirectory, 'Checked', 'on');

drawnow
