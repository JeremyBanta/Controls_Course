

%Controlability of the system in question:
clc;
clear;

tic;
A=[0 1;-2 -3];

B=[1 -1]';

C=zeros(size(A,1));


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


