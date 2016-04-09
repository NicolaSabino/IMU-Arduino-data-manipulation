%Script che converte la matrice di dati (dati.m 3*400) in una matrice 
%di rotazione in formato 3*3*4000
clear all;
load dati.mat;
M(3,3,4000)=0;

for k=1:4000.
	kRoll=dati(1,k); %rotazione lungo x
	kPitch=dati(2,k); %rotazione lungo y 
	kYaw=dati(3,k);%rotazione lungo z

	
    
	%mapp=mRoll*mPitch*mJaw;
    mapp = angle2dcm( kYaw, kPitch, kRoll, 'ZYZ' ); %ZYX

	%completamento della matrice
	M(:,:,k)=mapp;
end