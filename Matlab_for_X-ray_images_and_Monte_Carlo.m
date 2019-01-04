%MOISES BARBERA RAMOS
%15-12-2017
 
clear all;
close all;
clc
 
 % # First porpuse
 % Use Matlab to look at the experimental x-ray Computed Tomography data of an Ethernet plug
 % collected from the x-ray CT scanner during the experimental physics sessions in the CTL Radiation Lab
 % using a Tungsten x-ray source. 
 
% A. Measure the feature sizes of the wires and their separation. 
 
% 1) Read image file from disk and store in an array
M = imread('projection0000.tif');
A = input('Enter a value for array element: ');
90
figure(1);
B = M(A,:);
plot(B);
xlabel('Pixel');
ylabel('Counts');
title('Slice of CT projection ');
 
figure(2);
C=M(A,200:295); %array indexing
plot(C);
xlabel('Pixel');
ylabel('Counts');
title('Slice of CT projection ');
 
figure(3);
D=1./double(C); %fliping image
plot(D);
xlabel('Pixel');
ylabel('Counts');
title('Slice of CT projection ');
 
% B. Consider the contrast of the image and demonstrate how this influences our ability to resolve features. 
 
adnum = 'Insert number of values: '
num = input(adnum)
rdm = rand(500)*num
rconv = uint16(rdm)
Mr = M + rconv
 
figure(4)
imshow(M)
 
figure(5)
imshow(Mr)
 
figure(6)
Bb = Mr(A,:);
plot(Bb);
xlabel('Pixel');
ylabel('Counts');
title('Slice of CT projection ');
 
figure(7)
Cb=Mr(A,200:295); %array indexing
plot(Cb);
xlabel('Pixel');
ylabel('Counts');
title('Slice of CT projection ');
 
figure(8);
Db=1./double(Cb); %fliping image
plot(Db);
xlabel('Pixel');
ylabel('Counts');
title('Slice of CT projection ');

______________________________________________________________________________________________________________________________________________________

%MOISES BARBERA RAMOS
%15/12/2017

clear all;
close all;
clc;

% # SECOND PORPOUSE
% Using your measurements from 1a, develop a Monte Carlo model of the Ethernet connector
% and verify that it reproduces the response of the real experimental system –
% the output distributions should look as close as possible to the experimental result.
 
x = -0.03:0.0001:0.03;% Define array for x-axis plot
ymax= 0.1;        % maximum y coordinate of the detector
thick = 0.1;       % thickness of metal
efficiency = 0.1;  % detector detects 10% of incident radiation
thetaMax= atan(ymax/ thick); % find max angle of counter
 
%trials = input('Input the number of tracks to generate ' );
trials=10000000;
%mfp= input('Input the mean free path in metres ');
mfp=0.1;
count = 1;
 
minA= (8-(2.385*2.355))/1000;
maxA= (8+(2.385*2.355))/1000;
minB= (22-(2.138*2.355))/1000;
maxB= (22+(2.138*2.355))/1000;
minC= (32-(1.928*2.355))/1000;
maxC= (32+(1.928*2.355))/1000;
minD= (43-(1.843*2.355))/1000;
maxD= (43+(1.843*2.355))/1000;
minE= (54-(1.402*2.355))/1000;
maxE= (54+(1.402*2.355))/1000;
minF= (65-(1.782*2.355))/1000;
maxF= (65+(1.782*2.355))/1000;
minG= (76-(2.351*2.355))/1000;
maxG= (76+(2.351*2.355))/1000;
minH= (87-(3.43*2.355))/1000;
maxH= (87+(3.43*2.355))/1000;
 
 
for j=1:trials 
r = -0.25+0.5*rand;           % generate a random number 0 < r < 1
theta = r; % angle towards detector
distanceToCounter= thick / cos(theta);
r = rand;           % another random number
D = -mfp*log(r);   % generate random distance
if ( theta > minA && theta < maxA)
    D=0;
end
 
if ( theta > minB && theta < maxB)
    D=0;
end
 
if ( theta > minC && theta < maxC)
    D=0;
end
 
if ( theta > minD && theta < maxD)
    D=0;
end
 
if ( theta > minE && theta < maxE)
    D=0;
end
 
if ( theta > minF && theta < maxF)
    D=0;
end
 
if ( theta > minG && theta < maxG)
    D=0;
end
 
if ( theta > minH && theta < maxH)
    D=0;
end
 
sigma = .01; %set this to some value in metres for the position resolution.
 
if ( D > distanceToCounter)
    r = rand;       % generate a random number 0 < r < 1
        if (r < efficiency);
        yhit(count) = distanceToCounter*sin(theta);
        
        
        yhitMeasured(count)= distanceToCounter*sin(theta)+ (sigma * randn); % smear
        count = count+1;
        end
    end
end
 
figure(1)
hist(yhit,x)            % histogram the output
%n=get(gca,'xtick');
%set(gca,'xticklabel',sprintf('%.2f |',n'));
ylabel('Counts');
xlabel('Yhit position [arb units]');

