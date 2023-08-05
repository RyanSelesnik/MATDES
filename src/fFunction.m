function mask = fFunction(R, subKey)

% --------------------------------------------------------------
% Function that takes the  32 bit right half of the previous 
% round, and the current subkey. The output is used as a mask 
% to encrypt the left half of the previous round
% --------------------------------------------------------------

% Expansion
eTable = [32 1 2 3 4 5 4 5 6 7 8 9 8 9 10 11 12 13 12 ...
    13 14 15 16 17 16 17 18 19 20 21 20 21 22 23 24 25 ...
    24 25 26 27 28 29 28 29 30 31 32 1];
expandedR = permutation(R, eTable);

% XOR epanded string and subkey 
expandedR = strcat('0b', expandedR);
expandedR = str2num(expandedR);

subKey = strcat('0b', subKey);
subKey = str2num(subKey);

expandedR = dec2bin(bitxor(expandedR, subKey),48);

% Sbox substitution
sOut = substitution(expandedR);

% permutation
P = [16 7 20 21 29 12 28 17 1 15 23 26 5 18 31 10 2 8 ...
    24 14 32 27 3 9 19 13 30 6 22 11 4 25];
mask = permutation(sOut, P);

end