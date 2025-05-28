%% Name: Mohamad Hatem Mohammad Saeed
%% Lab_4
%% RC Circuit Simulation
%%

clc
clear all
close all

%givens
R = 1;
C = 1e-6;

%Initial condition in Vc = 0

mdl = gcs;

RValues = 1:2:5;

legendLabel = cell(1, numel(RValues));  % Preallocate


for i = 1:numel(RValues) 

    R = RValues(i);

    res = sim(mdl);

    plot(res.logsout.get("Vc").Values);
    hold on
    axis tight
    legendLabel{i} = "R = " + num2str(R);

end

legend(legendLabel);
