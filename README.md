
# MATDES - MATLAB Implementation of the Data Encryption Standard (DES)
*Ryan Selesnik*

In order to exchange information across a channel securely, the information or plaintext should be encrypted on the sender's end, and decrypted on the receiver's end. DES allows for this. Although there are more secure forms of encryption, DES is still used in some applications today and is one of the most studied block ciphers. This report examines the design, cohesion, and implementation of the DES algorithm. 

## Sub-key Function
An integral part of the DES algorithm is the sub-key generation. The function takes a 56-bit string `K_pc_1` (derived from the main key), an index, and derives each sub-key `K_i` for a particular round. It also takes in an argument, "operation", which determines whether the function should perform the encryption or decryption key generation. This is discussed in further detail in Section 6.

## Calculating the Number of Unique Keys
To calculate the number of unique sub-keys derived from the main key `K`, an array of sub-keys is populated with all 16 sub-keys. Then, using the built-in function, `unique()`, passing the array of sub-keys to it will return an array of unique sub-keys. 

## Round Function
This function performs each round of encryption. The function takes in a 64-bit block, in the form of a left half and right half, and a 48-bit sub-key, `K_i`.

## The f-function
The f-function consists of 3 main operations: expansion, S-box substitution, and permutation.

## Implementing the DES Algorithm
Now, using the sub-key generation function and the round function, the DES algorithm can be implemented. All that's left to add is an initial permutation `IP`, an initial key permutation `PC_1`, and a final permutation `IP^-1`.

## Decryption
A major advantage of DES is that the encryption and decryption are essentially the same operation. In fact, the decryption algorithm uses the exact same functions mentioned above. Instead, the encrypted text is the input rather than the plaintext. 

## Results
The results were tested using a DES website. The sub-key function is tested; however, the results are not presented here since if the main DES function works, it implies that the sub-key generation also works.

## Discussion
The design of the DES code was based around binary strings. Since the input is given in hexadecimal, it needs to be converted to binary using Matlab's built-in functions. 

## Conclusion
Ultimately, the design of the DES algorithm and required calculations, such as the number of unique keys, were discussed, and the implementation in Matlab, was successful.

## References
1. C. Paar and J. Pelzl. Understanding cryptography: a textbook for students and practitioners. Springer Science & Business Media, 2009.
2. L. Cheng. "Modern Symmetric Ciphers." [Link](http://dept.ee.wits.ac.za/~cheng/ELEN3015/Files/DES.pdf). Accessed: 2021-04-30.
3. "Can you explain 'weak keys' for DES?" [Link](https://crypto.stackexchange.com/questions/12214/can-you-explain-weak-keys-for-des). Accessed: 2021-04-30.
4. A. J. Menezes, P. C. Van Oorschot, and S. A. Vanstone. Handbook of applied cryptography. CRC press, 2018.
