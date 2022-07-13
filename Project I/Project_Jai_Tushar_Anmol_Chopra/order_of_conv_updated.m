% % for initial guess U = ones(N-1,1)
% load('U1_12.dat');
% load('U1_ext_22.dat');
% load('U1_ext_32.dat');
% load('U1_ext_42.dat');
% 
% 
% h_12 = 0.0833;
% h_22 = 0.0455;
% h_32 = 0.0313;
% 
% error1 = max(abs(U1_ext_42' - U1_12));
% error2 = max(abs(U1_ext_42' - U1_ext_22'));
% error3 = max(abs(U1_ext_42' - U1_ext_32'));
% 
% order1 = log(error1/error2)/log(h_12/h_22)
% order2 = log(error2/error3)/log(h_22/h_32)

% for initial guess U = zeros(N-1,1)
load('U1_z_12.dat');
load('U1_ext_z_22.dat');
load('U1_ext_z_32.dat');
load('U1_ext_z_42.dat');


h_12 = 0.0833;
h_22 = 0.0455;
h_32 = 0.0313;

error1 = max(abs(U1_ext_z_42' - U1_z_12));
error2 = max(abs(U1_ext_z_42' - U1_ext_z_22'));
error3 = max(abs(U1_ext_z_42' - U1_ext_z_32'));

order1 = log(error1/error2)/log(h_12/h_22)
order2 = log(error2/error3)/log(h_22/h_32)

% for initial guess U = 0.5*ones(N-1,1)
load('U1_1_12.dat');
load('U1_ext_1_22.dat');
load('U1_ext_1_32.dat');
load('U1_ext_1_42.dat');


h_12 = 0.0833;
h_22 = 0.0455;
h_32 = 0.0313;

error1 = max(abs(U1_ext_1_42' - U1_1_12));
error2 = max(abs(U1_ext_1_42' - U1_ext_1_22'));
error3 = max(abs(U1_ext_1_42' - U1_ext_1_32'));

order1 = log(error1/error2)/log(h_12/h_22)
order2 = log(error2/error3)/log(h_22/h_32)