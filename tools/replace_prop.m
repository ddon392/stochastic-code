% replace_prop
%
%   oldvalue = replace_prop(handle, 'PropertyName', newvalue)
%       Returns the current value of the handle 'PropertyName' and replaces
%       it for newvalue.
%
% See also: set, get
%
% URL: http://math.uh.edu/stochastic/Matlab/?ref=replace_prop
%
% jmlopez (Jun 19, 2012)
% Department of Mathematics
% University of Houston

function oldvalue = replace_prop(handle, propName, newvalue)

oldvalue = get(handle, propName);
set(handle, propName, newvalue);
