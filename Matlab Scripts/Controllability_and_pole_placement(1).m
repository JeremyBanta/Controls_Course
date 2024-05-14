
clc;
clear;
tic;
A=[0 1;-2 -3];

B=[1 -1]';

syms s k1 k2 omega1

A_minus_BK=A-[0 0;k1 k2];

C=zeros(size(A,1));

for num=0:(size(A,1)-1)
    
    
    C(:,(num+1))=(A^num)*B;
    
    
    
end


if(rank(C)~=size(A,1))
    
    disp('The system is not controllable');
    
    
else

system_poly=det(eye(2)*s-A_minus_BK);
OS=5;
Ts=0.3;
zeta=-log(OS/100)/sqrt(pi^2+(log(OS/100))^2);
omega_n=vpa(solve(Ts==4/(omega1*zeta),omega1),9);

desired_poly=vpa(expand((s^2+2*zeta*omega_n*s+omega_n^2)),9);
H1=coeffs(desired_poly,s);
H2=coeffs(system_poly,s);
H1(end)=[];
H2(end)=[];

Gains=solve(H1==H2,[k1, k2]);
Gains=struct2cell(Gains);
Gains=[Gains{:}];
disp(Gains)


 disp('The system is controllable');
 
end

toc

