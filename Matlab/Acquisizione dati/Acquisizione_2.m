%script di acquisizione

%INIZIALIZZAZIONE PORTA SERIALE
	arduino=serial('COM4');
    set(arduino,'baudrate',115200)
    fopen(arduino);
    
    %inizializzazione della matrice che conterrà  i dati dell'IMU
    RPY_Data=zeros(3,4000);
    app=zeros(1,3);
    
    for i=1:500
        for j=1:5
            app=fscanf(arduino,'%f'); %scarto 50 campionamenti
            
        end
        RPY_Data(:,i)=fscanf(arduino,'%f');%specifico il tipo di dato float
        disp(i);
        disp(RPY_Data(:,i));
    end
    
    fclose(arduino);