function [T,R,invR,P]=FKRobot(anpha,a,d,the)
T=[ cos(the)             -sin(the)               0             a;
    sin(the)*cosd(anpha)   cos(the)*cosd(anpha)    -sind(anpha)   -sind(anpha)*d;
    sin(the)*sind(anpha)   cos(the)*sind(anpha)    cosd(anpha)    cosd(anpha)*d;
               0                        0                   0               1];
R=T(1:3,1:3);
invR=R';
P=T(1:3,4);
end