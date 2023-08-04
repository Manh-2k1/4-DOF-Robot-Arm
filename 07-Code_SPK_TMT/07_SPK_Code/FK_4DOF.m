function P_EE=FK_4DOF(the1,the2,the3,the4)
l1=150; l2=350; l3=363.5; l4=210;
d1=140;
P_EE= [cosd(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(the2+the3+the4));
       sind(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(the2+the3+the4));
       d1-l3*sind(the2+the3)-l2*sind(the2)-l4*sind(the2+the3+the4);
       1;];
end
   
       
       