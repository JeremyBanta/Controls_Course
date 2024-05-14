
clc;
clear;
%Controllability problem number 3:
%Jeremy Banta Advanced Control Systems

tic;

A=[0 1 0 0;-(9/50) 0 (9/50) 0;0 0 0 1;1 0 -1 -1];
B=[0 9/1500 0 0]';
C=[10/3 0 0 0]';

%source / destination:
%state variables 

for num=0:(size(A,1)-1)
    
    
    C(:,(num+1))=(A^num)*B;
    
    
    
end

disp(C);
Beta=rank(C)
if(rank(C)~=size(A,1))
    
    disp('The system is not controllable');
    
    
else
    
    
    disp('The system is controllable');
end

toc;