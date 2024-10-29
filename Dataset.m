% Load the normal and faulty datasets
load('OM_normal.mat', 'OM');
OM_normal = OM;  % Rename for clarity

load('OM_faulty.mat', 'OM');
OM_faulty = OM;  % Rename for clarity

% Assuming OM_normal and OM_faulty each have a time-series structure with 18 columns

% Extract data from the structure (adjust 'Data' to match the actual field name)
normal_data = OM_normal.Data;  % Replace 'Data' with the actual field name containing time series
faulty_data = OM_faulty.Data;  % Replace 'Data' with the actual field name containing time series

% Verify the dimensions of normal_data and faulty_data
% For example, if each has 18 columns over time, you could reshape or use as-is

% Add labels: 0 for normal, 1 for faulty
label_normal = zeros(size(normal_data, 1), 1);  % Label column for normal data
label_faulty = ones(size(faulty_data, 1), 1);   % Label column for faulty data

% Combine data and labels
OM_normal_labeled = [normal_data, label_normal];
OM_faulty_labeled = [faulty_data, label_faulty];

% Concatenate the datasets (assuming both have the same number of features)
combined_data = [OM_normal_labeled; OM_faulty_labeled];

% Save combined dataset
save('OM_combined_dataset.mat', 'combined_data');
disp('Combined dataset saved as OM_combined_dataset.mat');
