function permutedStr = permutation(str, permutationTable)

n = size(permutationTable,2);
permutedStr = char.empty(n,0);

for i = 1:n
    permutedStr(i) = str(permutationTable(i));
end
end