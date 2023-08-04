function the=IK_4DOF(Px,Py,Pz,phi)
l1=150; l2=350; l3=363.5; l4=210;
d1=140;
 % tim the1
the(1)=atan2d(Py,Px);
Px=Px-l4*cosd(the(1))*cosd(phi);
Py=Py-l4*sind(the(1))*cosd(phi);
Pz=Pz+l4*sind(phi);

 %tim theta3 >0
 nx=Px*cosd(the(1))+Py*sind(the(1))-l1;
 ny=Pz-d1;
 c3=(nx*nx+ny*ny-l3*l3-l2*l2)/(2*l2*l3);
 s3=sqrt(1-c3^2);
 the(3)=atan2d(s3,c3);
 %tim theta2 >0;
 the(2)=atan2d(-((ny*(l3*cosd(the(3))+l2)+l3*sind(the(3))*nx)),-((-nx*(l3*cosd(the(3))+l2)+l3*sind(the(3))*ny)));
 %tim theta4 
 the(4)=phi-the(2)-the(3);
 the=[the(1);the(2);the(3);the(4);];
 
 