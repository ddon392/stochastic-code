% axes_label
%
%   c = axes_label('label')
%      Places the text object with the string 'label' on the upper-left 
%      corner of the current axes and returns a cell containing the handle
%      of the text and an event listener.
%
%   c = axes_label('label', dx, dy)
%      Places the text object dx pixels from the left side of the axes
%      and dy pixels from the top. These values are set to 3 by default.
%
%   c = axes_label(c, ...)
%      Peforms the operations mentioned above on cell c containing the
%      handle of the text and the event listener.
%
%   c = axes_label(c, dx, dy)
%      Adjusts the current label to the specifed distance from the
%      upper-left corner of the current axes.
%
% See also: mk_axes, mk_figure
%
% URL: http://math.uh.edu/stochastic/Reference/?ref=axes_label
%
% jmlopez (Jun 21, 2012)
% Department of Mathematics
% University of Houston

function c = axes_label(varargin)

if isa(varargin{1}, 'char')
    axesHandle = gca;
else
    axesHandle = get(varargin{1}{1}, 'Parent');
end

if strcmp(get(get(axesHandle, 'Title'), 'String'), '')
    title(axesHandle, ' ');
end
if strcmp(get(get(axesHandle, 'YLabel'), 'String'), '')
    ylabel(axesHandle, ' ');
end
if strcmp(get(get(axesHandle, 'ZLabel'), 'String'), '')
    zlabel(axesHandle, ' ');
end

if isa(varargin{1}, 'char')    
    label = varargin{1};
    if nargin >=2
        dx = varargin{2};
        if nargin >= 3
            dy = varargin{3};
        else
            dy = 0;
        end
    else
        dx = 3;
        dy = 3;
    end
    h = text('String', label, ...
        'HorizontalAlignment', 'left',...
        'VerticalAlignment', 'top', ...
        'FontUnits', 'pixels', ...
        'FontSize', 16, ...
        'FontWeight', 'bold', ...
        'FontName', 'Arial', ...
        'Units', 'normalized');
    el = addlistener(axesHandle, 'Position', 'PostSet', @(o, e) posChanged(o, e, h, dx, dy));
    c = {h, el};
else
    h = varargin{1}{1};
    delete(varargin{1}{2});
    if nargin >= 2    
        if isa(varargin{2}, 'char')
            set(h, 'String', varargin{2});
            if nargin >=3
                dx = varargin{3};
                dy = varargin{4};
            else
                dx = 3;
                dy = 3;
            end
        else
            dx = varargin{2};
            dy = varargin{3};
        end
    else
       error('Needs more arguments. Type help axes_label'); 
    end
    el = addlistener(axesHandle, 'Position', 'PostSet', @(o, e) posChanged(o, e, h, dx, dy));
    c = {h, el};
end
posChanged(0, 0, h, dx, dy);
end

function posChanged(~, ~, h, dx, dy)
    axh = get(h, 'Parent');
    p = get(axh, 'Position');
    o = get(axh, 'OuterPosition');
    xp = (o(1)-p(1))/p(3);
    yp = (o(2)-p(2)+o(4))/p(4);
    set(h, 'Units', get(axh, 'Units'),'Position', [xp yp]);
    set(h, 'Units', 'pixels');
    p = get(h, 'Position');
    set(h, 'Position', [p(1)+dx, p(2)+5-dy]);
    set(h, 'Units', 'normalized');
end

