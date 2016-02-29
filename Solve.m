clear all;

close all;

tspan = [0.001:1:10*365];

%

t0 = 273; %initial condition here

%

[t,temp] = ode45('SimpleOde',tspan,t0)

%

plot(t,temp);
title('Variation of Temperature (K) with Time using the Relationship Between Solar Flux and Temperature');
xlabel('time');
ylabel('temp');
