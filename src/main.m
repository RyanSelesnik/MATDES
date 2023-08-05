
%% DES demonstration script

% This script demonstrates the working of tasks 1 to 5

% Usage:
% Use the "Run Section" or "Run and "Advance" command

%% 1. The sub key function
clc
% Takes in a 56 bit binary string, the round index, and an operation 
% argument.``Operation'' determines whether the encryption 
% or decryption key generation should be performed 

chars = ['0','1'];
% Gets a random 56 bit string 
randString = chars(randi(numel(chars), 1, 56))

% Showing subkeys for different rounds
subKey1 = getSubKeys(randString, 1, "encrypt")
subKey4 = getSubKeys(randString, 4, "encrypt")
subKey8 = getSubKeys(randString, 8, "encrypt")
subKey16 = getSubKeys(randString, 16, "encrypt")


%% 2. Unique sub-keys
clc

% Takes in a 64 bit hex key and derives the number of unique sub-keys 

% Inputs:
K_1 = '1F1F1F1F0E0E0E0E'; K_2 = '1FFE1FFE0EFE0EFE'; 
K_3 = '1FFEFE1F0EFEFE0E';

uniqueKeys1 = getNumOfUniqueKeys(K_1)
uniqueKeys2 = getNumOfUniqueKeys(K_2)
uniqueKeys3 = getNumOfUniqueKeys(K_3)

fprintf('%s is a weak key\n', K_1);
fprintf('%s is half of a semi-weak key pair\n', K_2);
fprintf('%s is a possibly weak key\n', K_3');

%% 3. The round function 
clc

% The round function takes in a 64 bit string ( in the form of a left
% half and right half), and the rounds subkey. It returns the 
% encrypted left half and the right half from the previous round.

% Get a random string to test
chars = ['0','1'];
randString = chars(randi(numel(chars), 1, 64))
leftHalf = randString(1:32); rightHalf = randString(33:64);

disp('round 1');
keyString = '10001000111010101001101100001111101101111100001000000100';
subKey = getSubKeys(keyString,1, "encrypt");
[leftHalf, rightHalf] = desRound(leftHalf,rightHalf,subKey)


%% 4. DEA algorithm
clc

% The main DES function that performs the DEA on a 64 bit plain text 
% with a 64 bit key. It returns the cipher text.

% Run section multiple times to check multiple arbitrary inputs 

% Get a random plain text and key 
chars = ['A':'F','1':'9'];
plainText = chars(randi(numel(chars), 1, 16))
key = chars(randi(numel(chars), 1, 16))

cipher = DES(plainText, key, "encrypt")

%% 5. Decryption
clc

% Perform decryption on previous cipher
newPlainText = DES(cipher, key, "decrypt")

disp('Check that plain text is the same:');
newPlainText == plainText
