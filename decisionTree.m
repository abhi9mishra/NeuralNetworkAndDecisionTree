%# load data
load carsmall

%# construct predicting attributes and target class
vars = {'MPG' 'Cylinders' 'Horsepower' 'Model_Year'};
x = [MPG Cylinders Horsepower Model_Year];  %# mixed continous/discrete data
y = cellstr(Origin);  

t = fitctree(x, y, 'PredictorNames',vars, ...
    'CategoricalPredictors',{'Cylinders', 'Model_Year'}, 'Prune','off');
view(t, 'mode','graph')

y_hat = predict(t, x);
cm = confusionmat(y,y_hat);
N = sum(cm(:));
err = ( N-sum(diag(cm)) ) / N

tt = prune(t, 'Level',3);
view(tt)

predict(tt, [33 4 78 NaN])