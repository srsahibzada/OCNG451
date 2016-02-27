function dy = SimpleOde(t,temp)
%
lat = 0;   % Set the latitude here
%

declination = 23.5;
eccentricity = 0.016;
radians = 2*pi/360;
frequency = 2*pi/365.25;
solar_intensity = 1370/pi;
sigma = 5.67*10^-8;
radius_of_earth = (6371*1000).^2;
density = 1; % density of water is 1000 kgm^-3
sphc = 4.186;
hmix = 1000;
%

% Specify Qin (heating) and Qout (cooling) here

%
solar_angle = cos((lat*(pi/180) - (declination*(pi/180)) * cos(frequency*(t-170))));
distance_from_sun =  (1-eccentricity * cos(frequency * t - 10))^2;
Qin = solar_intensity*(solar_angle / distance_from_sun);
Qout = sigma*temp.^4 * 4*pi*radius_of_earth;
%

dy = (Qin-Qout)*(1/(density * sphc * hmix));
%


% Solve.m


end
