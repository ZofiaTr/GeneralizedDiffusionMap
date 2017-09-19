function [eval,evec]=vanilla_diffusion_map(data, epsilon, beta)

%% Vanilla diffusion map:
% [eval,evec]=vanilla_diffusion_map(data, epsilon, beta)
% Computes the generalized diffusino map from Coifman Lafon 2010: 
% parameters: 
%               data: (N x dim) array of N data points of dimension dim                    
% optional parameters:
%               beta:  inverse temperature from the sampled Boltzmann distribution
%                      default 1.0
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

Anorm = diag(sqrt(q))*A*diag(sqrt(q));
K = diag(sparse(1./sum(Anorm,2)))*Anorm;
L_diff = 4/(beta*epsilon)*(K - diag(sum(K,2)));

[evec, eval] = eigs(L_diff,10,'lr');

[eval, B] = sort(real(diag(eval)),'descend');
evec = evec(:,B);

end