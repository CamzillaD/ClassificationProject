x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

%Divide the data into test and training
trainingData = [x1all(1:30,:); x2all(1:30,:); x3all(1:30,:)];
testData = [x1all(31:50,:); x2all(31:50,:); x3all(31:50,:)];
targetData = [kron(ones(1,30),[1; 0; 0]) kron(ones(1,30),[0; 1; 0]) kron(ones(1,30),[0; 0; 1])];    

%constants
n_classes = 3;
n_attributes = size(trainingData,2);


W = zeros(n_classes,n_attributes+1);
alpha = 0.0005;

%training
%gradw_MSE = zeros(n_classes, n_attributes);
gradw_MSE = [1 0 0 0 0; 1 0 0 0 0; 1 0 0 0 0];

for m = 1:200
    for k = 1:size(trainingData,1)
          
        xk = [trainingData(k,:)' ; 1];
        gk = prediction(W, xk);
        gradw_MSE = gradw_MSE + (gk - targetData(k) .* gk .* ([1;1;1]-gk)) * xk.';
           
    end
    W = W - alpha*gradw_MSE;
end

test = prediction(W,[trainingData(1,:)';1]);


