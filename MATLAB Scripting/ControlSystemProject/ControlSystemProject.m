%% Name: Mohammad Hatem
%% Subject: Control System Project Using MATLAB Scripting
%% Creating the Model
modelName = 'ControlSystemProject';
new_system(modelName)
open_system(modelName)

%% Adding Main Blocks
add_block('simulink/Sources/Step',[modelName '/Step'])
add_block('simulink/Continuous/Transfer Fcn',[modelName '/System'])
add_block('built-in/Scope',[modelName '/Scope'])
add_block('built-in/Sum',[modelName '/Sum'])
add_block('simulink/Continuous/PID Controller',[modelName '/Controller'])

%% Configure Blocks
set_param([modelName '/Sum'], 'Inputs','+-') %Adjusting the signs of sum blocks
set_param([modelName '/Scope'], 'NumInputPorts','2') %Make 2 scope's input ports
set_param([modelName '/System'],'Denominator','[1 1 1]') %Construct 2nd order system
set_param(modelName,'StopTime','20') %Making the simulation time = 20 sec

%% Connecting Blocks
add_line(modelName,'Step/1','Scope/1','autorouting','smart')
add_line(modelName,'Step/1','Sum/1','autorouting','smart')
add_line(modelName,'Sum/1','Controller/1','autorouting','smart')
add_line(modelName,'Controller/1','System/1','autorouting','smart')
add_line(modelName,'System/1','Scope/2','autorouting','smart')
add_line(modelName,'System/1','Sum/2','autorouting','smart')

%% Tune PID Constants
set_param([modelName '/Controller'],'P','2','I','1','D','0.5')
%% Simulate the Model
sim(modelName)