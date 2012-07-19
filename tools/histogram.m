% histogram:
% 
%   [edges, heights] = histogram([x1, x2, ...])
%       Returns the edges and heights of the histogram made of 10 bins
%       for the values xi. Each height is determined by the count of the
%       number of elements of [x1, x2, ...] that fit in the corresponding
%       bin.
%
%   [edges, heights] = histogram({[x1, x2, ...], [w1, w2, ...]})
%       Returns the edges and heights of the histogram made of 10 bins for
%       the values of xi. Each height for a particular bin is the sum of 
%       all the weights wi that correspond to some xi in that bin.
%
%   [edges, heights] = histogram(..., bspec)
%       Returns the edges and heights of the histogram with bin width
%       specification bspec.
%
%   [edges, heights] = histogram(..., bspec, hspec)
%       Returns the edges and heights of the histogram made with bin
%       heights computed according to the specification hspec.
%
%   [edges, heights] = histogram(..., bspec, hspec, bopt)
%       Returns the edges and heights of the histogram with bins made
%       with the specification bspec and options bopt.
%
%   Values of bspec:
%
%      n                  : use n bins
%      {xmin, xmax, n}    : use n bins from xmin to xmax
%      {dx}               : use bins of width dx
%      {xmin, xmax, {dx}} : use bins of width dx from xmin to xmax
%      {[b1, b2, ...]}    : use the bins [b1, b2), [b2, b3)
%      'name'             : use a named binning method
%
%    Possible binning methods:
%
%      'Discrete' : centers the bins at integer values
% 
%   Values of hspec:
%   
%      'Count'            : the number of values lying in each bin 
%      'CumulativeCount'  : cumulative counts
%      'Probability'      : fraction of values lying in each bin
%      'PDF'              : probability density function
%      'CDF'              : cumulative distribution function
%
%   Values of bopt:
%
%       {[xmin, xmax]}    : Only allowed when bspec is 'Discrete'
%
% See also: bar, plot_histogram
%
% URL: http://math.uh.edu/stochastic/Reference/?ref=histogram
%
% jmlopez (June 18, 2012)
% Department of Mathematics
% University of Houston.

function [edges, heights] = histogram(data, varargin)

if iscell(data)
   if length(data) ~= 2
      error('Enter {x, w}. See: help histogram'); 
   end
   x = data{1};
   w = data{2};
   if length(x) ~= length(w)
      error('Length of x and w must be the same. See: help histogram'); 
   end
else
   x = data; 
   w = ones(size(x));
end

% Determine the edges, this is done by looking at the arguments.
% the width of each bin is computed during this step.
if nargin >= 2
    if isa(varargin{1}, 'numeric') % n
        nBins = varargin{1}(1);
        range = [min(x), max(x)];
        edges = linspace(range(1), range(2), nBins+1);
        dt = edges(2)-edges(1);
    elseif iscell(varargin{1})
        tmp = varargin{1};
        switch length(tmp)
            case 1 
                if length(tmp{1}) == 1 % {dx} 
                    range = [min(x), max(x)];
                    edges = range(1):tmp{1}:range(2);
                    dt = tmp{1};
                else % {[b1, b2, ...]}
                    edges = tmp{1};
                    dt = diff(tmp{1});
                end
            case 3 
                if iscell(tmp{3}) % {xmin, xmax, {dx}}
                    edges = tmp{1}(1):tmp{3}{1}(1):tmp{2}(1);
                    dt = tmp{3}{1}(1);
                else % {xmin, xmax, n}
                    nBins = tmp{3}(1);
                    range = [tmp{1}(1), tmp{2}(1)];
                    edges = linspace(range(1), range(2), nBins+1);
                    dt = edges(2)-edges(1);
                end
            otherwise
                error('Unknown bspec. See: help histogram')
        end
    elseif isa(varargin{1}, 'char')
        switch varargin{1}
            case 'Discrete'                
                if nargin == 4
                    if iscell(varargin{3}) && length(varargin{3}{1}) == 2
                        range = varargin{3}{1};
                        range = [round(range(1))-0.5, round(range(2))+0.5];
                    else
                        error('Unknown bopt. See: help histogram');
                    end
                else
                    range = [floor(min(x))-0.5, ceil(max(x))+0.5];
                end
                edges = linspace(range(1), range(2), range(2)-range(1)+1);
                dt = edges(2)-edges(1);
            otherwise
                error('Unknown binning specification. See: help histogram');
        end
    else
        error('Unknown bspec. See: help histogram');
    end
    hspec = 'Count';
    if nargin >= 3
        hspec = varargin{2};
    end
else
    % Default Behavior, only 1 parameter
    range = [min(x), max(x)];
    edges = linspace(range(1), range(2), 11);
    dt = edges(2)-edges(1);
    hspec = 'Count';
end
    
% Matlab provides histc. Let us use it
if iscell(data)
    [count bin] = histc(x, edges);
    for i=1:length(count)
       count(i) = sum(w(bin==i)); 
    end
else
    count = histc(x, edges);
end

% Return the height based on hspec
switch hspec
    case 'Count'
        heights = count(1:end-1);
    case 'CumulativeCount'
        heights = cumsum(count(1:end-1));
    case 'Probability'
        heights = count(1:end-1)./sum(w);
    case 'PDF'
        heights = count(1:end-1)./(sum(w.*dt));
    case 'CDF'
        heights = cumsum(count(1:end-1)./sum(w));
    otherwise 
        error('Unknown hspec. See: help histogram');
end
