% Animazione con angoli di eulero

clear all;
load Eulero2.mat;

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



for k=1:4000.
	
    %valori convertiti in radiatni
    kpsi=Eulero2(1,k)*(pi/180); 
	ktheta=Eulero2(2,k)*(pi/180); 
	kphi=Eulero2(3,k)*(91/180);

    
	Rpsi=[cos(kpsi) sin(kpsi) 0; -sin(kpsi) cos(kpsi) 0; 0 0 1];
    Rtheta=[1 0 0; 0 cos(ktheta) sin(ktheta); 0 -sin(ktheta) cos(ktheta)];
    Rphi=[cos(kphi) sin(kphi) 0; -sin(kphi) cos(kphi) 0; 0 0 1];
    
    %matrice di rotazione phi->theta->psi    controllare l'ordine
    R=Rpsi*Rtheta*Rphi;

	%animazione
	fx1=R*fx;
    fy1=R*fy;
    fz1=R*fz;
	
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
	
