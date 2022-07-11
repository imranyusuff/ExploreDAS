function pushbutton_reorderReflectorPoints_Callback(~, ~)

% ***********************************************************************************************************
%  pushbutton_reorderReflectorPoints_Callback - this function reorders the points in a reflector
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

global XDAS

goGreen = [.81 .97 .71];
stopRed = [1 .7 .7];

set(XDAS.h.reflector.pushbutton_reorder,'BackgroundColor',goGreen)
drawnow

if XDAS.obj.reflectors.nsegments > 0
    
    % get the current reflector to edit
    selectedReflector = get(XDAS.h.reflector.listbox_reflectors,'value');
    
    XDAS.obj.reflectors.segments(selectedReflector).reorderPoints();
    
    plotAllPoints
    
end

set(XDAS.h.reflector.pushbutton_reorder,'BackgroundColor',stopRed)
drawnow

