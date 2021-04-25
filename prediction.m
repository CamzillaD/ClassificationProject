function g = prediction(W,x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
g = 1./(1+exp(-W*x));
end
