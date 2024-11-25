function updateNoiseGUI

% ***********************************************************************************************************
%  updateNoiseGUI - this function updates the noise gui 
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
global CM

goGreen = XDAS.colors.goGreen;
stopRed = XDAS.colors.stopRed;

opticalNoiseColor      = stopRed;
CMNColor               = stopRed;
displayNoiseColor      = stopRed;
removeCMNColor         = stopRed;
useGaugeColor          = stopRed;
polarityColor          = stopRed;
noiseOnlyColor         = stopRed;
firstBreaksColor       = stopRed;

if CM.fiber.ifOpticalNoise
    set(XDAS.h.DAS.pushbutton_addOpticalNoise, 'string', '+ Optical Noise');
    opticalNoiseColor = goGreen;
else
    set(XDAS.h.DAS.pushbutton_addOpticalNoise, 'string', 'No Optical Noise');    
end


if CM.fiber.ifCMN
    CMNColor = goGreen;
    set(XDAS.h.DAS.pushbutton_addCMN, 'string', '+ CMN Noise');
else
    set(XDAS.h.DAS.pushbutton_addCMN, 'string', 'No CMN Noise');
end

if CM.fiber.ifPolarity
    polarityColor = goGreen;
    set(XDAS.h.DAS.pushbutton_polarity, 'string', 'Reversed Polarity');
else
    set(XDAS.h.DAS.pushbutton_polarity, 'string', 'Normal Polarity');
end

if CM.fiber.ifNoiseOnly
    noiseOnlyColor = goGreen;
    set(XDAS.h.DAS.pushbutton_noiseOnly, 'string', 'Noise Only');
else
    set(XDAS.h.DAS.pushbutton_noiseOnly, 'string', 'Sig & Noise');
end

if CM.simulation.ifFirstBreaks
    firstBreaksColor = goGreen;
    set(XDAS.h.simulation.pushbutton_firstBreaks, 'string', 'First Breaks');
else
    set(XDAS.h.simulation.pushbutton_firstBreaks, 'string', 'No First Breaks');
end
    

if CM.fiber.ifremoveCMN
    set(XDAS.h.DAS.pushbutton_removeCMN, 'string', 'Remove CMN');
    removeCMNColor = goGreen;
else
    set(XDAS.h.DAS.pushbutton_removeCMN, 'string', 'Leave in CMN');
end

if CM.fiber.ifGauge
    set(XDAS.h.simulation.pushbutton_useGL, 'string', 'Use Gauge');
    useGaugeColor = goGreen;
else
    set(XDAS.h.simulation.pushbutton_useGL, 'string', 'No Gauge');
end

set(XDAS.h.DAS.pushbutton_addOpticalNoise,  'BackgroundColor',opticalNoiseColor)
set(XDAS.h.DAS.pushbutton_addCMN,           'BackgroundColor',CMNColor)
set(XDAS.h.DAS.pushbutton_displaySourceNum, 'BackgroundColor',displayNoiseColor)
%set(handles.pushbutton_addFading,                      'BackgroundColor',fadingColor)
set(XDAS.h.DAS.pushbutton_removeCMN,        'BackgroundColor',removeCMNColor)
set(XDAS.h.simulation.pushbutton_useGL,     'BackgroundColor',useGaugeColor)
set(XDAS.h.DAS.pushbutton_polarity,         'BackgroundColor',polarityColor)
set(XDAS.h.DAS.pushbutton_noiseOnly,        'BackgroundColor',noiseOnlyColor)
set(XDAS.h.simulation.pushbutton_firstBreaks,      'BackgroundColor',firstBreaksColor)

% set the edit fields to the to default current values
set(XDAS.h.DAS.edit_opticalSNR,    'string',num2str(CM.fiber.opticalNoiseSNR))
set(XDAS.h.DAS.edit_CMNSNR,        'string',num2str(CM.fiber.CMNSNR))
%set(handles.edit_fadingSNR,       'string',num2str(CM.fiber.fadingSNR))
set(XDAS.h.simulation.edit_GL,     'string',num2str(CM.fiber.GL))

drawnow
