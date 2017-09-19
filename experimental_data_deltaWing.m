%% load data from http://vfe2.dlr.de/Site/index.php?id=17&sid=a534e8df2d7ead01215281773ea8740859b7a7dd04314

cd ..
cd('delta_wing_dlr_tc4')
importdata('piv80_rleM04R3A13.plt');
cd ..
cd('src')
%%
% read the description in ans.textdata
dataall=ans.data;
% x and y directions of the velocities as U and V
U=dataall(:,5);
V=dataall(:,6);

% rescale velocities if needed
U=1e-1*U;
V=1e-1*V;

vorticity=dataall(:,end);


% positions in mm
X=dataall(:,2);
Y=dataall(:,3);

xlen = 83;
ylen=62;

figure(34)
scatter(X, Y, 20, vorticity)
% X=X(U~=0);
% Y=Y(U~=0);
% U=U(U~=0);
% V=V(U~=0);

%xlen=(xlen*ylen -length(X) -1)/ylen;
% % 
% % %%
% 
% pt=xlen*ylen-length(X);
% xlen=xlen-pt/ylen;


Xres=reshape(X, xlen,ylen)';
Yres=reshape(Y, xlen,ylen)';
Ures=reshape(U, xlen,ylen)';
Vres=reshape(V, xlen,ylen)';
% 
% idxX0=find(abs(X)<1);
% Xres = Xres(:,81:end);
% Yres = Yres(:,81:end);
% Ures = Ures(:,81:end);
% Vres = Vres(:,81:end);


%%
figure(2)
streamslice(Xres, Yres, Ures,Vres)
set(gca, 'FontSize', 14)

print('DELATWstreamplot','-depsc')
