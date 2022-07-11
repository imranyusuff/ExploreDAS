function restoreDisplay

% ***********************************************************************************************************
%  restoreDisplay - this function restores the gui after a session is restored
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
set(XDAS.h.model.edit_xmin,'Value',num2str(CM.model.xmin))
set(XDAS.h.model.edit_xmax,'Value',num2str(CM.model.xmax))
set(XDAS.h.model.edit_zmin,'Value',num2str(CM.model.zmin))
set(XDAS.h.model.edit_zmax,'Value',num2str(CM.model.zmax))

set(XDAS.h.model.edit_pvel,'Value',num2str(CM.model.Pvelocity))
set(XDAS.h.model.edit_svel,'Value',num2str(CM.model.Svelocity))

switch CM.model.velocityType
    case 'constant'
        % Constant velocity model
        XDAS.h.model.text_kz.Visible    = 'off';
        XDAS.h.model.edit_kz.Visible    = 'off';
        XDAS.h.model.edit_pvel.Value    = num2str(CM.model.Pvelocity);
        XDAS.h.model.edit_svel.Value    = num2str(CM.model.Svelocity);
        XDAS.h.model.text_pvel.Text     = 'P Velocity';
        XDAS.h.model.text_svel.Text     = 'S Velocity';
                
    case 'gradient'
        % Gradient velocity model
        XDAS.h.model.text_kz.Visible    = 'on';
        XDAS.h.model.edit_kz.Visible    = 'on';
        XDAS.h.model.edit_kz.Value      = num2str(CM.model.kz);
        XDAS.h.model.edit_pvel.Value    = num2str(CM.model.Vp0);
        XDAS.h.model.edit_svel.Value    = num2str(CM.model.Vs0);
        XDAS.h.model.text_pvel.Text     = 'Vp0';
        XDAS.h.model.text_svel.Text     = 'Vs0';     
end


% update the editable fields on the gui - Simulation Panel
set(XDAS.h.simulation.edit_dt,  'Value',num2str(CM.model.dt))
set(XDAS.h.simulation.edit_tmax,'Value',num2str(CM.model.tmax))

% handle the wavelet source type
switch CM.model.sourceType
    case 'Ricker'
        % Ricker wavelet
        XDAS.h.simulation.text_fmin.Text = 'F0 (Hz)';
        XDAS.h.simulation.edit_fmin.Value = num2str(CM.model.f0);
        XDAS.h.simulation.text_fmax.Visible  = 'off';
        XDAS.h.simulation.edit_fmax.Visible  = 'off';
        XDAS.h.simulation.edit_fmin.Tooltip = 'Enter the center frequency of the Ricker wavelet in Hertz';
        
    case 'Klauder'
        % Klauder wavelet
        XDAS.h.simulation.text_fmin.Text = 'Fmin (Hz)';
        XDAS.h.simulation.edit_fmin.Value = num2str(CM.model.fmin);
        XDAS.h.simulation.text_fmax.Text = 'Fmax (Hz)';
        XDAS.h.simulation.edit_fmax.Value = num2str(CM.model.fmax);
        XDAS.h.simulation.text_fmax.Visible  = 'on';
        XDAS.h.simulation.edit_fmax.Visible  = 'on';
        XDAS.h.simulation.edit_fmin.Tooltip = 'Enter the low frequency cut off of the Klauder wavelet in Hertz';
        XDAS.h.simulation.edit_fmax.Tooltip = 'Enter the high frequency cut off of the Klauder wavelet in Hertz';
end

% update fields on gui - migration panel

