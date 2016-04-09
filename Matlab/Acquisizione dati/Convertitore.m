%Script che converte la matrice di dati (dati.m 3*400) in una matrice 
%di rotazione in formato 3*3*4000

load dati.mat;
M(3,3,4000)=0;

for k=1:4000
	kRoll=dati(1,k);
	kPitch=dati(2,k);
	kYaw=dati(3,k);

	mRoll=[1 0 0;0 cos(kRoll) -sin(kRoll); 0 sin(kRoll) cos(kRoll)];
	mPitch=[cos(kPitch) 0 sin(kPitch);0 1 0;-sin(kPitch) 0 cos(kPitch)];
	mYaw=[cos(kYaw) -sin(kYaw) 0; sin(kYaw) cos(kYaw) 0; 0 0 1];
	
	mapp=mYaw*mPitch*mRoll;

	%completamento della matrice
	M(1,1,k)=mapp(1,1);
	M(1,2,k)=mapp(1,2);
	M(1,3,k)=mapp(1,3);
	M(2,1,k)=mapp(2,1);
	M(2,2,k)=mapp(2,2);
	M(2,3,k)=mapp(2,3);
	M(3,1,k)=mapp(3,1);
	M(3,2,k)=mapp(3,2);
	M(3,3,k)=mapp(3,3);
end

	
