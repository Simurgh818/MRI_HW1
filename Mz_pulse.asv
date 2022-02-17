function [Mz_after] = Mz_pulse(alpha, T1)
%MZ_PULSE The total longitudinal Magnitization is calculated by summing
%   before and after the pulse.
time = 100;
Mz_before = cos(alpha)*exp(-time/T1)+(1-exp(-time/T1));
Mz_after = Mz_before*cos(alpha)*exp(-time/T1)+(1-exp(-time/T1));

end

