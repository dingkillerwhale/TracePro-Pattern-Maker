# TracePro-Pattern-Maker
How to make the patter and upload to TracePro

**(1) Create Pattern in Matlab** `RndPat.m`: 

For example, 'RndPat.m' (create a random pattern)
-> Initial a small 4x4 matrix which contains half of zero and half of one, which means 50% open aperture. Each element equals the minimum feature of Mask Aperture, e.g. 6.5um
  
-> Shuffle the oder of all the elements to make a ‘random’ pattern block [4x4]
  
-> Extend one element to Nx that will be 6.5 x N by using 'kron' (if no need to multiplication, skip)
  
-> Fill new block into an empty matrix [256x256 or 1024x1024] and save the pattern

**(2) Write Scheme Commands in Matlab** `TraceProEditor_DPS_1024.m`:

-> Load the pattern

-> Find the 2-D coordinates of zero elements

-> Translate 2-D coordinates into real size of making the pattern [length, width and thickness]

-> Create txt file

-> Write the commands into the file with the real size of zero elements

**(3) Create pattern in TracePro** 

-> Change .txt file to .scm file so that it can be read in TracePro

-> Excute .scm file and Run

