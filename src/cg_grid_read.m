function [io_gridname, ierr] = cg_grid_read(in_file_number, in_B, in_Z, in_G, io_gridname)
% Gateway function for C function cg_grid_read.
%
% [gridname, ierr] = cg_grid_read(file_number, B, Z, G, gridname)
%
% Input arguments (required; type is auto-casted):
%     file_number: 32-bit integer (int32), scalar
%               B: 32-bit integer (int32), scalar
%               Z: 32-bit integer (int32), scalar
%               G: 32-bit integer (int32), scalar
%
% In&Out argument (required as output; type is auto-casted):
%        gridname: character string with default length 32  (optional as input)
%
% Output argument (optional):
%            ierr: 32-bit integer (int32), scalar
%
% The original C function is:
% int cg_grid_read(int file_number, int B, int Z, int G, char * gridname);
%
% For detail, see <a href="https://cgns.github.io/CGNS_docs_current/midlevel/grid.html">online documentation</a>.
%
if ( nargout < 1 || nargin < 4)
    error('Incorrect number of input or output arguments.');
end
in_file_number = int32(in_file_number);
in_B = int32(in_B);
in_Z = int32(in_Z);
in_G = int32(in_G);
io_gridname = char(io_gridname);
if nargin<5
    io_gridname=char(zeros(1,32));
elseif length(io_gridname)<32
    %% Enlarge the array if necessary;
    io_gridname=char([io_gridname zeros(1,32-length(io_gridname))]);
elseif ~isa(io_gridname,'char')
    io_gridname=char(io_gridname);
else
    % Write to it to avoid sharing memory with other variables
    t=io_gridname(1); io_gridname(1)=t;
end


% Invoke the actual MEX-function.
[io_gridname, ierr] = cgnslib_mex(int32(70), in_file_number, in_B, in_Z, in_G, io_gridname);
