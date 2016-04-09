%Plot di un cubo

xc=1; yc=1; zc=1; %coordinate del centro

L=1; %lunghezza di uno spigolo
alpha=0.8; %trasparenza del cubo

x=[0 0 0 0 0 1;
   1 0 1 1 1 1;
   1 0 1 1 1 1;
   0 0 0 0 0 1];

y=[0 0 0 0 1 0;
   0 1 0 0 1 1;
   0 1 1 1 1 1; 
   0 0 1 1 1 0];

z=[0 0 1 0 0 0;
   0 0 1 0 0 0;
   1 1 1 0 1 1;
   1 1 1 0 1 1];

C= [0.1 0.5 0.9 0.9 0.1 0.5]; %colore per ogni faccia (ci sono 6 colori)

x = L*(x-0.5) + xc;
y = L*(y-0.5) + yc;
x = L*(z-0.5) + zc; 

figure(1)
fill3(x,y,z,C,'FaceAlpha',alpha);    % disegno il cubo
axis equal;
AZ=-20;         % azimuth
EL=25;          % elevation
view(AZ,EL);    % orientazione degli assi
