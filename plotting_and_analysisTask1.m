%%plotting confusion matrix
figure
C = confusionmat(testlab,finalLables);
confusionchart(C,{'0','1','2','3','4','5','6','7','8','9'});

%%finding the error rate
confchart = confusionchart(C,{'0','1','2','3','4','5','6','7','8','9'});
confchart.RowSummary = 'row-normalized';
confchart.ColumnSummary = 'column-normalized';
confchart.Title = 'NN classifier with Euclidian distance';


%plotting numbers:
%%Classified wrong

%classified as 9 but was 4
figure
subplot(2,2,1)
x = zeros(row_size, col_size); 
x(:)= testv(7,:);
image(x');

%classified as 8 was 5
subplot(2,2,2)
x = zeros(row_size, col_size); 
x(:)= testv(9,:);
image(x');

%classified as 3 was 5
subplot(2,2,3)
x = zeros(row_size, col_size); 
x(:)= testv(16,:);
image(x');

%classified as 1 was 7
subplot(2,2,4)
x = zeros(row_size, col_size); 
x(:)= testv(98,:);
image(x');


%%Classified correctly

figure
subplot(2,2,1)
%classified as 7 and was 7
y = zeros(row_size, col_size); 
y(:)= testv(1,:);
image(y');

subplot(2,2,2)
%classified as 2 and was 2
y = zeros(row_size, col_size); 
y(:)= testv(2,:);
image(y');

subplot(2,2,3)
%classified as 1 and was 1
y = zeros(row_size, col_size); 
y(:)= testv(3,:);
image(y');

subplot(2,2,4)
%classified as 0 and was 0
y = zeros(row_size, col_size); 
y(:)= testv(4,:);
image(y');
 
 
 
 
