function dy = SimpleOde(t,temp)
%

%
radians = pi / 180; % for cleanliness, introduce radians conversion
declination = 23.5 * radians;
lat = -30 * radians;   % Set the latitude here
eccentricity = 0.016;
frequency = 2*pi/365.25;
solar_intensity = 1370/pi;
sigma = 5.67*10^-8; % watts / m^2 * K^4
sphc = 4186; % joule * kgram / kelvin
hmix = 100.0; % m
density = 1025; % kgram / m^3
time_units = 60*60*24;
%

% Specify Qin (heating) and Qout (cooling) here

%
solar_angle = cos(lat - declination * cos(frequency*(t-170)) );
distance_from_sun =  (1 - eccentricity * cos(frequency * (t - 10)))^2;
Qin = solar_intensity*solar_angle / distance_from_sun;
Qout = sigma*temp.^4;
%

dy = ((Qin-Qout)*time_units)/((density * sphc * hmix)/1);
%


% Solve.m


end
