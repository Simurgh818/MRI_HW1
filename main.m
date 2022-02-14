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
T = [0.5, 0.1, 1.5];
for p=1: length(T)

    time = [0:0.01:T(p)];
    Gauss = zeros(1, length(time));
    B1 = zeros(1,length(time));
    
    for t=1:length(time)
        B1(t) = alpha/(gamma*time(t));
    %     Gauss(t) = exp(-(time(t)-w_rf)^2/(2*(delta_w_rf)^2));
    %     B1(t) = Gauss(t)* (cos(w_rf*time(t)+alpha)*1i +...
    %         sin(w_rf*time(t) +alpha)*1j);
    
    end
    subplot(3,1,p)
    plot(time, B1)
    xlabel('msec')
    ylabel('Tesla')

end
f =  exp(-(t-w_rf)^2/(2*(delta_w_rf)^2))*(cos(w_rf*t+alpha)*1i + sin(w_rf*t +alpha)*1j);

% cycles = gamma* int(f,t,0, 1e-3);
% fprintf('The precession cycles in lab frame is %1.3g ', cycles);