function ierr = cg_famname_write(in_family_name)
% Gateway function for C function cg_famname_write.
%
% ierr = cg_famname_write(family_name)
%
% Input argument (required; type is auto-casted):
%     family_name: character string
%
% Output argument (optional):
%            ierr: 32-bit integer (int32), scalar
%
% The original C function is:
% int cg_famname_write(const char * family_name);
%
% For detail, see <a href="https://cgns.github.io/CGNS_docs_current/midlevel/families.html">online documentation</a>.
%
if (nargin < 1)
    error('Incorrect number of input or output arguments.');
end
in_family_name = char(in_family_name);

% Invoke the actual MEX-function.
ierr = cgnslib_mex(int32(65), in_family_name);
