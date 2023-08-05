function sOut = sBox(InputStr, sBox_n)

% ---------------------------------------------
% Function that returns the output from each 
% s-box
% ---------------------------------------------

% Get row index 
row = [InputStr(1) InputStr(6)];
row = bin2dec(row) + 1;

% Get column index 
col = InputStr(2:5);
col = bin2dec(col) + 1;

% Select 4 bit string from nth S box
sOut = dec2bin(sBox_n(row,col),4);

end