%% Spectral clustering from generalized diffusion maps:
% Authors: Ralf Banisch, Zofia Trstanova 2017
% Analysis of the data set imported in file experimental_data

clear all;
clc;
close all;

if(exist('Figures')==0)
    mkdir('Figures')
end

% create figure names according to the chosen data set
%% load data from G. Rossitto, C. Sicot, V. Ferrand, J. Bor ?ee, and F. Harambat. Influence of afterbody rounding on the pressure distribution over a fastback vehicle. Experiments in Fluids, 57(3):43, 2016.

load('experimental _data.mat');

%%
figure(2)
streamslice(Xres, Yres, Ures,Vres)
set(gca, 'FontSize', 14)
hold on
rectangle('Position',[X(1) Y(1), 145 50], 'FaceColor', [1,1,1], 'EdgeColor',[1,1,1])
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])
print('Figures/CAR_streamplot','-depsc')


%%
exampleName='Figures/CAR_FLOW_';
epsilon=2.0;
beta=0.5;

MyFontSize=14;

%%

data=[X,Y];
velocities=[U, V];

cd ..
cd('GDFM')
% compute the local kernel and spectral decomposition

[evals,evec]=LKDmap(data, velocities, epsilon, beta);
cd ('../FlowVisualisation');

%%
% plot eigenvalues
figure(12);
hold on
plot(evals, '*')
xlabel('index')
ylabel('Eigenvalue')
set(gca, 'FontSize', MyFontSize)
print([exampleName,'eigenvalue'],'-depsc')


%%
% visualise first 13 eigenvectors: use this part to identify 4
% characteristic eigenvectors that will be used for clustering
figure(31)
title(['Eigenvectors 2-5 ']);
subplot(221)
hold on
scatter(data(:,1), data(:,2), 5, evec(:,2))
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


subplot(222)
scatter(data(:,1), data(:,2), 5, evec(:,3))

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])

subplot(223)
scatter(data(:,1), data(:,2), 5, evec(:,4))
 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


subplot(224)
scatter(data(:,1), data(:,2), 5, evec(:,5))
xlabel('X')
ylabel('Y')
hold on
 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])

print([exampleName,'ev_2to5'],'-depsc')


figure(32)
title(['Eigenvectors 6-9 ']);
subplot(221)
hold on
scatter(data(:,1), data(:,2), 5, evec(:,6))

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


subplot(222)
scatter(data(:,1), data(:,2), 5, evec(:,7))

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


subplot(223)
scatter(data(:,1), data(:,2), 5, evec(:,8))

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


subplot(224)
scatter(data(:,1), data(:,2), 5, evec(:,9))
xlabel('X')
ylabel('Y')

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


print([exampleName,'ev_6to9'],'-depsc')


figure(33)
title(['Eigenvectors 10-13 ']);
subplot(221)
hold on
scatter(data(:,1), data(:,2), 5, evec(:,10))

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


subplot(222)
scatter(data(:,1), data(:,2), 5, evec(:,11))

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


subplot(223)
scatter(data(:,1), data(:,2), 5, evec(:,12))

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


subplot(224)
scatter(data(:,1), data(:,2), 5, evec(:,13))
xlabel('X')
ylabel('Y')

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


print([exampleName,'ev_10to13'],'-depsc')

%%
% plot chosen eigenvectors
ievidx=[2,5,7, 11, 12];

%%

strslColor='k';
strSlWDTH=0.1;
nrSlWDTH=0.3;


figure(50)
subplot(221)
hold on
scatter(data(:,1), data(:,2), 5, evec(:,ievidx(1)))
hold on
hlines =streamslice(Xres, Yres, Ures,Vres, nrSlWDTH);
set(hlines,'LineWidth',strSlWDTH,'Color',strslColor)
hold on

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


title(['\psi_{', num2str(ievidx(1)-1), '}'], 'Fontsize', MyFontSize)
xlabel('X')
ylabel('Y')

subplot(222)
scatter(data(:,1), data(:,2), 5, evec(:,ievidx(2)))
hold on
hlines =streamslice(Xres, Yres, Ures,Vres, nrSlWDTH);
set(hlines,'LineWidth',strSlWDTH,'Color',strslColor)

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


title(['\psi_{', num2str(ievidx(2)-1), '}'], 'Fontsize', MyFontSize)
xlabel('X')
ylabel('Y')

subplot(223)
scatter(data(:,1), data(:,2), 5, evec(:,ievidx(3)))
hold on
hlines =streamslice(Xres, Yres, Ures,Vres, nrSlWDTH);
set(hlines,'LineWidth',strSlWDTH,'Color',strslColor)

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


title(['\psi_{', num2str(ievidx(3)-1), '}'], 'Fontsize', MyFontSize)
xlabel('X')
ylabel('Y')


subplot(224)
scatter(data(:,1), data(:,2), 5, evec(:,ievidx(4)))
hold on
hlines =streamslice(Xres, Yres, Ures,Vres, nrSlWDTH);
set(hlines,'LineWidth',strSlWDTH,'Color',strslColor)
hold on

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])


title(['\psi_{', num2str(ievidx(4)-1), '}'], 'Fontsize', MyFontSize)
xlabel('X')
ylabel('Y')

print([exampleName,'chosen_ev'],'-depsc')

%%
% cluster data using kmeans with respect to the selected eigenvectors
% and plot chosen eigenvectors


IDX = kmeans(horzcat(real(evec(:,ievidx(1))),real(evec(:,ievidx(2))), real(evec(:,ievidx(3))),real(evec(:,ievidx(4)))),6,'replicates',100);


%%
% plot clustering


strslColor='k';
strSlWDTH=0.5;
nrSlWDTH=1;


figure(41)
hold on
set(gca, 'FontSize', MyFontSize)
h=pcolor(Xres, Yres, reshape(IDX, xlen, ylen)');
set(h, 'EdgeColor', 'none')
xlabel('X')
ylabel('Y')
hold on
hlines =streamslice(Xres, Yres, Ures,Vres, nrSlWDTH);
set(hlines,'LineWidth',strSlWDTH,'Color',strslColor)

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])

print([exampleName,'vortex_clustered'],'-depsc')



%%
% plot the dominant eigenvector only
dominantEVidx=2;
figure(101)
Vplot = real(evec(:,dominantEVidx));
Vplot = Vplot - (min(Vplot) + max(Vplot))/2;
Vplot = Vplot/max(Vplot);
hold on
contourf(Xres, Yres, reshape(Vplot, xlen, ylen)',50,'Linestyle','None')
contour(Xres, Yres, reshape(Vplot, xlen, ylen)',0.9*[min(Vplot), 0, max(Vplot)],'w','Linewidth',1)

set(gca, 'FontSize', MyFontSize)
hold on
streamslice(Xres, Yres, Ures,Vres)
hold on

 
xlim([X(1) X(end)])
ylim([Y(1) Y(end)])



print([exampleName, 'EV2'],'-depsc')

