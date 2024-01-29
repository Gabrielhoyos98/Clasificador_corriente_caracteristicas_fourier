A=zeros(4,40);
P=zeros(4,40);
tam=10240; % Tamaño del recorrido de la señal

for i=1:1:80
    a1=a(i+tam*(i-1):i*tam);
    a1f=fft(a1);
    [amp,pos]=findpeaks(abs(a1f),'MinPeakHeight',100);
    for j=1:1:6
        A(j,i)=amp(j);
        P(j,i)=pos(j); 
    end


end

C=[P' A'];