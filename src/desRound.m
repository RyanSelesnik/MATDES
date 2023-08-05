function [Lout, Rout] = desRound(Lin, Rin, subKey)

% ------------------------------------------------
% Function that performs a round of DES 
% ------------------------------------------------

fout = fFunction(Rin, subKey);

% converting from binary to decimal in order to 
% perform a bitwise XOR.
fout = strcat('0b', fout);
fout = str2num(fout);
Lin = strcat('0b', Lin);
Lin = str2num(Lin);

% XOR fout with left half of previous round
Rout = dec2bin(bitxor(fout, Lin),32);

Lout = Rin; 

end