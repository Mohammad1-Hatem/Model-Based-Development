%% 
% Name: Mohammad Hatem
% Subject: Control System Project Using MATLAB Scripting
% Creating the Model
modelName = 'DynamicSubsystem';
new_system(modelName)
open_system(modelName)

%%
% Adding Main Blocks
add_block('simulink/Commonly Used Blocks/Subsystem',[modelName '/DynamicSubsystem'])
add_block('built-in/Gain',[modelName '/DynamicSubsystem/GainBlock'])
add_block('built-in/Scope',[modelName '/Scope'])
add_block('simulink/Sources/Sine Wave',[modelName '/Sinusoidal_Input'])

% add_block('simulink/Sources/Step',[modelName '/Step'])

%% 
% Connecting Blocks
delete_line([modelName '/DynamicSubsystem'], 'In1/1', 'Out1/1');
add_line(modelName, 'Sinusoidal_Input/1','DynamicSubsystem/1','autorouting','smart')
add_line([modelName '/DynamicSubsystem'], 'In1/1','GainBlock/1','autorouting','smart')
add_line([modelName '/DynamicSubsystem'], 'GainBlock/1','Out1/1','autorouting','smart')
add_line(modelName, 'DynamicSubsystem/1','Scope/1','autorouting','smart')

%%
% Configure Blocks
set_param([modelName '/DynamicSubsystem/GainBlock'], 'Gain','0.5')
set_param(modelName,'StopTime','20')
set_param(modelName,'Solver','ODE45')

%%
% Simulate the Model
sim(modelName)

%%
% Looping on the Blocks
BlockPath = find_system(modelName,'regexp','on','BlockType','.*')  %Path of each block
BlockType = get_param(BlockPath,'BlockType') %Type of each block

for i = 1:numel(BlockType)
    switch BlockType{i}
        case 'Subsystem'
            set_param(BlockPath{i},'BackgroundColor','Green')

        case {'Inport','Outport'}
            set_param(BlockPath{i},'BackgroundColor','Orange')

        case 'Gain'
            set_param(BlockPath{i},'BackgroundColor','Cyan')
        
        otherwise
            set_param(BlockPath{i},'BackgroundColor','White')

    end

end