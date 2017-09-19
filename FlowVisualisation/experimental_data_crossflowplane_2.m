%% load data from G. Rossitto, C. Sicot, V. Ferrand, J. Bor ?ee, and F. Harambat. Influence of afterbody rounding on the pressure distribution over a fastback vehicle. Experiments in Fluids, 57(3):43, 2016.
importdata('Cross_X0.dat');
% 
%%

dataall=ans.data;

% x and y directions of the velocities as U and V
U=dataall(:,6); % U direction
V=dataall(:,7); % V direction

% rescale velocities if needed
%U=1e-1*U;
%V=1e-1*V;

%positions
X=dataall(:,3);
Y=dataall(:,4);


%%
% read the data size from the input file
xlen=223;
ylen=234;

Xres=reshape(X, xlen, ylen)';
Yres=reshape(Y, xlen, ylen)';
Ures=reshape(U, xlen, ylen)';
Vres=reshape(V, xlen, ylen)';

figure(111)
streamslice(Xres, Yres, Ures,Vres)
set(gca, 'FontSize', 14)
print('CROSSstreamplot','-depsc')

