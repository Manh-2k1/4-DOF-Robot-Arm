% Simscape(TM) Multibody(TM) version: 5.1

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(11).translation = [0.0 0.0 0.0];
smiData.RigidTransform(11).angle = 0.0;
smiData.RigidTransform(11).axis = [0.0 0.0 0.0];
smiData.RigidTransform(11).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 -3.3306690738754696e-13 99.999999999999972];  % mm
smiData.RigidTransform(1).angle = 3.1415926535897896;  % rad
smiData.RigidTransform(1).axis = [-1 -0 -0];
smiData.RigidTransform(1).ID = 'B[Part1-1:-:Part2-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [3.8344285583992423 -6.4837024638109142e-13 -136.22422760428813];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897896;  % rad
smiData.RigidTransform(2).axis = [1 -6.0951964013910361e-30 -3.4914700743951353e-15];
smiData.RigidTransform(2).ID = 'F[Part1-1:-:Part2-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [153.83442855840039 1.1102230246251565e-13 3.775772395710808];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931935;  % rad
smiData.RigidTransform(3).axis = [0.57735026918962506 -0.57735026918962506 0.57735026918962717];
smiData.RigidTransform(3).ID = 'B[Part2-1:-:Part3-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-5.8675714372995984e-12 2.036332487067819e-11 5.3138392903098395e-13];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [1 5.6472820287292076e-32 3.3099433353418776e-16];
smiData.RigidTransform(4).ID = 'F[Part2-1:-:Part3-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [350.00000000000011 0 -1.1102230246251565e-13];  % mm
smiData.RigidTransform(5).angle = 3.1415926535897896;  % rad
smiData.RigidTransform(5).axis = [-1 -0 -0];
smiData.RigidTransform(5).ID = 'B[Part3-1:-:Part4-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [9.9472918674228366e-13 -1.0893695835253232e-12 6.1092486509261604e-14];  % mm
smiData.RigidTransform(6).angle = 3.14159265358979;  % rad
smiData.RigidTransform(6).axis = [-1 3.9777179482885846e-30 -2.45881002416554e-15];
smiData.RigidTransform(6).ID = 'F[Part3-1:-:Part4-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [224.99999999999966 10.000000000001673 38.000000000001641];  % mm
smiData.RigidTransform(7).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(7).axis = [0.57735026918962173 0.57735026918962584 0.57735026918962973];
smiData.RigidTransform(7).ID = 'B[Part4-1:-:Part5-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [-132.32130096497468 10.000000000000021 38.000000000000057];  % mm
smiData.RigidTransform(8).angle = 2.0943951023931948;  % rad
smiData.RigidTransform(8).axis = [0.57735026918962595 0.57735026918962584 0.57735026918962573];
smiData.RigidTransform(8).ID = 'F[Part4-1:-:Part5-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [0 1.1102230246251565e-13 -22.499999999999964];  % mm
smiData.RigidTransform(9).angle = 0;  % rad
smiData.RigidTransform(9).axis = [0 0 0];
smiData.RigidTransform(9).ID = 'B[Part5-1:-:Part6-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [3.1619151741324458e-13 -7.3541173151170369e-13 -22.500000000001087];  % mm
smiData.RigidTransform(10).angle = 6.2372898663299414e-15;  % rad
smiData.RigidTransform(10).axis = [-0.98383293861516818 0.17908866210858448 -5.4948441937976166e-16];
smiData.RigidTransform(10).ID = 'F[Part5-1:-:Part6-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(11).translation = [-120.35366154334243 284.372904523339 348.54878936852083];  % mm
smiData.RigidTransform(11).angle = 0;  % rad
smiData.RigidTransform(11).axis = [0 0 0];
smiData.RigidTransform(11).ID = 'RootGround[Part1-1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(6).mass = 0.0;
smiData.Solid(6).CoM = [0.0 0.0 0.0];
smiData.Solid(6).MoI = [0.0 0.0 0.0];
smiData.Solid(6).PoI = [0.0 0.0 0.0];
smiData.Solid(6).color = [0.0 0.0 0.0];
smiData.Solid(6).opacity = 0.0;
smiData.Solid(6).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 1.5522108963162538;  % kg
smiData.Solid(1).CoM = [59.396094690530731 -33.751656642256123 24.153611919410711];  % mm
smiData.Solid(1).MoI = [2370.5723236949489 11836.273874440079 12478.600811568162];  % kg*mm^2
smiData.Solid(1).PoI = [149.83063568603183 347.01999739032908 -436.11361250231971];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'Part4*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 2.2971518399345388;  % kg
smiData.Solid(2).CoM = [61.71998449403825 2.817334590666547 -73.723768777813675];  % mm
smiData.Solid(2).MoI = [11916.596354414878 23609.173703212193 16105.627933239428];  % kg*mm^2
smiData.Solid(2).PoI = [-415.57793261202119 -9089.2932187108781 -471.4414266776443];  % kg*mm^2
smiData.Solid(2).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'Part2*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.91542674903734989;  % kg
smiData.Solid(3).CoM = [140.7896488356042 -8.112989936818181 -35.326616919933095];  % mm
smiData.Solid(3).MoI = [611.06489883259076 17581.125945705971 17914.196206594759];  % kg*mm^2
smiData.Solid(3).PoI = [31.204160681476054 -59.734605890590458 168.49246491474901];  % kg*mm^2
smiData.Solid(3).color = [0.89803921568627454 0.89803921568627454 0.89803921568627454];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'Part3*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 5.3700019518789404;  % kg
smiData.Solid(4).CoM = [0.12458060021776723 0.12458060021764569 36.166996010103084];  % mm
smiData.Solid(4).MoI = [33097.19497063609 33097.194970636039 60934.233581725064];  % kg*mm^2
smiData.Solid(4).PoI = [-14.270468212607616 -14.270468212508046 0.067938760873079637];  % kg*mm^2
smiData.Solid(4).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'Part1*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 0.29878219658048383;  % kg
smiData.Solid(5).CoM = [60.761784374825929 0 0];  % mm
smiData.Solid(5).MoI = [228.8049280608688 602.14585562370723 609.04524761199059];  % kg*mm^2
smiData.Solid(5).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(5).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = 'Part6*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(6).mass = 0.4691863699545869;  % kg
smiData.Solid(6).CoM = [-54.677054457784777 0.0013648597859703569 -0.0012812360167215352];  % mm
smiData.Solid(6).MoI = [367.61992570212141 1593.5903072229551 1505.6572200210846];  % kg*mm^2
smiData.Solid(6).PoI = [0.015735486306167154 -0.044270443271648585 0.047159805427609017];  % kg*mm^2
smiData.Solid(6).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(6).opacity = 1;
smiData.Solid(6).ID = 'Part5*:*Default';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(4).Rz.Pos = 0.0;
smiData.RevoluteJoint(4).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = -27.779444785094864;  % deg
smiData.RevoluteJoint(1).ID = '[Part1-1:-:Part2-1]';

smiData.RevoluteJoint(2).Rz.Pos = -1.4088512179685013;  % deg
smiData.RevoluteJoint(2).ID = '[Part2-1:-:Part3-1]';

smiData.RevoluteJoint(3).Rz.Pos = 34.942404089004569;  % deg
smiData.RevoluteJoint(3).ID = '[Part3-1:-:Part4-1]';

smiData.RevoluteJoint(4).Rz.Pos = 11.44485625591172;  % deg
smiData.RevoluteJoint(4).ID = '[Part5-1:-:Part6-1]';

