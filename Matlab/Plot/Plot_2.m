% Programma per il plot dei dati acquisiti 
clear all; close all; clc;
K=menu('Scegli l''acquisizione','Non Scattoso v1','Non Scattoso v2','Scattoso v1','Scattoso v2');

switch K,
    case 1, load NScattoso_v1.mat; whos
    case 2, load NScattoso_v2.mat; whos
    case 3, load Scattoso_v1.mat; whos
    case 4, load Scattoso_v1.mat; whos
end
dati = RPY_Data*pi/180; % Conversione in radianti
N = size(dati,2); % Numero di campioni acquisiti
Label = {'Yaw $$\psi_k$$ [rad]','Pitch $$\theta_k$$ [rad]','Roll $$\phi_k$$ [rad]'};
% Rappresentazione degli angoli misurati
figure(1) % Grafici dei segnali misurati
for r = 1:3,
dati(r,:) = unwrap(dati(r,:));    
subplot(3,1,r); plot(1:N,dati(r,1:N),'LineWidth',2);
                ylabel(Label{r},'Interpreter','LaTeX','FontSize',14)
                xlim([1 N])
end                
xlabel('Sample $$k$$','Interpreter','LaTeX','FontSize',14)
switch K,
    case 1, print NScattoso_v1 -dpsc
    case 2, print NScattoso_v2 -dpsc
    case 3, print Scattoso_v1 -dpsc
    case 4, print Scattoso_v1 -dpsc
end


