x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

% Plotting the histograms of the different attributes of the variants
% together

figure
subplot(2,2,1)
hold on
histogram(x1all(:,1),10)
histogram(x2all(:,1),10)
histogram(x3all(:,1),10)
legend('Setosa','Versicolor','Virginica')
xlabel('Sepal Length')
hold off

subplot(2,2,2)
hold on
histogram(x1all(:,2),10)
histogram(x2all(:,2),10)
histogram(x3all(:,2),10)
legend('Setosa','Versicolor','Virginica')
xlabel('Sepal Width')
hold off

subplot(2,2,3)
hold on
histogram(x1all(:,3),10)
histogram(x2all(:,3),10)
histogram(x3all(:,3),10)
legend('Setosa','Versicolor','Virginica')
xlabel('Petal Length')
hold off

subplot(2,2,4)
hold on
histogram(x1all(:,4),10)
histogram(x2all(:,4),10)
histogram(x3all(:,4),10)
legend('Setosa','Versicolor','Virginica')
xlabel('Petal Width')
hold off
