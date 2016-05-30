%this function takes in the training feature vectors, the labels and the
%testing feature vectors as parameters and returns the predicted
%probabilities

function [ prediction ] = PredictionRegression( im,labels,im_test )


%input training feature vector, labels to the regression function ‘glmfit’ which returns a vector ‘b’ of coefficient estimates 
b = glmfit(im,labels,'binomial');

%input vector 'b' and testing feature vector to function ‘glmval’ 
%which computes and returns predicted values in form of probabilities for the generalized linear model
[prediction] = glmval(b,im_test,'logit');


end

