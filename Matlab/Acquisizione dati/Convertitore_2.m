%Script che converte la matrice di dati (dati.m 3*400) in una matrice 
%di rotazione in formato 3*3*4000
clear all;
load dati.mat;
M(3,3,4000)=0;

for k=1:4000.
	kRoll=dati(1,k); %rotazione lungo x
	kPitch=dati(2,k); %rotazione lungo y 
	kJaw=dati(3,k);%rotazione lungo z

	mRoll=rotx(kRoll);      %x
	mPitch=roty(kPitch);     %  y    il comando rot(x y z) crea la matrice di rotazione per l'asse specificato partendo dall'angolo fornitogli
	mJaw=rotz(kJaw);        % z
	
	%mapp=mRoll*mPitch*mJaw;
    mapp = mJaw*mPitch*mRoll;

	%completamento della matrice
	M(:,:,k)=mapp;
end

	
