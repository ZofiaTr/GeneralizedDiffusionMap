function [ fx ] = odefun( t, x, Fu, Fv )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fx = [Fu(x(1),x(2)), Fv(x(1), x(2))]';

end

