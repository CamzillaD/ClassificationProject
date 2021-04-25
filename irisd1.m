x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

% ATTRIBUTES: Sepal length, Sepal Width, Petal Length, Petal Width

%Divide the data into test and training
dataTraining = [x1all(1:30,:); x2all(1:30,:); x3all(1:30,:)];
t1 = [1; 0; 0]; t2 = [0; 1; 0]; t3 = [0; 0; 1];
dataTarget = [kron(ones(1,30),t1) kron(ones(1,30),t2) kron(ones(1,30),t3)];

dataTest = [x1all(31:50,:); x2all(31:50,:); x3all(31:50,:)];

% Dropping Sepal Width:
dataTraining(:,4) = [];
dataTest(:,4) = [];
dataTraining(:,3) = [];
dataTest(:,3) = [];
dataTraining(:,1) = [];
dataTest(:,1) = [];

%constants
C = 3;      % number of classes
D = 1;      % number of attributes

tic
calculateNewW = true;  % line to decide if we want to calculate a new W each time we run the script
if calculateNewW
    W_0 = zeros(C,D);   % initial W
    w_0 = zeros(C, 1);  % initial w (offset)
    W = [W_0 w_0];
    alpha = 0.01;       % step length
    
    steps = 200000;      % iterations (amount of steps to take)
    MSE_List = zeros(1,steps);
  
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
toc

% Prediction for the training data
predTraining = zeros(90,3);
for i = 1:90
    predTraining(i,:) = prediction(W,[dataTraining(i,:)';1]);
end

predClassTraining = findClass(predTraining, C);

predTest = zeros(60,3);
for i = 1:60
    predTest(i,:) = prediction(W,[dataTest(i,:)';1]);
end

predClassTest = findClass(predTest, C);

function predClass = findClass(predData, C)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

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






