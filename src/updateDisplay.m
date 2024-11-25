function updateDisplay

% ***********************************************************************************************************
%  updateDisplay - this function updates the gui 
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


% limit the display to be within the new model dimensions
xlim(XDAS.h.axes_model,[CM.model.xmin CM.model.xmax])
ylim(XDAS.h.axes_model,[CM.model.zmin CM.model.zmax])
set(XDAS.h.axes_model,'ydir','reverse')

% update the editable fields on the gui - Model Panel
set(XDAS.h.model.edit_xmin,'string',num2str(CM.model.xmin))
set(XDAS.h.model.edit_xmax,'string',num2str(CM.model.xmax))
set(XDAS.h.model.edit_zmin,'string',num2str(CM.model.zmin))
set(XDAS.h.model.edit_zmax,'string',num2str(CM.model.zmax))

set(XDAS.h.model.edit_pvel,'string',num2str(CM.model.Pvelocity))
set(XDAS.h.model.edit_svel,'string',num2str(CM.model.Svelocity))

switch get(XDAS.h.model.listbox_velocityType,'string')
    case 1
        % Constant velocity model
        set(XDAS.h.model.text_kz, 'visible', 'off');
        set(XDAS.h.model.edit_kz, 'visible', 'off');
        set(XDAS.h.model.edit_pvel, 'string', num2str(CM.model.Pvelocity));
        set(XDAS.h.model.edit_svel, 'string', num2str(CM.model.Svelocity));
        set(XDAS.h.model.text_pvel, 'string', 'P Velocity');
        set(XDAS.h.model.text_svel, 'string', 'S Velocity');
                
    case 2
        % Gradient velocity model
        set(XDAS.h.model.text_kz, 'visible', 'on');
        set(XDAS.h.model.edit_kz, 'visible', 'on');
        set(XDAS.h.model.edit_kz, 'string', num2str(CM.model.kz));
        set(XDAS.h.model.edit_pvel, 'string', num2str(CM.model.Vp0));
        set(XDAS.h.model.edit_svel, 'string', num2str(CM.model.Vs0));
        set(XDAS.h.model.text_pvel, 'string', 'Vp0');
        set(XDAS.h.model.text_svel, 'string', 'Vs0');     
end


% update the editable fields on the gui - Simulation Panel
set(XDAS.h.simulation.edit_dt,  'string',num2str(CM.model.dt))
set(XDAS.h.simulation.edit_tmax,'string',num2str(CM.model.tmax))


switch get(XDAS.h.simulation.listbox_sourceType,'string')
    case 1
        % Ricker wavelet
        set(XDAS.h.simulation.text_fmin, 'string', 'F0 (Hz)');
        set(XDAS.h.simulation.edit_fmin, 'string', num2str(CM.model.f0));
        set(XDAS.h.simulation.text_fmax, 'visible', 'off');
        set(XDAS.h.simulation.edit_fmax, 'visible', 'off');
        set(XDAS.h.simulation.edit_fmin, 'tooltipstring', 'Enter the center frequency of the Ricker wavelet in Hertz');
        
    case 2
        % Klauder wavelet
        set(XDAS.h.simulation.text_fmin, 'string', 'Fmin (Hz)');
        set(XDAS.h.simulation.edit_fmin, 'string', num2str(CM.model.fmin));
        set(XDAS.h.simulation.text_fmax, 'string', 'Fmax (Hz)');
        set(XDAS.h.simulation.edit_fmax, 'string', num2str(CM.model.fmax));
        set(XDAS.h.simulation.text_fmax, 'visible', 'on');
        set(XDAS.h.simulation.edit_fmax, 'visible', 'on');
        set(XDAS.h.simulation.edit_fmin, 'tooltipstring', 'Enter the low frequency cut off of the Klauder wavelet in Hertz');
        set(XDAS.h.simulation.edit_fmax, 'tooltipstring', 'Enter the high frequency cut off of the Klauder wavelet in Hertz');
end

% update fields on gui - migration panel

set(XDAS.h.migration.edit_dx,      'string',num2str(CM.model.xinc))
set(XDAS.h.migration.edit_dz,      'string',num2str(CM.model.zinc))
set(XDAS.h.migration.edit_migXmin, 'string',num2str(CM.model.migXmin))
set(XDAS.h.migration.edit_migXmax, 'string',num2str(CM.model.migXmax))
set(XDAS.h.migration.edit_migZmin, 'string',num2str(CM.model.migZmin))
set(XDAS.h.migration.edit_migZmax, 'string',num2str(CM.model.migZmax))
set(XDAS.h.migration.edit_CDPx,    'string',num2str(CM.model.CDPx))


% update fields on the gui - DAS parameters panel

set(XDAS.h.simulation.edit_GL         ,'string',num2str(CM.fiber.GL));
set(XDAS.h.DAS.edit_opticalSNR ,'string',num2str(CM.fiber.opticalNoiseSNR));
set(XDAS.h.DAS.edit_CMNSNR     ,'string',num2str(CM.fiber.CMNSNR));

% update status of background image display option
if ~isempty(CM.model.modelImage)
    set(XDAS.h.well.pushbutton_showImage,'visible','on')    
else
    set(XDAS.h.well.pushbutton_showImage,'visible','off')
end

if CM.model.ifShowBackgroundImage
    set(XDAS.h.well.pushbutton_showImage, 'string', 'Image');
    set(XDAS.h.well.pushbutton_showImage, 'backgroundcolor', XDAS.colors.goGreen);
else
    set(XDAS.h.well.pushbutton_showImage, 'string', 'No Image');
    set(XDAS.h.well.pushbutton_showImage, 'backgroundcolor', XDAS.colors.stopRed);
end

if CM.fiber.ifGauge
    set(XDAS.h.well.pushbutton_showImage, 'string', 'Image');
    set(XDAS.h.well.pushbutton_showImage, 'backgroundcolor', XDAS.colors.goGreen);
else
    set(XDAS.h.well.pushbutton_showImage, 'string', 'No Image');
    set(XDAS.h.well.pushbutton_showImage, 'backgroundcolor', XDAS.colors.stopRed);
end

drawnow



