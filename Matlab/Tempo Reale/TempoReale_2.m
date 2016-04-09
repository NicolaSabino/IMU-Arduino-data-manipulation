%Acquisizione e plottagio dei dati forniti dalla IMU in tempo reale

arduino=serial('/dev/ttyUSB15');
set(arduino,'baudrate',115200);
fopen(arduino);



%____________________________________________________

fx=[0 2 2 2.2 2 2 0; 0 0 -0.1 0 0.1 0 0;0 0 0 0 0 0 0];

fy=[0 0 0.1 0 -0.1 0 0;0 2 2 2.2 2 2 0;0 0 0 0 0 0 0 ];


fz=[0 0 0.1 0 -0.1 0 0;0 0 0 0 0 0 0 ; 0 2 2 2.2 2 2 0];

fx1=fx;
fy1=fy;
fz1=fz;


vett=zeros(1,3);
        
        %vettore asse x
    	plot3(fx1(1,:),fx1(2,:),fx1(3,:),'b');
    	axis([-3 3 -3 3 -3 3]);
        hold on;
    	%vettore asse y
     	plot3(fy1(1,:),fy1(2,:),fy1(3,:),'r');
        hold on;
    	%vettore asse z
     	plot3(fz1(1,:),fz1(2,:),fz1(3,:),'k');
        hold off;

 %sottocampionamento
 cont=0;
 
while(1)
    if cont==500
    vett(1,:)=fscanf(arduino,'%f');
    
    %espresso in gradi
    kYaw=vett(1,1); %rotazione lungo x
	kPitch=vett(1,2); %rotazione lungo y 
	kRoll=vett(1,3);%rotazione lungo z

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
    	axis([-3 3 -3 3 -3 3]);
        hold on;
    	%vettore asse y
     	plot3(fy1(1,:),fy1(2,:),fy1(3,:),'r');
        hold on;
    	%vettore asse z
     	plot3(fz1(1,:),fz1(2,:),fz1(3,:),'k');
        hold off;
    
   	%delay
    	pause(0.00000001);
        disp(vett);
        cont=0;
    else
    vett(1,:)=fscanf(arduino,'%f');% dati da buttare
    cont=cont+50; %%incremento cont di uno
    end
end

    
    
