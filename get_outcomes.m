% sub_id = cellstr(M.elstruct.name);
outcomes = M.clinical.vars{1,1};

data_table = table(outcomes);
data_table.Properties.VariableNames = {'seizRed24Month'};
writetable(data_table, '/Users/jp1590/Desktop/sante_outcomes.csv', 'WriteVariableNames', true);
