% Check if the variable OM exists in the workspace
if exist('OM', 'var')
    % Save OM to a .mat file named OM_faulty.mat
    save('OM_faulty.mat', 'OM');
    disp('Faulty dataset saved as OM_faulty.mat');
else
    disp('OM does not exist in the workspace.');
end
