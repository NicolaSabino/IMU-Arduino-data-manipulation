%	Script di acquisizione dati per MATLAB

%	l'IMU Ë collegata via I2C all'arduino e quest'ultimo Ë 
%	collegato via seriale alla porta del computer all'indirizzo 
%	/dev/ttyUSB0 o /dev/ttyUSB1 con velocit‡† di trasmissione 115200

% su windows la porta di comunicazione dovrebbe essere la COM3

%=================================================================

%INIZIALIZZAZIONE PORTA SERIALE
	arduino=serial('COM4');
    set(arduino,'baudrate',115200)
    fopen(arduino);
    
    %inizializzazione della matrice che conterr√† i dati dell'IMU
    Eulero_1=zeros(3,4000);
   % fprintf('x');
    %acquisizione dati
    for i=1:4000
        Eulero_1(:,i)=fscanf(arduino,'%f');%specifico il tipo di dato float
    end
    
		
		%salvataggio dei dati acquisiti
		save Eulero;





%====================================================================
																							
