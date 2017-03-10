clear all
close all
clc

% Dual-Prism Pattern Generator (Random Pattern)  
% Extend Single Pixel to 4 times
% CMOS pixel feature: 6.5um * 6.5um 
% Coded Aperture Mask pixel feature: (4*6.5um) * (4*6.5um) = 26um * 26um
% Code Array Size: 1024 * 1024 
% Half Clear and Half Opeque

Mat = zeros(1024);
Min = zeros(256);

A = [0 0 1 0 ...
     1 1 0 1 ...
     0 0 1 0 ...
     0 1 1 1]; % Intial Matrix


for i = 1 : 16 : 1024
    for j = 1 : 16 : 1024
 
Order = randperm(16);

Reorder = reshape(Order,4,4); % Shuffle Int Mat 

Upsample = kron(Reorder,[1,1,1,1;1,1,1,1;1,1,1,1;1,1,1,1]); % Extend 4 times

ii = floor(i/16);
jj = floor(j/16);

Min(ii*4+1:ii*4+4,jj*4+1:jj*4+4) = A(Reorder);
Mat(i:i+15,j:j+15) = A(Upsample);
    end
end 
 
figure;imagesc(Mat);colormap copper;
title('4X Random Pattern'); 
 
figure;imagesc(Min);colormap copper;
title('Initial Random Pattern'); 
 
 
 
 
 
 