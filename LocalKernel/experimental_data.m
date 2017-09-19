%% load data from G. Rossitto, C. Sicot, V. Ferrand, J. Bor ?ee, and F. Harambat. Influence of afterbody rounding on the pressure distribution over a fastback vehicle. Experiments in Fluids, 57(3):43, 2016.

importdata('Config0_Y0_bottom.dat');

%%
% read the description in ans.textdata
dataall=ans.data;
% x and y directions of the velocities as U and V
U=dataall(:,10);
V=dataall(:,11);

% rescale velocities if needed
U=1e-1*U;
V=1e-1*V;

% positions in mm
X=dataall(:,5);
Y=dataall(:,6);


%%
xlen = 255;
ylen=255;

Xres=reshape(X, xlen,ylen)';
Yres=reshape(Y, xlen,ylen)';
Ures=reshape(U, xlen,ylen)';
Vres=reshape(V, xlen,ylen)';

%%
figure(2)
streamslice(Xres, Yres, Ures,Vres)
set(gca, 'FontSize', 14)
print('SIDEstreamplot','-depsc')
