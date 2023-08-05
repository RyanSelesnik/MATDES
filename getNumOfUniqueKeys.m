function count = getNumOfUniqueKeys(key)

% Function that returns the number of unique subkeys derived from
% DES key scheduling

pc1 = [57 49 41 33 25, 17 9 1 58 50 42 34 26 18 10 2 59 51 ...
    43 35 27 19 11 3 60 52 44 36 63 55 47 39 31 23 15 7 62 ...
    54 46 38 30 22 14 6 61 53 45 37 29 21 13 5 28 20 12 4];

subKeys = string.empty(16,0);

key = dec2bin(sscanf(key, '%lx'),64);
key = permutation(key, pc1);

for i = 1:16
    subKeys(i) = getSubKeys(key,i, "encrypt");
end

count = size(unique(subKeys),2);

end