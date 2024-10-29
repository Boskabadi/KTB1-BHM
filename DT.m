% Load the combined dataset
load('OM_combined_dataset.mat', 'combined_data');

% Separate the 17th column as features and the last column as labels
X = combined_data(:, 8);  % Feature (17th column)
Y = combined_data(:, end);  % Labels (last column)

% Split the data into training (70%) and testing (30%)
cv = cvpartition(size(X, 1), 'HoldOut', 0.3);
idx = cv.test;

% Separate to training and testing sets
X_train = X(~idx, :);
Y_train = Y(~idx, :);
X_test = X(idx, :);
Y_test = Y(idx, :);

% Train a classification model (Decision Tree)
model = fitctree(X_train, Y_train);

% Predict using the testing set
Y_pred = predict(model, X_test);

% Evaluate the model's performance
confusionMat = confusionmat(Y_test, Y_pred);
accuracy = sum(diag(confusionMat)) / sum(confusionMat(:));

% Display results
disp('Confusion Matrix:');
disp(confusionMat);
disp(['Accuracy: ', num2str(accuracy * 100), '%']);
