function [Mz_after] = Mz_pulse(alpha, T1, TR)
%MZ_PULSE The total longitudinal Magnitization is calculated by summing
%   before and after the pulse.

Mz_before = cos(alpha)*exp(-TR/T1)+(1-exp(-TR/T1));
Mz_after = Mz_before*cos(alpha)*exp(-TR/T1)+(1-exp(-TR/T1));

end

