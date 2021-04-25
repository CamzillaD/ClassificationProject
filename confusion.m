C = 3;

data = predClassTraining;
class = zeros(1,size(data,1));

for i = 1:size(data,1)
   if i < 31
       class(i) = 1;
   elseif i < 61
       class(i) = 2;
   else
       class(i) = 3;
   end
end


classHat = zeros(1,size(data,1));

for i = 1:size(data,1)
   for n = 1:C
       if data(i,n) == 1
           classHat(i) = n;
       end
   end
end
confmat = confusionmat(class, classHat);
figure
confchart = confusionchart(confmat,{'Setosa','Versicolor','Virginica'});
confchart.Title = 'Iris data set';
confchart.RowSummary = 'row-normalized';
confchart.ColumnSummary = 'column-normalized';


