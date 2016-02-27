clear all;

close all;

tspan = [0:1:10*365];

%

t0 = 0; %initial condition here

%

[t,temp] = ode45('SimpleOde',tspan,t0)

%

plot(t,temp);
title('insert title here');
xlabel('time');
ylabel('temp');

