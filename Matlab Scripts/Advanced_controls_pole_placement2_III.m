
clc;
clear;

tic
syms x_bar
syms k1 k2 d1 d2 M1 M2
syms s

A=[0 1 0 0;(-(k1+k2)/M1) (-(d1+d2)/M1) (k2/M1) (d2/M1);0 0 0 1;k2/M2 d2/M2 -k2/M2 -d2/M2];

B=[0 0 0 (1/M2)]';

C=[0 0 1 0];

char_matrix=eye(4)*s-A;
pretty(char_matrix)
%disp(Beta)
toc