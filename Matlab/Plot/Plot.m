%	Plot dei dati acquisiti dall'imu

% nel mio workspace ho salvato una matrice di dati precedentemente 
% acquisiti con lo script "Script.m"
%========================================================================

close all;
clear all;

load Scattoso_v1.mat;
g1=1*Scattoso_v1(1,1:7000);
g2=1*Scattoso_v1(2,1:7000);
g3=1*Scattoso_v1(3,1:7000);



hold on
subplot(3,1,1); plot(g1,'r');   title('Acquisizione dati Arduino/IMU 27/11/2015'); grid;   xlabel('Istanti'); ylabel('yaw'); axis([0 7000 -180 180]);
subplot(3,1,2); plot(g2,'g');   grid;   xlabel('Istanti'); ylabel('pitch'); axis([0 7000 -180 180]);
subplot(3,1,3); plot(g3,'b');   grid;   xlabel('Istanti'); ylabel('roll');  axis([0 7000 -180 180]);

%==========================================================================
						%Sabino Nicola
