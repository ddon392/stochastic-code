% mk_axes
%
%    h = mk_axes
%       Returns a handle to a single axes in the current figure.
%
%    h = mk_axes(layout)
%       Returns a cell of axes handles created using the specified layout
%       in the current figure.
%
%    h = mk_axes(layout, outerpos)
%       Returns a cell of axes handles created in a section of the current
%       figure.
%
% Note: layout must be composed by the following basic forms:
%
%   {'r', n} : Divides the current figure into n equal rows of axes.
%   {'c', n} : Divides the current figure into n equal columns of axes.
%   {'r', [x1, x2, ..., xn]} : Each of the xi represents the fraction of
%       the figure (height wise) that each axes is going to take. Thus the
%       sum x1+x2+...+xn must equal 1.
%   {'c', [x1, x2, ..., xn]} : Each of the xi represents the fraction of
%       the figure (width wise) that each axes is going to take. Thus the
%       sum x1+x2+...+xn must equal 1.
%
% To create a complex structure you can use combinations of the basic
% forms. Once you have defined the second parameter in one of the basic
% forms then you are allowed to write up to either n or length([x1,...,xn])
% more basic forms following the second parameter. 
%
% Example: To create a figure with 3 subplots where one is left half of a
% figure and the other two are stack vertically on the right half we can do
% the following:
%
%   h = mk_axes({'c', 2, 0, {'r', [.25 .75]}});
%
% See also: mk_figure, axes_label
%
% URL: http://math.uh.edu/stochastic/Reference/?ref=mk_axes
%
% jmlopez (Jun 20, 2012)
% Department of Mathematics
% University of Houston

function h = mk_axes(layout, outerpos)

if nargin == 0
    h = axes('LineWidth', 1, ...
        'FontName', 'Arial', ...
        'FontUnits', 'pixels', ...
        'FontSize', 12,...
        'FontWeight', 'normal',...
        'Box', 'on',...
        'OuterPosition', [0 0 1 1]);
    set(h,'LooseInset',get(h,'TightInset'));
   return 
elseif nargin > 2
    error('Too many parameters. Type mk_axes'); 
elseif nargin == 1
    outerpos = [0 0 1 1];
end

if iscell(layout)
    if length(layout) > 1
        index = 3;
        switch layout{1}
            case 'c'
                if length(layout{2}) == 1
                    ld = outerpos(3)/layout{2};
                    ld = ld*ones(1, layout{2});
                else
                    if sum(layout{2}) == 1
                        ld = layout{2}*outerpos(3);
                    else
                        error('Division among columns does not add up.');
                    end
                end
                h = cell(1, length(ld));
                ptmp = [0 cumsum(ld(1:end-1))];
                for i=1:length(h) 
                    newpos = [ptmp(i)+outerpos(1), outerpos(2), ld(i), outerpos(4)];
                    if index <= length(layout) && iscell(layout{index})
                        h{i} = mk_axes(layout{index}, newpos);
                    else
                        h{i} = axes('LineWidth', 1, ...
                            'FontName', 'Arial', ...
                            'FontUnits', 'pixels', ...
                            'FontSize', 12,...
                            'FontWeight', 'normal',...
                            'Box', 'on', ...
                            'OuterPosition', newpos);
                        set(h{i},'LooseInset',get(h{i},'TightInset'));
                    end
                    index = index+1;
                end
            case 'r'
                if length(layout{2}) == 1
                    ld = outerpos(4)/layout{2};
                    ld = ld*ones(1, layout{2});
                else
                    if sum(layout{2}) == 1
                        ld = layout{2}*outerpos(4);
                    else
                        error('Division among rows does not add up.');
                    end
                end
                h = cell(length(ld),1);
                ptmp = [0 cumsum(ld(1:end-1))];
                 for i=1:length(h)
                    newpos = [outerpos(1), ptmp(i)+outerpos(2), outerpos(3), ld(i)];
                    if index <= length(layout) && iscell(layout{index})
                        h{i} = mk_axes(layout{index}, newpos);
                    else
                        h{i} = axes('LineWidth', 1, ...
                            'FontName', 'Arial', ...
                            'FontUnits', 'pixels', ...
                            'FontSize', 12,...
                            'FontWeight', 'normal',...
                            'Box', 'on',...
                            'OuterPosition', newpos);
                        set(h{i},'LooseInset',get(h{i},'TightInset'));
                    end
                    index = index+1; 
                end
            otherwise
                error('First cell element must be char c or char r.');
        end
    else
       error('layout must be a cell with at least 2 elements. Type help mk_axes'); 
    end
else
   error('parameter must be a cell. Type mk_axes'); 
end
