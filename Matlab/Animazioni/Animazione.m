%	Semplice animazione con i dati forniti da una acquisizione precedente

clear all;
load ('Scattoso_v1.mat');

fx=[0 2 2 2.2 2 2 0; 0 0 -0.1 0 0.1 0 0;0 0 0 0 0 0 0];
fy=[0 0 0.1 0 -0.1 0 0;0 2 2 2.2 2 2 0;0 0 0 0 0 0 0 ];
fz=[0 0 0.1 0 -0.1 0 0;0 0 0 0 0 0 0 ; 0 2 2 2.2 2 2 0];

fx1=fx;
fy1=fy;
fz1=fz;

        %vettore asse x
    	plot3(fx1(1,:),fx1(2,:),fx1(3,:),'b');
    	axis([-2 2 -2 2 -2 2]);
        hold on;
    	%vettore asse y
     	plot3(fy1(1,:),fy1(2,:),fy1(3,:),'r');
        hold on;
    	%vettore asse z
     	plot3(fz1(1,:),fz1(2,:),fz1(3,:),'k');
        hold off;



for k=1:7000.
	
	kRoll=RPY_Data(1,k); %rotazione lungo x
	kPitch=RPY_Data(2,k); %rotazione lungo y 
	kYaw=RPY_Data(3,k);%rotazione lungo z

	mRoll=rotx(kRoll);      %x
	mPitch=roty(kPitch);     %  y
	mYaw=rotz(kYaw);        % z
	
	
	M=mYaw*mPitch*mRoll; %matrice di rotazione definitiva

	%animazione
	fx1=M*fx;
    	fy1=M*fy;
    	fz1=M*fz;
	
	%vettore asse x
    	plot3(fx1(1,:),fx1(2,:),fx1(3,:),'b');
    	axis([-2 2 -2 2 -2 2]);
        hold on;
    	%vettore asse y
     	plot3(fy1(1,:),fy1(2,:),fy1(3,:),'r');
        hold on;
    	%vettore asse z
     	plot3(fz1(1,:),fz1(2,:),fz1(3,:),'k');
        hold off;
    
   	%delay
    	pause(0.00000001);
end
	
