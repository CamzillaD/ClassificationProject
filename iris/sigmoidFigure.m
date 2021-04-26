% Plot the sigmoid function to look at :)
x = -8:0.1:8;       % interval
sig = sigmoid(x);

figure
plot(x,sig)

function s = sigmoid(x)
s = 1./(1+exp(-x));
end