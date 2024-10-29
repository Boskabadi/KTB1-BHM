% Check if the variable OM exists in the workspace
if exist('OM', 'var')
    % Save OM to a .mat file named OM_normal.mat
    save('OM_normal.mat', 'OM');
    disp('Normal dataset saved as OM_normal.mat');
else
    disp('OM does not exist in the workspace.');
end
