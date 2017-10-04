function [eval,evec]=TMDmap(data, targetDistribution, epsilon, beta)

%% Target distribution kernel diffusion map:
% [eval,evec]=target_density_diffusion_map(data, targetDistribution, epsilon, beta)
% Computes the generalized diffusino map for a target distribution from any data set as proposed in Banisch, Trstanova et al 2017: 
% parameters: 
%               data: (N x dim) array of N data points of dimension dim   
%               target distribution: (N x 1) array of N data points, i.e. 
%                                    requires
%                                    (length(targetDistribution))==length(data))
%                                    for example the target distribution is 
%                                    the canonical (Boltzmann) disitribution,
%                                    i.e. exp(-\beta U): example
%                                                beta = 8.0;
%                                                V_traj = potential_2D(data);
%                                                targetDistribution=exp(-beta*V_traj);
% optional parameters:
%               beta:  inverse temperature
%                       default 1.0
%               epsilon: scaling parameter for the kernel
%                        default 1.0
% return: [eval,evec] - firstN eigenvalues and eigenvectors of L
% Authors: Ralf Banisch, Zofia Trstanova 2017

if (nargin < 4)
    epsilon=1.0;
    beta = 1.0;
end
if (~exist('epsilon'))
         epsilon=1.0;
end
if (~exist('beta'))
         beta=1.0;
end

r = sqrt(2*epsilon);
m = size(data,1);

[A, q]=kernel(data);

% weights
weights = sqrt(targetDistribution);

D = diag(sparse(weights.*q));

K = A*D;
K = diag(sparse(1./sum(K,2))) * K;
L_loc = 4/(beta*epsilon)*(K - diag(sum(K,2)));

%Eigenvalues and Eigenvectors
[evec, eval] = eigs(L_loc,10,'lr');


[eval, B] = sort(real(diag(eval)),'descend');
evec = evec(:,B);


end