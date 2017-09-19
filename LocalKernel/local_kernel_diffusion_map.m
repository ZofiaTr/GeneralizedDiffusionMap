function [eval,evec]=local_kernel_diffusion_map(data, b, epsilon, beta)

%% Local kernel diffusion map:
% [eval,evec]=local_kernel_diffusion_map(data, b, epsilon, beta)
% Computes the generalized diffusino map from Banisch, Trstanova et al 2017: 
% The local kernel for operator L with b = -\nabla U,   A = \beta^{-1}I
% parameters: 
%               data: (N x dim) array of N data points of dimension dim                    
%               b: size(data) array of velocities
% optional parameters:
%               beta:  in A = \beta^{-1}I
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

[idx, D] = rangesearch((data-epsilon*b),data,4*r); %compute all distances within range r
%---assemble sparse matrix keps(xi,xj)------
lv = length( [ idx{:} ] ); %the total number of nonzero entries, so we can preallocate
xx = zeros(1,lv);
yy = zeros(1,lv);
vv = zeros(1,lv);
icurr = 1;
for i=1:m
    li = length(idx{i});
    xx(icurr:(icurr+li-1)) = i;
    yy(icurr:(icurr+li-1)) = idx{i};
    vv(icurr:(icurr+li-1)) = D{i};
    icurr = icurr + li;
end
W = sparse(xx,yy,exp(-beta*vv.^2/(4*epsilon)),m,m);

Dq = diag(q);
W = W*Dq;
L_loc = diag(sparse(1./sum(W,2)))*W;
L_loc = 1/epsilon*(L_loc - diag(sum(L_loc,2)));

% Eigenvalues and Eigenvectors: firstN
firstN=15;
[evec, eval] = eigs(L_loc,firstN,'lr');

% sort in descending order according to the real value of eigenvalues
[eval, B] = sort(real(diag(eval)),'descend');
evec = evec(:,B);


end