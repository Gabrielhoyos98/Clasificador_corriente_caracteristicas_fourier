A=zeros(4,40);
P=zeros(4,40);
tam=10240; % Tamaño del recorrido de la señal

for i=1:1:80
    a1=a(i+tam*(i-1):i*tam);
    a1f=fft(a1);
    [amp,pos]=findpeaks(abs(a1f),'MinPeakHeight',1);
    % Índices de las posiciones que deseas extraer
    posiciones_a_extraer = [13, 38, 62, 86,110,135,159];

    % Inicializar vectores para almacenar los datos extraídos
    pos_extraidos = zeros(size(posiciones_a_extraer));
    amp_extraidos = zeros(size(posiciones_a_extraer));

    % Extraer los datos específicos
    for j = 1:length(posiciones_a_extraer)
        indice = find(pos == posiciones_a_extraer(j));
        if ~isempty(indice)
            pos_extraidos(j) = pos(indice);
            amp_extraidos(j) = amp(indice);

            A(j,i)=amp_extraidos(j);
            P(j,i)=pos_extraidos(j); 
         else
            disp(['Posición ', num2str(posiciones_a_extraer(j)), ' no encontrada.']);
            P(j,i)=posiciones_a_extraer(j);
        end
    end

% Mostrar y guardar los datos extraídos
disp('Datos extraídos:');
disp(['Posiciones: ', num2str(pos_extraidos)]);
disp(['Amplitudes: ', num2str(amp_extraidos)]);

% Guardar los valores de amp_extraidos en un vector
vector_guardar = amp_extraidos;
disp('Vector guardado:');
disp(vector_guardar);


end

C=[P' A'];