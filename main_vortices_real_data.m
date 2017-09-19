%% Spectral clustering from generalized diffusion maps:
% Authors: Ralf Banisch, Zofia Trstanova 2017
% Analysis of two data sets that are imported in files experimental_data
% or experimental_data_crossflowplane

clear all;
clc;
close all;

% for experimental_data choose 1, for experimental_data_crossflowplane choose 2
exampleID=5; 

% create figure names according to the chosen data set
if exampleID==1
    experimental_data;
    exampleName='SIDE';
    epsilon=1.0;
    beta=1.0;
elseif exampleID==2
    experimental_data_crossflowplane;
    exampleName='CROSS';
    epsilon=1.0;
    beta=1.8;
elseif exampleID==3
    experimental_data_2;
    exampleName='SIDE_2_';
    epsilon=2.0;
    beta=0.5;
elseif exampleID==4
    experimental_data_crossflowplane_2;
    exampleName='CROSS_2_';
    epsilon=3.0;
    beta=0.5;
elseif exampleID==5
    experimental_data_deltaWing;
    exampleName='DELTAW';
    epsilon=1.0;
    beta=0.1;
end

MyFontSize=14;

%%

data=[X,Y];
velocities=[U, V];

% compute the local kernel and spectral decomposition 
[evals,evec]=local_kernel_diffusion_map(data, velocities, epsilon, beta);
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
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(222)
scatter(data(:,1), data(:,2), 5, evec(:,3))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(223)
scatter(data(:,1), data(:,2), 5, evec(:,4))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(224)
scatter(data(:,1), data(:,2), 5, evec(:,5))
xlabel('X')
ylabel('Y')
if(exampleID==1 || exampleID==3)
    hold on
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
print([exampleName,'ev_2to5'],'-depsc')


figure(32)
title(['Eigenvectors 6-9 ']);
subplot(221)
hold on
scatter(data(:,1), data(:,2), 5, evec(:,6))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(222)
scatter(data(:,1), data(:,2), 5, evec(:,7))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(223)
scatter(data(:,1), data(:,2), 5, evec(:,8))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(224)
scatter(data(:,1), data(:,2), 5, evec(:,9))
xlabel('X')
ylabel('Y')
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
print([exampleName,'ev_6to9'],'-depsc')


figure(33)
title(['Eigenvectors 10-13 ']);
subplot(221)
hold on
scatter(data(:,1), data(:,2), 5, evec(:,10))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(222)
scatter(data(:,1), data(:,2), 5, evec(:,11))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(223)
scatter(data(:,1), data(:,2), 5, evec(:,12))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
subplot(224)
scatter(data(:,1), data(:,2), 5, evec(:,13))
xlabel('X')
ylabel('Y')
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
print([exampleName,'ev_10to13'],'-depsc')

%%
% plot chosen eigenvectors
%defaukt  
ievidx=[2 3 4 5];

if (exampleID==2)
    ievidx=[2 6 7 9];
elseif (exampleID==3)
    ievidx=[2,5,7, 11, 12];%[2, 4, 8, 11, 13];%10, 13];
elseif (exampleID==4)
    ievidx=[2 3 4 5];
elseif (exampleID==5)
    ievidx=[2 3 4 5];
end

%%

figure(50)
subplot(221)
hold on
scatter(data(:,1), data(:,2), 5, evec(:,ievidx(1)))
hold on
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
title(['EV ', num2str(ievidx(1))])
xlabel('X')
ylabel('Y')

subplot(222)
scatter(data(:,1), data(:,2), 5, evec(:,ievidx(2)))
hold on
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
title(['EV ', num2str(ievidx(2))])
xlabel('X')
ylabel('Y')

subplot(223)
scatter(data(:,1), data(:,2), 5, evec(:,ievidx(3)))
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
title(['EV ', num2str(ievidx(3))])
xlabel('X')
ylabel('Y')

subplot(224)
scatter(data(:,1), data(:,2), 5, evec(:,ievidx(4)))

hold on
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end
title(['EV ', num2str(ievidx(4))])
xlabel('X')
ylabel('Y')

print([exampleName,'chosen_ev'],'-depsc')

%%
% cluster data using kmeans with respect to the selected eigenvectors
%IDX = kmeans(real(evec(:,clusteridx)),length(clusteridx),'replicates',100);

% plot chosen eigenvectors
if (exampleID ==2)
    IDX = kmeans(horzcat(real(evec(:,2))),2,'replicates',100);
    %IDX = kmeans(horzcat(real(evec(:,ievidx(1))),real(evec(:,ievidx(2))), real(evec(:,ievidx(3))),real(evec(:,ievidx(4)))),5,'replicates',100);

     
elseif (exampleID ==3)
    
    IDX = kmeans(horzcat(real(evec(:,ievidx(1))),real(evec(:,ievidx(2))), real(evec(:,ievidx(3))),real(evec(:,ievidx(4)))),6,'replicates',100);
    
elseif (exampleID ==1)
    IDX = kmeans(horzcat(real(evec(:,ievidx(1))),real(evec(:,ievidx(2))), real(evec(:,ievidx(3))),real(evec(:,ievidx(4)))),8,'replicates',100);

elseif (exampleID ==4)
    
   IDX = kmeans(horzcat(real(evec(:,2))),2,'replicates',100);
elseif(exampleID==5)
    
  %  IDX = kmeans(horzcat(real(evec(:,ievidx(1))),real(evec(:,ievidx(2))), real(evec(:,ievidx(3))),real(evec(:,ievidx(4)))),15,'replicates',100);
  
       IDX = kmeans(horzcat(real(evec(:,ievidx(1))),real(evec(:,ievidx(2)))),8,'replicates',100);
  
   
end

%%
% plot clustering
figure(41)
hold on
set(gca, 'FontSize', MyFontSize)
scatter(data(:,1), data(:,2), 40, IDX, 'filled')
xlabel('X')
ylabel('Y')
%title(['K-means clustering ']);
hold on
streamslice(Xres, Yres, Ures,Vres)
hold on
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end

print([exampleName,'vortex_clustered'],'-depsc')

%%
% % plot histogram that will show the distribution of the data w.r.t the
% % clustering, i.e. the volume of the clusters-
% % the idea is that one could use it as an information about the vortex
% % volume
% 
% figure(543)
% histogram(IDX, 'Normalization','probability')%'countdensity')


% %%
% hEV=figure(1000);
% hold on
% contourf(Xres', Yres', reshape(real(evec(:,2)), xlen, ylen),50,'Linestyle','None')
% set(gca, 'FontSize', MyFontSize)
% hold on
% streamslice(Xres, Yres, Ures,Vres)
% print([exampleName, 'vortex_EV2'],'-depsc')
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
if(exampleID==1 || exampleID==3)
    pl=patch(geometry,'FaceColor', [0.5,0.5,0.5], 'EdgeColor',[0.5,0.5,0.5],'faceAlpha',1,'HandleVisibility','off');
    xlim([X(1) X(end)])
    ylim([Y(1) Y(end)])

end

print([exampleName, 'EV2'],'-depsc')
