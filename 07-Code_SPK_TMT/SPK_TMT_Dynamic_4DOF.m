%%
clc;
close all;
clear all;
syms the1 the2 the3 the4 dthe1 dthe2 dthe3 dthe4 L1 L2 L3 L4 d  m1 m2 m3 m4 ddthe1 ddthe2 ddthe3 ddthe4 g
w0=[0;0;0];
v0=[0;0;0];
P1c=[L1;0;0];
P2c=[L2;0;0];
P3c=[L3;0;0];
P4c=[L4;0;0];
assume(L1,'real');assume(L2,'real'); assume(L3,'real'); assume(L4,'real');assume(d,'real')
assume(the1,'real');assume(the2,'real');assume(the3,'real');assume(the4,'real');
assume(dthe1,'real');assume(dthe2,'real');assume(dthe3,'real');assume(dthe4,'real');
assume(ddthe1,'real');assume(ddthe2,'real');assume(ddthe3,'real');assume(ddthe4,'real');
assume(m1,'real');assume(m2,'real');assume(m3,'real');assume(m4,'real');
assume(g,'real');

%% Forward kinematics
[T01,R01,R10,P01]=FKrobot(0,0,d,the1);
[T12,R12,R21,P12]=FKrobot(-90,L1,0,the2);
[T23,R23,R32,P23]=FKrobot(0,L2,0,the3);
[T34,R34,R43,P34]=FKrobot(0,L3,0,the4);
%% Link 1
% Mass center position of first link in frame 0
TP01c=simplify(T01*[P1c;1]);
P01c=TP01c(1:3);
% Angular velocity in frame 1:
w1=R10*w0+dthe1*[0,0,1]';
% Linear velocity of the origin in frame 1:
v1=R10*(v0+[0   -w0(3)  w0(2);w0(3)   0   -w0(1);-w0(2) w0(1) 0]*P01);
% Linear velocity of the mass center in frame 1:
v01c=R01*(v1+[0   -w1(3)  w1(2);w1(3)   0   -w1(1);-w1(2) w1(1) 0]*P1c);

%% LINK 2
% Mass center position of first link in frame 0
TP02c=simplify(T01*T12*[P2c;1]);
P02c=TP02c(1:3);
% Angular velocity in frame 2:
w2=R21*w1+dthe2*[0,0,1]';
% Linear velocity of the origin in frame 2:
v2=R21*(v1+[0   -w1(3)  w1(2);w1(3)   0   -w1(2);-w1(2) w1(1) 0]*P12);
% Linear velocity of the mass center in frame 2:
v02c=R01*R12*(v2+[0   -w2(3)  w2(2);w2(3)   0   -w2(1);-w2(2) w2(1) 0]*P2c);
%% LINK 3
% Mass center position of first link in frame 0
TP03c=simplify(T01*T12*T23*[P3c;1]);
P03c=TP03c(1:3);
% Angular velocity in frame 3:
w3=R32*w2+dthe3*[0,0,1]';
% Linear velocity of the origin in frame 3:
v3=R32*(v2+[0   -w2(3)  w2(2);w2(3)   0   -w2(2);-w2(2) w2(1) 0]*P23);
% Linear velocity of the mass center in frame 3:
v03c=R01*R12*R23*(v3+[0   -w3(3)  w3(2);w3(3)   0   -w3(1);-w3(2) w3(1) 0]*P3c);
%% LINK 4
% Mass center position of first link in frame 0
TP04c=simplify(T01*T12*T23*T34*[P4c;1]);
P04c=TP04c(1:3);
% Angular velocity in frame 4:
w4=R43*w3+dthe4*[0,0,1]';
% Linear velocity of the origin in frame 4:
v4=R43*(v3+[0   -w3(3)  w3(2);w3(3)   0   -w3(2);-w3(2) w3(1) 0]*P34);
% Linear velocity of the mass center in frame 4:
v04c=R01*R12*R23*R34*(v4+[0   -w4(3)  w4(2);w4(3)   0   -w4(1);-w4(2) w4(1) 0]*P4c);

%% DYNAMIC 
%kinetic energies:
K=1/2*(m1*v01c'*v01c)...
    + 1/2*(m2*v02c'*v02c)...
    +1/2*(m3*v03c'*v03c)...
    +1/2*(m4*v04c'*v04c);
%Potential energies 
U=m1*[0 0 g]*P01c+m2*[0 0 g]*P02c+m3*[0 0 g]*P03c+m4*[0 0 g]*P04c;

%% Lagrange funtion
L=simplify(K-U);
dLddthe1=diff(L,dthe1);
dLddthe2=diff(L,dthe2);
dLddthe3=diff(L,dthe3);
dLddthe4=diff(L,dthe4);
dLdthe1=diff(L,the1);
dLdthe2=diff(L,the2);
dLdthe3=diff(L,the3);
dLdthe4=diff(L,the4);
%% Differential
t1=simplify(diff(dLddthe1,the1)*dthe1+diff(dLddthe1,the2)*dthe2+diff(dLddthe1,the3)*dthe3+diff(dLddthe1,the4)*dthe4...
    +diff(dLddthe1,dthe1)*ddthe1+diff(dLddthe1,dthe2)*ddthe2+diff(dLddthe1,dthe3)*ddthe3+diff(dLddthe1,dthe4)*ddthe4-dLdthe1);

t2=simplify(diff(dLddthe2,the1)*dthe1+diff(dLddthe2,the2)*dthe2+diff(dLddthe2,the3)*dthe3+diff(dLddthe2,the4)*dthe4...
    +diff(dLddthe2,dthe1)*ddthe1+diff(dLddthe2,dthe2)*ddthe2+diff(dLddthe2,dthe3)*ddthe3+diff(dLddthe2,dthe4)*ddthe4-dLdthe2);

t3=simplify(diff(dLddthe3,the1)*dthe1+diff(dLddthe3,the2)*dthe2+diff(dLddthe3,the3)*dthe3+diff(dLddthe3,the4)*dthe4...
    +diff(dLddthe3,dthe1)*ddthe1+diff(dLddthe3,dthe2)*ddthe2+diff(dLddthe3,dthe3)*ddthe3+diff(dLddthe3,dthe4)*ddthe4-dLdthe3);

t4=simplify(diff(dLddthe4,the1)*dthe1+diff(dLddthe4,the2)*dthe2+diff(dLddthe4,the3)*dthe3+diff(dLddthe4,the4)*dthe4...
    +diff(dLddthe4,dthe1)*ddthe1+diff(dLddthe4,dthe2)*ddthe2+diff(dLddthe4,dthe3)*ddthe3+diff(dLddthe4,dthe4)*ddthe4-dLdthe4);

M=simplify([diff(t1,ddthe1) diff(t1,ddthe2) diff(t1,ddthe3) diff(t1,ddthe4);
            diff(t2,ddthe1) diff(t2,ddthe2) diff(t2,ddthe3) diff(t2,ddthe4);
            diff(t3,ddthe1) diff(t3,ddthe2) diff(t3,ddthe3) diff(t3,ddthe4);
            diff(t4,ddthe1) diff(t4,ddthe2) diff(t4,ddthe3) diff(t4,ddthe4);])
G=simplify([diff(U,the1);diff(U,the2);diff(U,the3);diff(U,the4)])
v=simplify([t1;t2;t3;t4]-G-M*[ddthe1;ddthe2;ddthe3;ddthe4])

