function [] = solarforcing(lat)

radians = pi / 180; % for cleanliness, introduce radians conversion
declination = 23.5 * radians;
lat = lat * radians;   % Set the latitude here
eccentricity = 0.016;
frequency = 2*pi/365.25;
solar_intensity = 1370/pi;
sigma = 5.67*10^-8; % watts / m^2 * K^4
sphc = 4186; % joule * kgram / kelvin
hmix = 0.0; % m
density = 1025; % kgram / m^3
time_units = 60*60*24;

zenith_angle = @(t) cos(lat - declination .* cos(frequency.*(t-170)) ); % to start at beginning of year
distance_from_sun =  @(t) (1 - eccentricity .* cos(frequency .* (t-10))).^2; % 10 - perihelion
Qin = @(t)  solar_intensity*zenith_angle(t) ./ distance_from_sun(t);
%Qout = sigma*temp.^4;

f = @(t) Qin(t);
x = linspace(0,365,365);
plot(x,f(x));
title('Variation of Solar Forcing with Time, Equator ');
xlabel('Time (days)');
ylabel('Solar Forcing (W/m^2)');
end
