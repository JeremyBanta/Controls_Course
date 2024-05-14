%Pole placement 2
%problem 2
clc;
clear;
tic
A=[0 1 0;0 0 1;0 -4 -5];

syms s;

A_minus_BK=A-[0 0 0;0 0 0;2190 369 32.8];

system_poly=det(eye(3)*s-A_minus_BK);
system_poly=(expand(system_poly));
zeros_of_poly=solve(system_poly==0,s);
second_order_system=vpa(expand((s-zeros_of_poly(2))*(s-zeros_of_poly(3))),12);
H1=coeffs(second_order_system);
omega_n=sqrt(H1(1));
zeta=H1(2)/(2*omega_n);
OS_percent=exp(-zeta*pi/sqrt(1-zeta^2))*100;
Ts=4/(zeta*omega_n);
disp(vpa(OS_percent,9));
disp(Ts);
toc