set(XDAS.h.migration.edit_dx,      'Value',num2str(CM.model.xinc))
set(XDAS.h.migration.edit_dz,      'Value',num2str(CM.model.zinc))
set(XDAS.h.migration.edit_migXmin, 'Value',num2str(CM.model.migXmin))
set(XDAS.h.migration.edit_migXmax, 'Value',num2str(CM.model.migXmax))
set(XDAS.h.migration.edit_migZmin, 'Value',num2str(CM.model.migZmin))
set(XDAS.h.migration.edit_migZmax, 'Value',num2str(CM.model.migZmax))
set(XDAS.h.migration.edit_CDPx,    'Value',num2str(CM.model.CDPx))


% update fields on the gui - DAS parameters panel

XDAS.h.DAS.edit_GL.Value         = num2str(CM.fiber.GL);
XDAS.h.DAS.edit_opticalSNR.Value = num2str(CM.fiber.opticalNoiseSNR);
XDAS.h.DAS.edit_CMNSNR.Value     = num2str(CM.fiber.CMNSNR);

% update status of background image display option
if ~isempty(CM.model.modelImage)
    set(XDAS.h.well.pushbutton_showImage,'visible','on')    
else
    set(XDAS.h.well.pushbutton_showImage,'visible','off')
end

if CM.model.ifShowBackgroundImage
    XDAS.h.well.pushbutton_showImage.Text = 'Image';
    XDAS.h.well.pushbutton_showImage.BackgroundColor = XDAS.colors.goGreen;
else
    XDAS.h.well.pushbutton_showImage.Text = 'No Image';
    XDAS.h.well.pushbutton_showImage.BackgroundColor = XDAS.colors.stopRed;
end

if CM.fiber.ifGauge
    XDAS.h.well.pushbutton_showImage.Text = 'Image';
    XDAS.h.well.pushbutton_showImage.BackgroundColor = XDAS.colors.goGreen;
else
    XDAS.h.well.pushbutton_showImage.Text = 'No Image';
    XDAS.h.well.pushbutton_showImage.BackgroundColor = XDAS.colors.stopRed;
end

% handle the wave type list box options
switch CM.model.waveType
    case 'P DAS'
        % allow the use of the gauge on P DAS data
        XDAS.h.simulation.pushbutton_useGL.Visible = 'on';
        XDAS.h.simulation.listbox_waveType.Value = 1;
    case 'S DAS'
        % allow the use of the gauge on S DAS data
        XDAS.h.simulation.pushbutton_useGL.Visible = 'on';
        XDAS.h.simulation.listbox_waveType.Value = 2;
    case 'P Vertical'
        % cannot use the gauge for geophone P data
        XDAS.h.simulation.pushbutton_useGL.Visible = 'off';
        XDAS.h.simulation.listbox_waveType.Value = 3;
    case 'S Horizontal'
        % cannot use the gauge for geophone S data
        XDAS.h.simulation.pushbutton_useGL.Visible = 'off';
        XDAS.h.simulation.listbox_waveType.Value = 4;
end

% handle the replot options
nsources = get(XDAS.obj.sources,'nsource');

if nsources > 0 && isfield(XDAS.obj,'shotRecords') && length(XDAS.obj.shotRecords) >= nsources
    % there are shots - allow them to be replotted
    XDAS.h.DAS.pushbutton_displaySourceNum.Visible = 'on';
    XDAS.h.DAS.pushbutton_displayfk.Visible        = 'on';
else
    % there are no shots - do not allow trying to plot them
    XDAS.h.DAS.pushbutton_displaySourceNum.Visible = 'off';
    XDAS.h.DAS.pushbutton_displayfk.Visible        = 'off';
end

updateSourceNumberListBox()
updateChannelNumberListBox();

% handle the migration options
if nsources > 0 && isfield(XDAS.obj,'shotRecords') && length(XDAS.obj.shotRecords) >= nsources
    XDAS.h.migration.pushbutton_migrate.Visible = 'on';
    XDAS.h.migration.pushbutton_CDP.Visible     = 'on';
else
    XDAS.h.migration.pushbutton_migrate.Visible = 'off';
    XDAS.h.migration.pushbutton_CDP.Visible     = 'off';
end

drawnow



