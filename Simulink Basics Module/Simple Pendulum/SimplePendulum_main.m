% Name: Mohamad Hatem Mohammad Saeed
% Lab_3
% Simple Pendulum Simulation
%

clc
clear all
close all

mdl = gcs;  % Get current Simulink model
g = 9.8;
q0 = 0.2;

lValues = 1:2:5;  % [1, 3, 5]
legendLabel = cell(1, numel(lValues));  % Preallocate

figure(1); 
hold on; grid on; 
title('Angular Displacement (q)'); 
ylim([-2*q0, 2*q0]);


figure(2); 
hold on; grid on; 
title('Angular Velocity (dq)'); 
ylim([-5*q0, 5*q0]);

for i = 1:numel(lValues)
    L = lValues(i);
    res = sim(mdl);

    % Plot q in Figure 1
    figure(1)
    plot(res.logsout.get('q').Values, 'LineWidth', 1.25);

    % Plot dq in Figure 2
    figure(2)
    plot(res.logsout.get('dq').Values, 'LineWidth', 1.25);

    legendLabel{i} = "L = " + num2str(L);

    disp("Simulation " + num2str(i) + " Completed")
end

% Add legends after all plots are done
figure(1); legend(legendLabel);
figure(2); legend(legendLabel);
