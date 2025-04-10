% for one subject, export coordinates to csv
% left_coords = M.elstruct(1).coords_mm{1,1}; % Left electrode coordinates (4x3)
% right_coords = M.elstruct(1).coords_mm{1,2}; % Right electrode coordinates (4x3)
% coords = [left_coords, right_coords];
% header = {'Left_X', 'Left_Y', 'Left_Z', 'Right_X', 'Right_Y', 'Right_Z'};
% data_with_header = [header; num2cell(coords)];
% writetable(cell2table(data_with_header), '/Users/jp1590/Desktop/electrode_coordinates.csv', 'WriteVariableNames', false);

% output csv of all subjects' coordinates
all_data = {};

for sub = 1:102
    left_coords = M.elstruct(sub).coords_mm{1,1}; % Left electrode coordinates (4x3)
    right_coords = M.elstruct(sub).coords_mm{1,2}; % Right electrode coordinates (4x3)
    
    coords = [left_coords, right_coords]; % 4x6 matrix
    
    for contact = 1
        sub_id = sprintf('sub-S%02d', sub); % Format subject number as 'sub-S01', 'sub-S02', etc.
        
        % Add the subject number and contact number
        contact_label = sprintf('%s_contact%d', sub_id, contact); 
        
        % Add this information to the coordinates (first column with contact label)
        all_data = [all_data; [contact_label, num2cell(coords(contact,:))]]; % Append to the list
    end
end

% Define a header for the CSV
header = {'Subject_Contact', 'Left_X', 'Left_Y', 'Left_Z', 'Right_X', 'Right_Y', 'Right_Z'};

% Combine header and data into a cell array
data_with_header = [header; all_data];

% Write the data to a CSV file
writetable(cell2table(data_with_header), '/Users/jp1590/Desktop/all_electrode_coordinates.csv', 'WriteVariableNames', false);
