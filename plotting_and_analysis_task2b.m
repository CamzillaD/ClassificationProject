%%plotting confusion matrix
figure
C = confusionmat(testlab,FinalLables);
confusionchart(C,{'0','1','2','3','4','5','6','7','8','9'});

%%finding the error rate
confchart = confusionchart(C,{'0','1','2','3','4','5','6','7','8','9'});
confchart.RowSummary = 'row-normalized';
confchart.ColumnSummary = 'column-normalized';
confchart.Title = 'NN classifier with clustering';
