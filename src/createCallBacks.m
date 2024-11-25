function createCallBacks
        
% ***********************************************************************************************************
%  createCallBacks - this function creates the call backs for each gui item
%
% ***********************************************************************************************************
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

% ****************************************************************
% callbacks for panel_simulation
% ****************************************************************

set(XDAS.h.simulation.edit_fmax, 'callback',                 @edit_fmax_Callback);
set(XDAS.h.simulation.edit_fmin, 'callback',                 @edit_fmin_Callback);
set(XDAS.h.simulation.edit_dt, 'callback',                   @edit_dt_Callback);
set(XDAS.h.simulation.edit_tmax, 'callback',                 @edit_tmax_Callback);
set(XDAS.h.simulation.pushbutton_model, 'callback',          @pushbutton_runModel_Callback);
set(XDAS.h.simulation.listbox_sourceType, 'callback',        @listbox_sourceType_Callback);  
set(XDAS.h.simulation.edit_GL, 'callback',                   @edit_GL_Callback);
set(XDAS.h.simulation.pushbutton_useGL, 'callback',          @pushbutton_useGL_Callback);
set(XDAS.h.simulation.pushbutton_firstBreaks, 'callback',    @pushbutton_firstBreaks_Callback);
%set(XDAS.h.simulation.pushbutton_spectralRatios, 'callback', @pushbutton_spectralRatios_Callback);

set(XDAS.h.simulation.listbox_waveType, 'callback',          @listbox_waveType_Callback);  


% ****************************************************************
% callbacks for panel_source
% ****************************************************************

set(XDAS.h.source.pushbutton_delete, 'callback',      @pushbutton_deleteSource_Callback);
set(XDAS.h.source.pushbutton_add, 'callback',         @pushbutton_addSource_Callback);

% ****************************************************************
% callbacks for panel_reflector
% ****************************************************************

set(XDAS.h.reflector.listbox_reflectors, 'callback',   @listbox_selectReflector_Callback);
set(XDAS.h.reflector.pushbutton_reorder, 'callback',   @pushbutton_reorderReflectorPoints_Callback);
set(XDAS.h.reflector.pushbutton_delete, 'callback',    @pushbutton_deleteReflectorPoint_Callback);
set(XDAS.h.reflector.pushbutton_add, 'callback',       @pushbutton_addReflectorPoint_Callback);
set(XDAS.h.reflector.pushbutton_startNew, 'callback',  @pushbutton_addNewReflector_Callback);

% ****************************************************************
% callbacks for panel_well
% ****************************************************************

set(XDAS.h.well.pushbutton_reorder, 'callback',        @pushbutton_reorderWell_Callback);
set(XDAS.h.well.pushbutton_delete, 'callback',         @pushbutton_deleteWellPoint_Callback);
set(XDAS.h.well.pushbutton_add, 'callback',            @pushbutton_addWellPoint_Callback);

% ****************************************************************
% callbacks for panel_model
% ****************************************************************
 
 set(XDAS.h.model.edit_xmax, 'callback',            @edit_Xmax_Callback);
 set(XDAS.h.model.edit_xmin, 'callback',            @edit_Xmin_Callback);
 set(XDAS.h.model.edit_zmax, 'callback',            @edit_Zmax_Callback);
 set(XDAS.h.model.edit_zmin, 'callback',            @edit_Zmin_Callback);
 set(XDAS.h.model.edit_svel, 'callback',            @edit_Svelocity_Callback);
 set(XDAS.h.model.edit_pvel, 'callback',            @edit_Pvelocity_Callback);
 set(XDAS.h.model.edit_kz, 'callback',              @edit_kz_Callback);
 set(XDAS.h.model.listbox_velocityType, 'callback', @listbox_velocityType_Callback);
 set(XDAS.h.well.pushbutton_showImage, 'callback',  @pushbutton_showBackgroundImage);

% ****************************************************************
% callbacks for panel_migration
% ****************************************************************
 
set(XDAS.h.migration.pushbutton_migrate, 'callback',  @pushbutton_migrate_Callback);
set(XDAS.h.migration.pushbutton_CDP, 'callback',      @pushbutton_CDP_Callback);
set(XDAS.h.migration.edit_dx, 'callback',             @edit_dx_Callback);
set(XDAS.h.migration.edit_dz, 'callback',             @edit_dz_Callback);
set(XDAS.h.migration.edit_migZmin, 'callback',        @edit_migZmin_Callback);
set(XDAS.h.migration.edit_migZmax, 'callback',        @edit_migZmax_Callback);
set(XDAS.h.migration.edit_migXmin, 'callback',        @edit_migXmin_Callback);
set(XDAS.h.migration.edit_migXmax, 'callback',        @edit_migXmax_Callback);
set(XDAS.h.migration.edit_CDPx, 'callback',           @edit_CDPx_Callback);

% ****************************************************************
% callbacks for panel_DAS
% ****************************************************************

set(XDAS.h.DAS.pushbutton_removeCMN, 'callback',         @pushbutton_removeCMN_Callback);

set(XDAS.h.DAS.edit_opticalSNR, 'callback',              @edit_opticalNoiseSNR_Callback);
set(XDAS.h.DAS.pushbutton_addOpticalNoise, 'callback',   @pushbutton_addOpticalNoise_Callback);

set(XDAS.h.DAS.pushbutton_addCMN, 'callback',            @pushbutton_addCMN_Callback);
%set(XDAS.h.DAS.edit_CMNSNR, 'callback',                  @edit_cmnSNR_Callback);

set(XDAS.h.DAS.pushbutton_displayfk, 'callback',         @pushbutton_displayFK_Callback);
set(XDAS.h.DAS.pushbutton_displaySourceNum, 'callback',  @pushbutton_displaySourceNum_Callback);
set(XDAS.h.DAS.pushbutton_polarity, 'callback',          @pushbutton_polarity_Callback);
set(XDAS.h.DAS.pushbutton_noiseOnly, 'callback',         @pushbutton_noiseOnly_Callback);

set(XDAS.h.DAS.pushbutton_gainUp, 'callback',            @pushbutton_gainUp_Callback);
set(XDAS.h.DAS.pushbutton_gainDown, 'callback',          @pushbutton_gainDown_Callback);

