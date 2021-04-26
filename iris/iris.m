x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

% ATTRIBUTES: Sepal length, Sepal Width, Petal Length, Petal Width
%Divide the data into test and training with target
dataTraining = [x1all(1:30,:); x2all(1:30,:); x3all(1:30,:)];
t1 = [1; 0; 0]; t2 = [0; 1; 0]; t3 = [0; 0; 1];
dataTarget = [kron(ones(1,30),t1) kron(ones(1,30),t2) kron(ones(1,30),t3)];
dataTest = [x1all(31:50,:); x2all(31:50,:); x3all(31:50,:)];

% Division of data for task with last 30 as training and first 20 as test
%dataTraining = [x1all(21:end,:); x2all(21:end,:); x3all(21:end,:)];
%t1 = [1; 0; 0]; t2 = [0; 1; 0]; t3 = [0; 0; 1];
%dataTarget = [kron(ones(1,30),t1) kron(ones(1,30),t2) kron(ones(1,30),t3)];
%dataTest = [x1all(1:20,:); x2all(1:20,:); x3all(1:20,:)];

% Dropping Attributes (1 is Sepal length, 2 is Sepal Width, 3 is Petal
% Length, 4 is Petal Width)
%dataTraining(:,4) = [];
%dataTest(:,4) = [];
%dataTraining(:,3) = [];
%dataTest(:,3) = [];
%dataTraining(:,1) = [];
%dataTest(:,1) = [];

% constants
C = 3;      % number of classes
D = 4;      % number of attributes (4 if none are dropped)

tic % Start to measure time to complete calculations here

calculateNewW = true;  % true to calc W, false to not
if calculateNewW
    W_0 = zeros(C,D);   % initial W
    w_0 = zeros(C, 1);  % initial w (offset)
    W = [W_0 w_0];
    alpha = 0.01;       % step length
    
    steps = 200000;      % iterations (amount of steps to take)
    MSE_List = zeros(1,steps);  % preallocating a list of MSE for every iteration
  
    for m = 1:steps    
        MSE = 0;
        gradw_MSE = zeros(C,D+1);
        for k = 1:size(dataTraining,1)
            xk = [dataTraining(k,:)'; 1];
            gk = prediction(W, xk);
            gradw_MSE = gradw_MSE + (((gk - dataTarget(:,k)) .* gk .* (1-gk))* xk.');
            MSE = MSE + 0.5*(gk-dataTarget(:,k)).'*(gk-dataTarget(:,k));
        end
        W = W - alpha*gradw_MSE;
        MSE_List(1,m) = MSE;
    end
end
toc    % End time measurement

% Prediction for the training data
predTraining = zeros(90,3);
for i = 1:90
    predTraining(i,:) = prediction(W,[dataTraining(i,:)';1]);
end
predClassTraining = findClass(predTraining, C);

% Prediction for the test data
predTest = zeros(60,3);
for i = 1:60
    predTest(i,:) = prediction(W,[dataTest(i,:)';1]);
end
predClassTest = findClass(predTest, C);

function predClass = findClass(predData, C)
%findClass: Returns a matrix where the index with a 1 is the predicted class
%   predData: A matrix where each row is a the prediction for one entity
%   C: the number of classes

dataSamples = size(predData,1);
predClass = zeros(dataSamples,C);
    for i = 1:dataSamples
       c = 1;
       gk = predData(i,1);
       for n = 2:C
           if predData(i,n) > gk
               c = n;
               gk = predData(i,c);
           end
       end
       predClass(i,c) = 1;
    end
end 