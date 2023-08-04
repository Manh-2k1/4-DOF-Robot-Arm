%% VE KHONG GIAN LAM VIEC CHO ROBOT NOI TIEP
clc;
close all;
clear all;
l1=150; d1=140; l2=350; l4=210; l3=363.5;
emt=[]; emt1=[]; emt2=[]; emt3=[];
%% Workpace 1
 i=0;
for the1=0:170
    for the2=0:90
        for the3=-90:90 
            if the2==0 || the2 == 90 || the1 == 0 || the1 ==170
                    i=i+1;
                    x=cosd(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(0));
                    y=sind(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(0));
                    z=d1-l3*sind(the2+the3)-l2*sind(the2)-l4*sind(0);
                    emt(i,:) = [x, y, z];     
            end
        end
    end
end
%% Workpace 2
  i=0;
  for the1=0:2:170
    for the2=-90:2:0
        for the3=-90:2:90  
            if the2==0 || the2 == -90 || the1 == 0 || the1 ==170
                    i=i+1;
                    x=cosd(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(0));
                    y=sind(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(0));
                    z=d1-l3*sind(the2+the3)-l2*sind(the2)-l4*sind(0);
                    emt1(i,:) = [x, y, z];   
            end
        end
     end
  end
%% Workpace 3
 i=0;
   for the1=-170:2:0
      for the2=-90:2:0
        for the3=-90:2:90 
            if the2==0 || the2 == -90 || the1 == 0 || the1 ==-170
                    i=i+1;
                    x=cosd(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(0));
                    y=sind(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(0));
                    z=d1-l3*sind(the2+the3)-l2*sind(the2)-l4*sind(0);
                    emt2(i,:) = [x, y, z]; 
            end
         end
      end
   end
  %% Workpace 4
   i=0;
   for the1=-170:2:0
    for the2=0:2:90
        for the3=-90:2:90  
            if the2==0 || the2 == 90 || the1 == 0 || the1 ==-170
                    i=i+1;
                    x=cosd(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(0));
                    y=sind(the1)*(l1+l3*cosd(the2+the3)+l2*cosd(the2)+l4*cosd(0));
                    z=d1-l3*sind(the2+the3)-l2*sind(the2)-l4*sind(0);
                    emt3(i,:) = [x, y, z];  
            end
        end
    end
   end
%% VE KHONG GIAN LAM VIEC 

plot3(emt(:,1),emt(:,2),emt(:,3),'.r','MarkerSize',3);
hold on;
plot3(emt1(:,1),emt1(:,2),emt1(:,3),'.b','MarkerSize',3); 
hold on;
plot3(emt2(:,1),emt2(:,2),emt2(:,3),'.m','MarkerSize',3);
hold on;
plot3(emt3(:,1),emt3(:,2),emt3(:,3),'.k','MarkerSize',3);
hold on;
grid on;




