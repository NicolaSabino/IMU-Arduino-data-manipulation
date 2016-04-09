%Acquisizione e plot dei dati forniti dalla IMU in tempo reale


% all'occorrenza modificare la prota di comuniazione

arduino=serial('COM3');
set(arduino,'baudrate',115200);
fopen(arduino);



%____________________________________________________
%%% Initialized the cube

%facce del cubo
A=[1 1 -1 -1 1;-1 1 1 -1 -1;1 1 1 1 1];
B=[1 1 -1 -1 1;-1 1 1 -1 -1;-1 -1 -1 -1 -1];

C=[1 1 1 1 1;-1 -1 1 1 -1;1 -1 -1 1 1];
D=[-1 -1 -1 -1 -1;-1 -1 1 1 -1;1 -1 -1 1 1];

E=[1 -1 -1 1 1;-1 -1 -1 -1 -1;1 1 -1 -1 1];
F=[1 -1 -1 1 1;1 1 1 1 1;1 1 -1 -1 1];

%disegno iniziale
plot3(A(1,:),A(2,:),A(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
plot3(B(1,:),B(2,:),B(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
plot3(C(1,:),C(2,:),C(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
 plot3(D(1,:),D(2,:),D(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
 plot3(E(1,:),E(2,:),E(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
 plot3(F(1,:),F(2,:),F(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold off;
  
  
  A1=A;
  B1=B;
  C1=C;
  D1=D;
  E1=E;
  F1=F;
  
  cont=0;
while(1)
    if cont==600
    vett(1,:)=fscanf(arduino,'%f');
    
    %espresso in gradi
    kYaw=vett(1,1); %rotazione lungo x
	kPitch=vett(1,2); %rotazione lungo y 
	kRoll=vett(1,3);%rotazione lungo z

	mRoll=rotx(kRoll);      %x
	mPitch=roty(kPitch);     %  y
	mYaw=rotz(kYaw);        % z
	
	
	M=mYaw*mPitch*mRoll; %matrice di rotazione definitiva
    
    A1=M*A;
    B1=M*B;
    C1=M*C;
    D1=M*D;
    E1=M*E;
    F1=M*F;
	
    %disegno iniziale
plot3(A1(1,:),A1(2,:),A1(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
plot3(B1(1,:),B1(2,:),B1(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
plot3(C1(1,:),C1(2,:),C1(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
 plot3(D1(1,:),D1(2,:),D1(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
 plot3(E1(1,:),E1(2,:),E1(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold on;
 plot3(F1(1,:),F1(2,:),F1(3,:));
 axis([-2 2 -2 2 -2 2]);
  hold off;
    
    %delay
    	pause(0.00000001);
        disp(vett);
        cont=0;
    else
    vett(1,:)=fscanf(arduino,'%f');% dati da buttare
    cont=cont+60; %%incremento cont di uno
    end
end

    
    
