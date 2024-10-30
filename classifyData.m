function label = classifyData(inputData)
    % Load the trained model (persistent to avoid reloading each time)
    persistent model;
    if isempty(model)
        modelData = load('trainedLRModel.mat', 'model');
        model = modelData.model;
    end
    
    % Predict the label based on the 17th feature column
    label = predict(model, inputData);
end
