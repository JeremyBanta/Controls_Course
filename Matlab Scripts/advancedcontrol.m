clc;
clear;

A=[0 1 0;0 0 1;0 -36 -15];

syms s;
syms k1 k2 k3;

syms omega_n;

OS=5;

zeta=-log(OS/100)/sqrt(pi^2+(log(OS/100))^2);

Pt=0.3;

A_minus_BK=A-[0 0 0;0 0 0;k1 k2 k3];

char_poly=det(eye(3)*s-A_minus_BK);

omega_n=double(solve(pi/(omega_n*sqrt(1-zeta^2))==0.3,omega_n));


desired_poly=(expand((s+30)*(s^2+2*zeta*omega_n+omega_n^2)));

H1=vpa(coeffs(char_poly,s),15);
H2=vpa(coeffs(desired_poly,s),15);
H1(end)=[];
H2(end)=[];