%%Name: Mohammad Hatem
%%Subject: Lab1 
%%Title: Open Loop - First Order System Analysis 

clc
clear all
close all

k = 1;
taw = 1;

num=k;
den=[taw 1];

G = tf(num,den);

t = 0:0.01:10;

figure;

unitstep = zeros(size(t));
unitstep(t>=1) = 1;
plot(t,unitstep,'b','LineWidth',1.5)
legend('Unit Step')
hold on
grid on

k_values = [0.1 0.5 1 2];

for i = 1:numel(k_values)

OpenLoopSystem_Variable_k = k_values(i)*G;

[OpenLoopSystem_Variable_k,~] = step(OpenLoopSystem_Variable_k,t);
plot(t,OpenLoopSystem_Variable_k,'LineWidth',1.2);

hold on

    legendLabel{i} = "Kp = " + num2str(k_values(i));

end

legend(['Unit step';legendLabel'],'Location','best');  %This line took an effort to be adjusted
title('Open Loop - First Order System with variable K')
%%

tau_values = [0.5 1 2];

figure;

unitstep = zeros(size(t));
unitstep(t>=1) = 1;
plot(t,unitstep,'b','LineWidth',1.5)
legend('Unit Step')
hold on
grid on

for i = 1:numel(tau_values)

OpenLoopSystem_Variable_tau = tf(k, [tau_values(i) 1]);

[OpenLoopSystem_Variable_tau,~] = step(OpenLoopSystem_Variable_tau,t);
plot(t,OpenLoopSystem_Variable_tau,'LineWidth',1.2);

hold on

legendLabel{i} = "\tau = " + num2str(tau_values(i));
end

legend(['Unit step';legendLabel'],'Location','best');  %This line took an effort to be adjusted
title('Open Loop - First Order System with variable \tau')