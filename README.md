# IMU-Arduino-data-manipulation
![logo] (https://github.com/NicolaSabino/IMU-Arduino-data-manipulation/blob/master/Immagini/IMG_1352.JPG)


**Manipolazione di dati in tempo reale con Matlab e Arduino**

Il progetto è il risultato della mia collaborazione in primis con il prof. Fiori Simone, docente di _Elettrotecnica_ presso l'Università politecnico delle Marche, successivamente con il Prof. Andrea Bonci, docente del corso  _Laborato di Automazione_, e altri studenti: _Edoardo Russo_,_Andrea Civita_ e _Giuseppe Romani_

**Il Target prefissato è stato quello di processare una serie di dati provenienti dall'IMU (Angoli di eulero) e mediante le matrici di rotazione https://github.com/NicolaSabino/IMU-Arduino-data-manipulation/blob/master/Immagini/IMG_0262.JPGrappresentarli su di un grafico tridimensionale in MAtlab**

##Prototipazione
Il progetto è iniziato con la prototipazione in laboratorio con l'Arduino e ho verificato che i dati fluissero correttamente sulla porta seriale del pc.
Per il codice su Arduino ho utilizzato la libreria I2CDevLib consultabile alla pagina https://github.com/jrowberg/i2cdevlib
![logo] (https://github.com/NicolaSabino/IMU-Arduino-data-manipulation/blob/master/Immagini/IMG_0262.JPG)
![logo] (https://github.com/NicolaSabino/IMU-Arduino-data-manipulation/blob/master/Immagini/IMG_0263.JPG)

il prototipo finale
![logo] (https://github.com/NicolaSabino/IMU-Arduino-data-manipulation/blob/master/Immagini/IMG_2819.JPG)

##Acquisizione dati
Successivamente sono passato ad analizzare i dati al pc graficandoli ed eseguendo qualche animazione

![logo] (https://github.com/NicolaSabino/IMU-Arduino-data-manipulation/blob/master/Matlab/Grafici/PlotDati2.jpg)
![logo] (https://github.com/NicolaSabino/IMU-Arduino-data-manipulation/blob/master/Matlab/Grafici/DatiAcquisiti.png)

##Tempo reale
Come si evince dalla prima immagine sono riuscito ad animare un cubo sul pc controllandolo esclusivamente con l'ausilio del dispositivo hardware prototipato.
Per ottenere ciò è stato necessario sottocampionare i dati ricevuti dall'imu per permettere di processare fluidamente tutti i valori dal calcolatore ed avere un riscontro sul monitor

##Ulteriori sviluppi e la pubblicazione

Il progetto è il risultato della mia collaborazione in primis con il prof. Fiori Simone, docente di _Elettrotecnica_ presso l'Università politecnico delle Marche, successivamente con il Prof. Andrea Bonci, docente del corso  _Laborato di Automazione_, e altri studenti: _Edoardo Russo_,_Andrea Civita_ e _Giuseppe Romani_ i quali anno ampliato il progetto 
eseguendo delle analisi sulla _qualità del movimento_.

In ultima battutà il Professor Fiori ha stillato una Relazione
(consultabile al link https://github.com/NicolaSabino/IMU-Arduino-data-manipulation/blob/master/In-Lab%20Drone's%20Attitude%20Maneuvering%20Fluency%20Evaluation%20by%20a%20Gyroscopic%20Lurch%20Index.pdf)

che è stata presentata al 10th International Conference on
COMPUTER ENGINEERING and APPLICATIONS (CEA '16) a Barcellona il 15 e 16 Febbraio del 2016.

Fiori Simone: https://twitter.com/isplab_univpm
Sabino Nicola: nicola.sabino94@gmail.com

>

>Questo progetto è sotto licenza **GPL** sei libero di consultarlo,modificarlo e ridistribuirlo mensionando l'autore.
