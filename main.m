% BMED 6210: MRI Homework 1
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2021  Sina Dabiri
% sdabiri@emory.edu
% 
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by the
% Free Software Foundation; either version 2 of the License, or (at your
% option) any later version.
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
% Public License for more details.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w_rf = 63.835e6; 
delta_w_rf = 2550;
alpha = 90; 
gamma = 42.5e6;
T = [0.5, 1.0, 1.5];
for p=1: length(T)

    time = [0:0.01:T(p)];
    Gauss = zeros(1, length(time));
    B1 = zeros(1,length(time));
    
    for t=1:length(time)
        Gauss(t) = exp(-(time(t)-0.5*T(p))^2/(2*(0.25*T(p))^2));
        B1(t) = Gauss(t)* (cos(w_rf*time(t)+alpha) +...
            sin(w_rf*time(t) +alpha));
    
    end
%     subplot(3,1,p)
%     plot(time, B1)
%     xlabel('msec')
%     ylabel('B1 (Tesla)')

end
%% Problem 2
T1_gray = 920;% in msec
T1_white = 780; % in msec
alpha = pi/4; % 45 degree in radians is pi/4
TR = 100; % in msec
num_pulse = 20;
time = 0:1:2000;
Mz_grey = zeros(1, length(time));
Mz_white = zeros(1, length(time));

Mz_grey(1) = cos(alpha)*exp(-time(1)/T1_gray);
Mz_white(1) = cos(alpha)*exp(-time(1)/T1_white);
Mz_white_initial = Mz_white(1);
for p=1:20
    
    for t=2:length(time)
%         Mz_grey(t) = M0*cos(alpha)*exp(-time(t)/T1_gray);
        if mod(time(t),TR)==0
            Mz_white(t) = Mz_pulse(alpha, T1_white, TR);
            Mz_white_initial = Mz_white(t);
        else
            Mz_white(t) = Mz_white_initial+(1-exp(-time(t)/T1_white));
        end
    end
end

