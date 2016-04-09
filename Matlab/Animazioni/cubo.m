% animazione di un cubo rotante

%clear;
clc;


%%% Initialized the cube

xc=1; yc=1; zc=1;    % coordinated of the center
L=1;                 % cube size (length of an edge)
alpha=0.9;             % transparency (max=1=opaque)

X = [0 0 0 0 0 1; 1 0 1 1 1 1; 1 0 1 1 1 1; 0 0 0 0 0 1];
Y = [0 0 0 0 1 0; 0 1 0 0 1 1; 0 1 1 1 1 1; 0 0 1 1 1 0];
Z = [0 0 1 0 0 0; 0 0 1 0 0 0; 1 1 1 0 1 1; 1 1 1 0 1 1];

C= [0.1 0.5 0.9 0.9 0.1 0.5];   % color/face

X = L*(X-0.5) + xc;
Y = L*(Y-0.5) + yc;
Z = L*(Z-0.5) + zc; 

% figure(1)
% fill3(X,Y,Z,C,'FaceAlpha',alpha);    % draw cube
% axis equal;
% AZ=-20;         % azimuth
% EL=25;          % elevation
% view(AZ,EL);    % orientation of the axes  



%%% Rotation about an arbitrary vector (rx,ry,rz) with angle rho:
for  i=1:4000

rx=dati(1,i); 
ry=dati(2,i);
rz=dati(3,i);

D=sqrt(rx^2+ry^2+rz^2);

rx=rx/D;
ry=ry/D;
rz=rz/D; 

rhomax=pi/2;  % (max angle in radian)

for rho=0:rhomax/20:rhomax

    fprintf('.')

    c=cos(rho);
    s=sin(rho);

    R=[];  % rotation matrix

    R(1,1)=rx^2+(1-rx^2)*c;
    R(1,2)=rx*ry*(1-c)-rz*s;
    R(1,3)=rx*rz*(1-c)+ry*s;
    R(2,1)=rx*ry*(1-c)+rz*s;
    R(2,2)=ry^2+(1-ry^2)*c;
    R(2,3)=ry*rz*(1-c)-rx*s;
    R(3,1)=rx*rz*(1-c)-ry*s;
    R(3,2)=ry*rz*(1-c)+rx*s;
    R(3,3)=rz^2+(1-rz^2)*c;

    V=[reshape(X,1,24); reshape(Y,1,24); reshape(Z,1,24)];

    VR=R*V;  % rotation

    XR=reshape(VR(1,:),4,6);
    YR=reshape(VR(2,:),4,6);
    ZR=reshape(VR(3,:),4,6);

    figure(2)
    hold off;
    fill3(XR,YR,ZR,C,'FaceAlpha',alpha);
    hold on;
    plot3(20*[0 rx],20*[0 ry],20*[0 rz],'r-')
    xlim([0 2]);
    ylim([0 2]);
    zlim([0 2]);
    box on;
    drawnow
    pause(0.2)

end
end

fprintf('\n');



