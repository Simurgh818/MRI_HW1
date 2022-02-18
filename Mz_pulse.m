function [Mz_after] = Mz_pulse(alpha, T1, TR, Mz_white_initial)
%MZ_PULSE The total longitudinal Magnitization is calculated by summing
%   before and after the pulse.
% Mz_white_initial*
Mz_before = cos(alpha)*exp(-TR/T1)+(1-exp(-TR/T1));
Mz_after = Mz_before*cos(alpha)*exp(-TR/T1)+(1-exp(-TR/T1));

end

