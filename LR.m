% Load the combined dataset
load('OM_combined_dataset.mat', 'combined_data');

% Separate the 17th column as features and the last column as labels
X = combined_data(:, 17);  % Feature (17th column)
Y = combined_data(:, end);  % Labels (last column)

% Split the data into training (70%) and testing (30%)
cv = cvpartition(size(X, 1), 'HoldOut', 0.3);
idx = cv.test;

% Separate to training and testing sets
X_train = X(~idx, :);
Y_train = Y(~idx, :);
X_test = X(idx, :);
Y_test = Y(idx, :);

% Train a logistic regression classification model
model = fitclinear(X_train, Y_train, 'Learner', 'logistic');

% Predict probabilities for ROC and class labels for accuracy/confusion
[Y_pred, scores] = predict(model, X_test);

% Evaluate the model's performance
confusionMat = confusionmat(Y_test, Y_pred);
accuracy = sum(diag(confusionMat)) / sum(confusionMat(:));

% Display results
disp('Confusion Matrix:');
disp(confusionMat);
disp(['Accuracy: ', num2str(accuracy * 100), '%']);

% --- Enhanced Visualization Section for Publication ---

% Plot Confusion Matrix with simplified settings and green colormap
figure(1);
cm = confusionchart(confusionMat, {'Normal', 'Faulty'});
cm.Title = 'Confusion Matrix for Logistic Regression';
cm.FontSize = 14;  % Set a larger font size for readability

% Customizing color map to green shades
colormap([0.9 1 0.9; 0.7 0.9 0.7; 0.4 0.7 0.4; 0.2 0.5 0.2]); % Light to dark green

% Save the figure as a high-resolution image
saveas(gcf, 'Confusion_Matrix_LR_Green.png'); % Save as PNG
print(gcf, 'Confusion_Matrix_LR_Green', '-dpng', '-r300'); % Save as high-resolution 300 DPI
