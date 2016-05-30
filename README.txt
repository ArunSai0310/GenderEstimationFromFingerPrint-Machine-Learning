Files in the folder and Description:

"feature_extract.m" It takes in the location of the training images as input, also make sure that the train.csv file is also in the same location. And returns the training images feature vector as a matrix of size 14000X769 and a vector of labels.

"feature_extract_test.m" It takes the location of the test images and returns the testing feature vector of size 7000X769.

"PredictRegression.m" Takes the above returned data as input and returns a vector of predicted probabilities.



Follow the steps below for execution 

Step 1: Execute the function named "feature_extract.m" by passing the location of the training images as input which returns a matrix of feature vectors for the training images and the labels.
	
	So the execution can be as [im,labels] = feature_extract('C:\Users\ArunSai\Documents\MATLAB\MLProject\images\train\');

Step 2: Execute the function named "feature_extract_test.m" by passing the location of the test images which returns test images feature vector.

        [im_test] = feature_extract_test('C:\Users\ArunSai\Documents\MATLAB\MLProject\images\test\');

Step 3: Pass the obtained Feature vectors and label to the function "PredictionRegression.m" which returns the predicted vector.

	[ prediction ] = PredictionRegression( im,labels,im_test );