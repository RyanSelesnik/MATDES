function cipher = DES(plainText,key,operation)

% ----------------------------------------------------------------
% Function that uses the DES algorithm to decrypt/encrypt a 64-bit
% string with a 64-bit key.
%
% Usage:
% To perform encryption: DES(hexString, hexKey, "encrypt")
% To perform decryption: DES(hexString, hexKey, "decrypt")
% ----------------------------------------------------------------

plainText = dec2bin(sscanf(plainText, '%lx'),64);

% Initial permuation
IP = [58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20, ...
    12, 4, 62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32,...
    24, 16, 8, 57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, ...
    27, 19, 11, 3, 61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, ...
    39, 31, 23, 15, 7];
ipOut = permutation(plainText, IP);

% Split into left and right half
leftHalf = ipOut(1:32);
rightHalf = ipOut(33:64);

% PC-1 permutation
key = dec2bin(sscanf(key, '%lx'),64);
pc1 = [57, 49, 41, 33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18, ...
    10, 2, 59, 51, 43, 35, 27, 19, 11, 3, 60, 52, 44, 36, 63, ... 
    55, 47, 39, 31, 23, 15, 7, 62, 54, 46, 38, 30, 22, 14, 6, ...
    61, 53, 45, 37, 29, 21, 13, 5, 28, 20, 12, 4 ];
key = permutation(key, pc1);

for i = 1:16
    subKey = getSubKeys(key,i,operation);
    [leftHalf, rightHalf] = desRound(leftHalf, rightHalf, subKey);
end

cipher = [rightHalf leftHalf];

% Final permutation
IPinverse = [40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55,...
    23, 63, 31, 38, 6, 46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53,...
    21, 61, 29, 36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51,...
    19, 59, 27, 34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41, 9, 49, 17,...
    57, 25];
cipher = permutation(cipher, IPinverse);

% Convert from binary to hex
%
% Note: 'bin2dec' was not used since "Binary numbers representing
% integers greater than or equal to flintmax might not be represented
% exactly as double-precision floating-point values". An alterntive
% that I came up with:
cipher = strcat('0b', cipher);
cipher = dec2hex(str2num(cipher));