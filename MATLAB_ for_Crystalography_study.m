%MOISES BARBERA RAMOS
%13-11-2018
 
clear all
close all
clc 

%FILTER 2mm - used for the first set to analyse 
 
M = csvread('2mm filter day 2.csv')
 
%PEAK 1
 
theta1 = M(14:37,1);
I1 = M(14:37,2);
 
%PEAK 2
 
theta2 = M(41:52, 1);
I2 = M(41:52, 2);
 
%PEAK 3
 
theta3 = M(93:110, 1);
I3 = M(93:110, 2);
 
%PEAK 4
 
theta4 = M(127:138, 1);
I4 = M(127:138, 2);
 
%PEAK 5
 
theta5 = M(138:148, 1);
I5 = M(138:148, 2);
 
%PEAK 6
 
theta6 = M(175:189, 1);
I6 = M(175:189, 2);
 
%PEAK 7
 
theta7 = M(200:225, 1);
I7 = M(200:225, 2);
 
%PEAK 8
 
theta8 = M(239:248, 1);
I8 = M(239:248, 2);
 
%NIQUEL filter - used for the second set to analyse 
 
Ni = csvread('Ni filter day 2.csv')
 
%2PEAK 1
 
ntheta1 = Ni(23:40,1);
nI1 = Ni(23:40,2);
 
%2PEAK 2
 
ntheta2 = Ni(45:55, 1);
nI2 = Ni(45:55, 2);
 
%2PEAK 3
 
ntheta3 = Ni(93:110, 1);
nI3 = Ni(93:110, 2);
 
%2PEAK 4
 
ntheta4 = Ni(130:141, 1);
nI4 = Ni(130:141, 2);
 
%2PEAK 5
 
ntheta5 = Ni(141:153, 1);
nI5 = Ni(141:153, 2);
 
%2PEAK 6
 
ntheta6 = Ni(178:185, 1);
nI6 = Ni(178:185, 2);
 
%2PEAK 7
 
ntheta7 = Ni(200:225, 1);
nI7 = Ni(200:225, 2);
 
%2PEAK 8
 
ntheta8 = Ni(245:255, 1);
nI8 = Ni(245:255, 2);
 
 
figure(1)
hold on
plot(Ni(:,1),Ni(:,2),'k-');
plot(ntheta1,nI1,'r-');
plot(ntheta2,nI2,'g-');
plot(ntheta3,nI3,'b-');
plot(ntheta4,nI4,'r-');
plot(ntheta5,nI5,'g-');
plot(ntheta6,nI6,'b-');
plot(ntheta7,nI7,'r-');
plot(ntheta8,nI8,'g-');
hold off
 
grid on
 
xlim([min(Ni(:,1)) max(Ni(:,1))]);
 
 
figure(2)
 
plot(1:length(Ni(:,2)),Ni(:,2),'k-');
 
figure(3)
hold on
plot(M(:,1),M(:,2),'k-');
plot(theta1,I1,'r-');
plot(theta2,I2,'g-');
plot(theta3,I3,'b-');
plot(theta4,I4,'r-');
plot(theta5,I5,'g-');
plot(theta6,I6,'b-');
plot(theta7,I7,'r-');
plot(theta8,I8,'g-');
hold off
 
grid on
 
figure(4)
 
plot(1:length(M(:,2)),M(:,2),'k-');
