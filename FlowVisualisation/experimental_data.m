%% load data from G. Rossitto, C. Sicot, V. Ferrand, J. Bor ?ee, and F. Harambat. Influence of afterbody rounding on the pressure distribution over a fastback vehicle. Experiments in Fluids, 57(3):43, 2016.

importdata('dataSide_RossSicFerrBorHar2016.dat');

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

xlen = 255;
ylen=255;

Xres=reshape(X, xlen,ylen)';
Yres=reshape(Y, xlen,ylen)';
Ures=reshape(U, xlen,ylen)';
Vres=reshape(V, xlen,ylen)';
%

%%
figure(2)
streamslice(Xres, Yres, Ures,Vres)
set(gca, 'FontSize', 14)
hold on
geometry = stlread('_Ref25deg_1_tras_rot2.stl');
geometry.vertices(:,1)=geometry.vertices(:,1);%/201;
geometry.vertices(:,3)=geometry.vertices(:,3);%/201;
geometry.vertices(:,2)=geometry.vertices(:,2)+175;%/201;
%
pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
hold on
rectangle('Position',[X(1) Y(1), 145 50], 'FaceColor', [1,1,1], 'EdgeColor',[1,1,1])
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])
print('Figures/CAR_streamplot','-depsc')
