% histogram_plot
%
%   h = histogram_plot(edges, height)
%      Plots a histogram with the output provided by histogram and returns
%      the plot handle.
%
%   h = histogram_plot(edges, height, location)
%      Plots a histogram in the xy plane located at z = location.
%
%   h = histogram_plot(edges, height, location, 'orientation')
%      Plots a histogram according to the orientation specified.
%
%   h = histogram_plot(edges, height, location, 'orientation', ...
%                      'PropertyName', propertyvalue,, ...)
%      Plots a histogram using using the values of the properties
%      specified.
%
%   [h l] = histogram_plot(...)
%      Returns the handle to the vertical lines drawn at the edges.
%
%   Valid orientations:
%
%       'xyz' | 'xzy' | 'yxz' | 'yzx' | 'zxy' | 'zyx'
%
%   The orientation has the following meaning:
%
%       - 1st letter denotes the axis where the bottom of the histogram
%         will lie in.
%
%       - 2nd letter specifies the direction where the bars will follow.
%
%       - 3rd letter is irrelevant once the first two have been mentioned.
%         This letter just mentions the axis to which the bars will be
%         perpendicular to.
%
%       -Example: An orientation of 'xzy' means that the bars will be drawn
%                 in the 'xz' plane with the bottom of the bars in the x
%                 axis extending along the z axis. In this case the
%                 histogram will be perpendicular to the y axis.
%
%       -Warning: This function will not check that you have put one of the
%                 valid strings. Please be responsible and use only the 
%                 valid ones.
%
%   The histogram is made with the function patch, and thus you can give
%   any properties you want to the handle.  For a list of all 
%   patch properties type: doc patch_props 
%   or view it online at:
%
%     http://www.mathworks.com/help/techdoc/ref/patch_props.html
%
%   Some useful properties:
%   
%       FaceAlpha : Transparency of the patch face.
%       FaceColor : Color of the patch face.
%       LineStyle : {-} | -- | : | -. | none.
%       LineWidth : width in points.
%       EdgeColor : Color of the patch edge.
%       EdgeAlpha : Transparency of the edges of patch faces.
%
% See also: histogram
%
% URL: http://math.uh.edu/stochastic/Matlab/?ref=histogram_plot
%
% jmlopez (Jun 21, 2012)
% Department of Mathematics
% University of Houston

% Original Creation Date: July 15, 2009
function [h, varargout] = histogram_plot(edges, height, varargin)

if nargin < 2
    error('Not enough inputs. Type help histogram_plot');
else
   x = edges;
   y = height;
   z = 0;
   order = 'xyz';
   if nargin >= 3
       z = varargin{1};
       varargin(1) = [];
       if isa(z, 'numeric')
           z = z(1);
       else
           error('location must be a number. Type help histogram_plot');
       end
       if nargin >= 4
           order = varargin{1};
           varargin(1) = [];
           if isa(order, 'char')
               if length(order) ~= 3
                  error('orientation must be a 3 character string. Type help histogram_plot'); 
               end
           else
               error('orientation must be a string. Type help histogram_plot');
           end
       end
   end
end

[~, order] = sort([find('x' == order) find('y' == order) find('z' == order)]);
L = length(x);
v = zeros(L*2, 3);
v(1:2:end, order(1)) = x;
v(2:2:end, order(1)) = x;
v(2:2:end-1, order(2)) = y;
v(3:2:end-1, order(2)) = y;
v(:, order(3)) = z*ones(L*2, 1);

figHandles = findall(0,'Type','figure');
if isempty(figHandles)
    mk_figure;
    mk_axes({'c', 1}); 
end

h = patch('Faces', 1:L*2, 'Vertices', v, 'FaceColor', [.2 .8 .2], varargin{:});

if z ~= 0 && strcmp(order, 'xyz') == 0
   box off;
   grid on;
   view(60, 30);
   set(h, 'FaceAlpha', 0.8);
   %set(gca, 'Projection', 'perspective');
end

if nargout == 2
    L = L-2;
    vb = zeros(L*2, 3);
    vb(1:L, order(1)) = x(2:end-1);
    vb(L+1:end, order(1)) = x(2:end-1);
    vb(1:L, order(2)) = zeros(L, 1);
    vb(L+1:end, order(2)) = y(1:end-1);
    vb(:, order(3)) = z*ones(L*2, 1);
    varargout{1} = patch('Faces', [(1:L)' ((1:L)+L)'], 'Vertices', vb, varargin{:});
end


