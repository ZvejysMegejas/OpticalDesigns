%% noct 58 1.2
% 
% using an optical setup presented in Nikon history pages.
%
% ver03

%%

clc;  clear all; clf

% read the picture and scale 
a = imread('noct03.tif')*256;

figure(02);
axes('Position',[0.01 0.01 0.99 0.98]); % enlarge the picture over the screen
image(a)

colormap('bone') % plain black and white for an image

hold('all'); % will add more plots


%% R1 of the first surface
r1 = 9800;  % its radii
d1 = 39; % x-location
m = d1+r1;  % the circle center x location 
n = 3126; % the circle center y location 
s = 20000; % number of points for the cricle 
[xx yy] = circle1(m,n,r1,s); % generate the circle
plot(xx, yy, '-g') % plot it

clear [s, xx, yy];

%% R2
r2 = -2000000;
d2 = 898;
m = d2+r2; 

s = 10000; [xx yy] = circle1(m,n,r2,s);
plot(xx, yy, '-r')
clear [s, xx, yy];


%% R3
r3 = 4100;
d3 = 921;
m = d3+r3; 

s = 10000; [ xx yy] = circle1(m,n,r3,s); plot(xx, yy)
clear [s, xx, yy];

%% R4
r4 = 8500;
d4 = 2106;
m = d4+r4; 

s = 10000; [ xx yy] = circle1(m,n,r4,s); plot(xx, yy, 'g-')
clear [s, xx, yy];


%% R5
r5 = 15800;
d5 = 2285;
m = d5+r5; 

s = 20000; [ xx yy] = circle1(m,n,r5,s); plot(xx, yy, 'r-')
clear [s, xx, yy];


%% R6
r6 = 2750;
d6 = 2653;
m = d6+r6; 

s = 20000; [ xx yy] = circle1(m,n,r6,s); plot(xx, yy)
clear [s, xx, yy];


%% stop
rs = 1e9;
ds = 3686;
m = ds+rs; 

s = 10000; [ xx yy] = circle1(m,n,rs,s); plot(xx, yy, '-r')
clear [s, xx, yy];



%% R7
r7 = -2850;
d7 = 4649;
m = d7+r7; 

s = 20000; [ xx yy] = circle1(m,n,r7,s); plot(xx, yy)
clear [s, xx, yy];

%% R8
r8 = 38000;
d8 = 4858;
m = d8+r8; 

s = 10000; [ xx yy] = circle1(m,n,r8,s); plot(xx, yy,  'r-')
clear [s, xx, yy];

%% R9
r9 = -4700;
d9 = 5847;
m = d9+r9; 

s = 10000; [ xx yy] = circle1(m,n,r9,s); plot(xx, yy, 'g-')
clear [s, xx, yy];

%% R10
r10 = -59000;
d10 = 5856;
m = d10+r10; 

s = 10000; [ xx yy] = circle1(m,n,r10,s); plot(xx, yy, '-b')
clear [s, xx, yy];

%% R11
r11 = -6800;
d11 = 6589;
m = d11+r11; 

s = 100000; [ xx yy] = circle1(m,n,r11,s); plot(xx, yy, '-g')
clear [s, xx, yy];

%% R12
r12 = 24500;
d12 = 6602;
m = d12+r12; 

s = 20000; [ xx yy] = circle1(m,n,r12,s); plot(xx, yy)
clear [s, xx, yy];

%% R13
r13 = -13000;
d13 = 7077;
m = d13+r13; 

s = 10000; [ xx yy] = circle1(m,n,r13,s); plot(xx, yy)
hold off

%%
% after obtaining these numbers scalling shall be done to obtain real
% numbers.
% One of the pictures says that the distance between the first and last
% surfaces is 57.7 mm

L = 57.7;

Limg = d13-d1;

ScaleFactor = Limg/L;

Estimated_r = [r1 r2 r3 r4 r5 r6 0 r7 r8 r9 r10 r11 r12 r13]';

Estimated_d = [d1 d2 d3 d4 d5 d6 ds d7 d8 d9 d10 d11 d12 d13]';

Distances = diff([d1 d2 d3 d4 d5 d6 ds d7 d8 d9 d10 d11 d12 d13] / ScaleFactor);

Radii = Estimated_r/ ScaleFactor;

for i=1:14
    if i==7
        a = ['Surface STOP                        and thickness: ', num2str(Distances(i))];
        disp(a)
        elseif i == 14
        a = ['Surface ', num2str(i), ' has a radius of: ', num2str(Radii(i)), ' and distance to image space is 37.78: '];
        disp(a)
    elseif i>7
        a = ['Surface ', num2str(i-1), ' has a radius of: ', num2str(Radii(i)), ' and thickness: ', num2str(Distances(i)) ];
    disp(a)
    else
    a = ['Surface ', num2str(i), ' has a radius of: ', num2str(Radii(i)), ' and thickness: ', num2str(Distances(i))];
    disp(a)
    end
end