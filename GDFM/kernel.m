function [A, q]=kernel(data, epsilon)

%% building kernel for kernel density estimate
% [A, q]=kernel(data, epsilon)
%
% parameters: 
%               data: (N x dim) array of N data points of dimension dim                            
% optional parameters:   
%               epsilon: scaling parameter for the kernel
%                        default 0.01
% return: [A, q]- kernel A and the density q
% Authors: Ralf Banisch, Zofia Trstanova 2017


if (nargin < 3)
    epsilon= 0.01;
   
end
if (~exist('epsilon'))
         epsilon= 0.01;
end
%%
r = sqrt(2*epsilon);

m = size(data,1);

[idx, D] = rangesearch(data,data,4*r); %compute all distances within range r
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
end;
A = sparse(xx,yy,exp(-vv.^2/epsilon),m,m);
q = sparse(1./sum(A,2)); %q is (kernel density estimate)^{-1}

end