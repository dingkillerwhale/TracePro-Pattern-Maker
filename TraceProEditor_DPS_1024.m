close all
clear all
clc

% Translate Matlab pattern file into Scheme file (TracePro)


% Randmask 256*256, Min Feature 26um*26um(1024*1024 6.5um * 6.5um) 50% Open
load('RP1024.mat');

figure;
imagesc(Min);
colormap copper;
colorbar;

N = 256;

[a,b] = find(Min==0);

side = 0.026; % mm(TracePro Unit) = 26um

% s = side*[(N+1)/2-a,(N+1)/2-b,zeros(size(a,1),1)];

Seq_Row = 3.328 - 0.013 - side*(a-1);
Seq_Col = 3.328 - 0.013 - side*(b-1);
Seq_Th = -0.0015/2*ones(size(a,1),1);

File_path = 'RndPat2.txt';


fID0 = fopen(File_path,'wt');

fprintf(fID0, '%s\n', '(define SetBlocks');
fprintf(fID0, '%s\n', '  (lambda ()');

% Each 2000 to 31500 max
for i = 31501:32768
    
Name_block = strcat('    (define SetBlocks_ID_',num2str(i));
Name_prop = strcat('    (property:apply-name SetBlocks_ID_',num2str(i),' "Block 1")');
Name_move = horzcat('    (edit:move SetBlocks_ID_',num2str(i),' ',num2str(Seq_Col(i)),' ',num2str(Seq_Row(i)),' ',num2str(Seq_Th(i)),')');


fprintf(fID0, '%s\n', Name_block); 
fprintf(fID0, '%s\n', '      (insert:block 0.026 0.026 0.0015) )');
fprintf(fID0, '%s\n', Name_prop);
fprintf(fID0, '%s\n', Name_move);


end

fprintf(fID0, '%s\n', '    )');
fprintf(fID0, '%s\n', '  )');





fclose(fID0);