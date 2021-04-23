function [g] = prediction(W,xk)

g = 1./ (1+exp(-W*xk));

end

