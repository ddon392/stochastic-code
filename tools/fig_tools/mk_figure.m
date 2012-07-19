% mk_figure
%
%   fh = mk_figure
%       Creates a figure of dimensions 6.87 by 6.87/GoldenRatio
%       inches with white background and returns the handle to the figure.
%
%   fh = mk_figure(dim)
%       Creates a figure of dimensions specified by dim.
%
%   fh = mk_figure(dim, 'units')
%       Creates a figure in the units specified.
%
%   fh = mk_figure(dim, 'units', 'PropertyName', propertyvalue, ...)
%       Creates a figure using using the values of the properties
%       specified.
%
% The parameter dim can either be [w] or [w, h]. When dim is a single
% scalar value then the height is set to be w/GoldenRatio.
%
% Valid units:
%
%   inches | centimeters | normalized | points | pixels | characters
%
% Note: This is a wrapper for the function figure, thus, any
%   valid property for figure is valid for mk_figure. For a list of all 
%   figure properties type: doc figure_props 
%   or view it online at:
%
%     http://www.mathworks.com/help/techdoc/ref/figure_props.html
%
% See also: mk_axes, axes_label
%
% URL: http://math.uh.edu/stochastic/Matlab/?ref=mk_figure
%
% jmlopez (Jun 19, 2012)
% Department of Mathematics
% University of Houston

function fh = mk_figure(dim, varargin)

GR = 1.61803399;
if nargin >= 1
    if isa(dim, 'numeric')
        if length(dim) == 1
            w = dim;
            h = w/GR;
        elseif length(dim) == 2
            w = dim(1);
            h = dim(2);
        else
            error('Length of first parameter must be 1 or 2. Type help mk_figure');
        end
    else
        error('1st paramter must be a numeric vector. Type help mk_figure');
    end
    if nargin >=2
        if isa(varargin{1}, 'char')
            units = varargin{1};
        else
            error('2nd parameter must be a string. Type help mk_figure')
        end
        varargin(1) = [];
    else
        units = 'inches';
    end
else
    w = 6.87;
    h = w/GR;
    units = 'inches';
end

set(0, 'Units', 'pixels');
scrsz = get(0,'ScreenSize');

fh = figure('Units', units, ... 
            'Color', [1,1,1], ...
            'Position', [0, 0, w, h]);
        
set(fh, 'Units', 'pixels');
pos = get(fh,'OuterPosition');
w = pos(3); h = pos(4);
 
figHandles = findall(0,'Type','figure');
if length(figHandles) == 1
    if isunix        
        set(fh, 'OuterPosition', [0, scrsz(4)-21-h, w, h]);
    else
        set(fh, 'OuterPosition', [0, scrsz(4)-h, w, h]);
    end
else 
    u = replace_prop(figHandles(2), 'Units', 'pixels');
    pos = get(figHandles(2), 'OuterPosition');
    set(figHandles(2), 'Units', u);
    if isunix
        set(fh, 'OuterPosition', [pos(1)+40, pos(2)+pos(4)-h-21, w, h]);
    else 
        set(fh, 'OuterPosition', [pos(1)+50, pos(2)+pos(4)-h-50, w, h]);
    end
end
set(fh, 'Units', units);
if ~isempty(varargin)
    set(fh, varargin{:});
end
