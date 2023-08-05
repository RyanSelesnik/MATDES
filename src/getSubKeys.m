
function subKey = getSubKeys(key, index, operation)

% -----------------------------------------------------------------------
% Function that takes in a 56 bit key, and an index, and returns a
% specific 48 bit subkey
% -----------------------------------------------------------------------

% Split key into C0 and D0
c = key(1:28);
d = key(29:56);

if operation == "encrypt"
    shift = -1;
    start = 1;
elseif operation == "decrypt"
    shift = 1;
    start = 2;
else
    error("Please enter a valid operation")
end

for i = start:index
    if i == 1 || i == 2 || i == 9 || i == 16
        c = circshift(c, shift);
        d = circshift(d, shift);
    else
        c = circshift(c, 2*shift);
        d = circshift(d, 2*shift);
    end
    
end

pc2 = [14 17 11 24 1 5 3 28 15 6 21 10 23 19 12 4 26 ... 
    8 16 7 27 20 13 2 41 52 31 37 47 55 30 40 51 45 ...
    33 48 44 49 39 56 34 53 46 42 50 36 29 32];
subKey = permutation(strcat(c,d),pc2);
end