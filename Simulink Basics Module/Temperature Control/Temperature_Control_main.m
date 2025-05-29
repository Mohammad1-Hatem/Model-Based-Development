

clc
clear all
close all

Ku = 5;
taw = 4;
T0 = 0;

%Tset = 30;
t = 0:0.01:10;
Tset=5;
u = zeros(length(Tset));
u(t>=2) = Tset;


mdl = gcs;

tawValues = [1 2 4];

legendLabel_1 = cell(1, numel(tawValues));  % Preallocate
% legendLabel_2 = "T_set = "+Tset;

%plot([0,10],[Tset,Tset],'LineWidth',1.25);
plot(t,u,'LineWidth', 2)
hold on

for i = 1 : numel(tawValues)

    taw = tawValues(i);
    res = sim(mdl);

    plot(res.logsout.get("T(t)").Values,'LineWidth',1.25);
    grid on
    ylim([0, 1.1*Tset]);

    legendLabel_1{i} = "taw = " + num2str(taw);

end


legendLabels = ["T_{set} = " + num2str(Tset), legendLabel_1];
legend(legendLabels, 'Location', 'best');
