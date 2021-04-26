function g = prediction(W,x)
% prediction returns the prediction using the sigmoid function
%   W: matrix used in the discriminant function
%   x: vector of attributes

g = 1./(1+exp(-W*x));
end
