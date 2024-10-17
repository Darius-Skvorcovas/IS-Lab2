clc
close all
clear all

% svoriai rasomai w11 tai reiskia pirmas "1" kad eina i pirma neurona,
% kitas 1 nurodo kad eina is pirmo x


x = 0.1:1/22:1;
y = ((1+0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x)))/2;

figure
plot(x,y)
grid on


% Aprasomi svoriai

eta = 0.1; % mokymosi svoris
Y = zeros(1,length(x)); % isejimo vertes

% Pirmas sluoksnis
w11_1 = rand(1);
w21_1 = rand(1);
w31_1 = rand(1);
w41_1 = rand(1);
w51_1 = rand(1);
w61_1 = rand(1);
w71_1 = rand(1);
w81_1 = rand(1);

b1_1 = rand(1);
b2_1 = rand(1);
b3_1 = rand(1);
b4_1 = rand(1);
b5_1 = rand(1);
b6_1 = rand(1);
b7_1 = rand(1);
b8_1 = rand(1);

% Antras sluoksnis

w11_2 = rand(1);
w12_2 = rand(1);
w13_2 = rand(1);
w14_2 = rand(1);
w15_2 = rand(1);
w16_2 = rand(1);
w17_2 = rand(1);
w18_2 = rand(1);

b1_2 = rand(1);

% Perceptrono atsakas
for j = 1:6000
    for i = 1:length(x)
        v1_1=w11_1*x(i)+b1_1;
        v2_1=w21_1*x(i)+b2_1;
        v3_1=w31_1*x(i)+b3_1;
        v4_1=w41_1*x(i)+b4_1;
        v5_1=w51_1*x(i)+b5_1;
        v6_1=w61_1*x(i)+b6_1;
        v7_1=w71_1*x(i)+b7_1;
        v8_1=w81_1*x(i)+b8_1;

        % Pasleptojo sluoksnio aktyvacijos funkcija
        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        y5_1 = tanh(v5_1);
        y6_1 = tanh(v6_1);
        y7_1 = tanh(v7_1);
        y8_1 = tanh(v8_1);


        % Antras isejimo sluoksnis
        v1_2 = y1_1 * w11_2 + y2_1 * w12_2 + b1_2 + y3_1 * w13_2 + y4_1 * w14_2 + y5_1 * w15_2 + y6_1 * w16_2 + y7_1 * w17_2 + y8_1 * w18_2;

        %Isejimo sluoksnio aktyvacijos funkcija (tiesine aktyvavimo funkcija išėjimo neurone)
        y1_2 = v1_2;
        Y(i) = y1_2;

        %Skaiciuojama klaida
        e = y(i) - y1_2;

        % Svorio atnaujinimas
        delta1_2 = e;

        % Pasleptojo sluoksnio klaidos gradientai

        delta1_1 = (1-tanh(v1_1)^2)*delta1_2*w11_2;
        delta2_1 = (1-tanh(v2_1)^2)*delta1_2*w12_2;
        delta3_1 = (1-tanh(v3_1)^2)*delta1_2*w13_2;
        delta4_1 = (1-tanh(v4_1)^2)*delta1_2*w14_2;
        delta5_1 = (1-tanh(v5_1)^2)*delta1_2*w15_2;
        delta6_1 = (1-tanh(v6_1)^2)*delta1_2*w16_2;
        delta7_1 = (1-tanh(v7_1)^2)*delta1_2*w17_2;
        delta8_1 = (1-tanh(v8_1)^2)*delta1_2*w18_2;

        % Atnaujinami svoriai

        w11_2 = w11_2 + eta * delta1_2 * y1_1;
        w12_2 = w12_2 + eta * delta1_2 * y2_1;
        w13_2 = w13_2 + eta * delta1_2 * y3_1;
        w14_2 = w14_2 + eta * delta1_2 * y4_1;
        w15_2 = w15_2 + eta * delta1_2 * y5_1;
        w16_2 = w16_2 + eta * delta1_2 * y6_1;
        w17_2 = w17_2 + eta * delta1_2 * y7_1;
        w18_2 = w18_2 + eta * delta1_2 * y8_1;

        b1_2 = b1_2 + eta * delta1_2;

        % Pasleptasis sluoksnis
        w11_1 = w11_1 + eta * delta1_1 * x(i);
        w21_1 = w21_1 + eta * delta2_1 * x(i);
        w31_1 = w31_1 + eta * delta3_1 * x(i);
        w41_1 = w41_1 + eta * delta4_1 * x(i);
        w51_1 = w51_1 + eta * delta5_1 * x(i);
        w61_1 = w61_1 + eta * delta6_1 * x(i);
        w71_1 = w71_1 + eta * delta7_1 * x(i);
        w81_1 = w81_1 + eta * delta8_1 * x(i);

        b1_1 = b1_1 + eta*delta1_1;
        b2_1 = b2_1 + eta*delta2_1;
        b3_1 = b3_1 + eta*delta3_1;
        b4_1 = b4_1 + eta*delta4_1;
        b5_1 = b5_1 + eta*delta5_1;
        b6_1 = b6_1 + eta*delta6_1;
        b7_1 = b7_1 + eta*delta7_1;
        b8_1 = b8_1 + eta*delta8_1;
    end
end

hold on
plot(x,Y)

x = 0.1:1/200:1;
y = ((1+0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x)))/2;

for i = 1:length(x)

    v1_1=w11_1*x(i)+b1_1;
    v2_1=w21_1*x(i)+b2_1;
    v3_1=w31_1*x(i)+b3_1;
    v4_1=w41_1*x(i)+b4_1;
    v5_1=w51_1*x(i)+b5_1;
    v6_1=w61_1*x(i)+b6_1;
    v7_1=w71_1*x(i)+b7_1;
    v8_1=w81_1*x(i)+b8_1;

    % Pasleptojo sluoksnio aktyvacijos funkcija
    y1_1 = tanh(v1_1);
    y2_1 = tanh(v2_1);
    y3_1 = tanh(v3_1);
    y4_1 = tanh(v4_1);
    y5_1 = tanh(v5_1);
    y6_1 = tanh(v6_1);
    y7_1 = tanh(v7_1);
    y8_1 = tanh(v8_1);


    % Antras isejimo sluoksnis
    v1_2 = y1_1 * w11_2 + y2_1 * w12_2 + b1_2 + y3_1 * w13_2 + y4_1 * w14_2 + y5_1 * w15_2 + y6_1 * w16_2 + y7_1 * w17_2 + y8_1 * w18_2;

    %Isejimo sluoksnio aktyvacijos funkcija (tiesine aktyvavimo funkcija išėjimo neurone)
    y1_2 = v1_2;
    Y(i) = y1_2;
end

hold on
plot(x,Y)
legend('Target', 'Predicted', 'Testing')

%%
clc
clear all

% svoriai rasomai w11 tai reiskia pirmas "1" kad eina i pirma neurona,
% kitas 1 nurodo kad eina is pirmo x


x = 0.1:1/22:1;
y = ((1+0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x)))/2;

figure
plot(x,y)
grid on


% Aprasomi svoriai

eta = 0.1; % mokymosi svoris
Y = zeros(1,length(x)); % isejimo vertes

% Pirmas sluoksnis
w11_1 = rand(1);
w21_1 = rand(1);
w31_1 = rand(1);
w41_1 = rand(1);
w51_1 = rand(1);
w61_1 = rand(1);
w71_1 = rand(1);
w81_1 = rand(1);

w12_1 = rand(1);
w22_1 = rand(1);
w32_1 = rand(1);
w42_1 = rand(1);
w52_1 = rand(1);
w62_1 = rand(1);
w72_1 = rand(1);
w82_1 = rand(1);

b1_1 = rand(1);
b2_1 = rand(1);
b3_1 = rand(1);
b4_1 = rand(1);
b5_1 = rand(1);
b6_1 = rand(1);
b7_1 = rand(1);
b8_1 = rand(1);

% Antras sluoksnis

w11_2 = rand(1);
w12_2 = rand(1);
w13_2 = rand(1);
w14_2 = rand(1);
w15_2 = rand(1);
w16_2 = rand(1);
w17_2 = rand(1);
w18_2 = rand(1);

b1_2 = rand(1);

% Perceptrono atsakas
for j = 1:6000
    for i = 1:length(x)
        v1_1=w11_1*x(i)+w12_1*x(i)+b1_1;
        v2_1=w21_1*x(i)+w22_1*x(i)+b2_1;
        v3_1=w31_1*x(i)+w32_1*x(i)+b3_1;
        v4_1=w41_1*x(i)+w42_1*x(i)+b4_1;
        v5_1=w51_1*x(i)+w52_1*x(i)+b5_1;
        v6_1=w61_1*x(i)+w62_1*x(i)+b6_1;
        v7_1=w71_1*x(i)+w72_1*x(i)+b7_1;
        v8_1=w81_1*x(i)+w82_1*x(i)+b8_1;

        % Pasleptojo sluoksnio aktyvacijos funkcija
        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        y5_1 = tanh(v5_1);
        y6_1 = tanh(v6_1);
        y7_1 = tanh(v7_1);
        y8_1 = tanh(v8_1);


        % Antras isejimo sluoksnis
        v1_2 = y1_1 * w11_2 + y2_1 * w12_2 + b1_2 + y3_1 * w13_2 + y4_1 * w14_2 + y5_1 * w15_2 + y6_1 * w16_2 + y7_1 * w17_2 + y8_1 * w18_2;

        %Isejimo sluoksnio aktyvacijos funkcija (tiesine aktyvavimo funkcija išėjimo neurone)
        y1_2 = v1_2;
        Y(i) = y1_2;

        %Skaiciuojama klaida
        e = y(i) - y1_2;

        % Svorio atnaujinimas
        delta1_2 = e;

        % Pasleptojo sluoksnio klaidos gradientai

        delta1_1 = (1-tanh(v1_1)^2)*delta1_2*w11_2;
        delta2_1 = (1-tanh(v2_1)^2)*delta1_2*w12_2;
        delta3_1 = (1-tanh(v3_1)^2)*delta1_2*w13_2;
        delta4_1 = (1-tanh(v4_1)^2)*delta1_2*w14_2;
        delta5_1 = (1-tanh(v5_1)^2)*delta1_2*w15_2;
        delta6_1 = (1-tanh(v6_1)^2)*delta1_2*w16_2;
        delta7_1 = (1-tanh(v7_1)^2)*delta1_2*w17_2;
        delta8_1 = (1-tanh(v8_1)^2)*delta1_2*w18_2;

        % Atnaujinami svoriai

        w11_2 = w11_2 + eta * delta1_2 * y1_1;
        w12_2 = w12_2 + eta * delta1_2 * y2_1;
        w13_2 = w13_2 + eta * delta1_2 * y3_1;
        w14_2 = w14_2 + eta * delta1_2 * y4_1;
        w15_2 = w15_2 + eta * delta1_2 * y5_1;
        w16_2 = w16_2 + eta * delta1_2 * y6_1;
        w17_2 = w17_2 + eta * delta1_2 * y7_1;
        w18_2 = w18_2 + eta * delta1_2 * y8_1;

        b1_2 = b1_2 + eta * delta1_2;

        % Pasleptasis sluoksnis
        w11_1 = w11_1 + eta * delta1_1 * x(i);
        w21_1 = w21_1 + eta * delta2_1 * x(i);
        w31_1 = w31_1 + eta * delta3_1 * x(i);
        w41_1 = w41_1 + eta * delta4_1 * x(i);
        w51_1 = w51_1 + eta * delta5_1 * x(i);
        w61_1 = w61_1 + eta * delta6_1 * x(i);
        w71_1 = w71_1 + eta * delta7_1 * x(i);
        w81_1 = w81_1 + eta * delta8_1 * x(i);

        w12_1 = w12_1 + eta * delta1_1 * x(i);
        w22_1 = w22_1 + eta * delta2_1 * x(i);
        w32_1 = w32_1 + eta * delta3_1 * x(i);
        w42_1 = w42_1 + eta * delta4_1 * x(i);
        w52_1 = w52_1 + eta * delta5_1 * x(i);
        w62_1 = w62_1 + eta * delta6_1 * x(i);
        w72_1 = w72_1 + eta * delta7_1 * x(i);
        w82_1 = w82_1 + eta * delta8_1 * x(i);

        b1_1 = b1_1 + eta*delta1_1;
        b2_1 = b2_1 + eta*delta2_1;
        b3_1 = b3_1 + eta*delta3_1;
        b4_1 = b4_1 + eta*delta4_1;
        b5_1 = b5_1 + eta*delta5_1;
        b6_1 = b6_1 + eta*delta6_1;
        b7_1 = b7_1 + eta*delta7_1;
        b8_1 = b8_1 + eta*delta8_1;
    end
end

hold on
plot(x,Y)

x = 0.1:1/200:1;
y = ((1+0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x)))/2;


for i = 1:length(x)
    v1_1=w11_1*x(i)+w12_1*x(i)+b1_1;
    v2_1=w21_1*x(i)+w22_1*x(i)+b2_1;
    v3_1=w31_1*x(i)+w32_1*x(i)+b3_1;
    v4_1=w41_1*x(i)+w42_1*x(i)+b4_1;
    v5_1=w51_1*x(i)+w52_1*x(i)+b5_1;
    v6_1=w61_1*x(i)+w62_1*x(i)+b6_1;
    v7_1=w71_1*x(i)+w72_1*x(i)+b7_1;
    v8_1=w81_1*x(i)+w82_1*x(i)+b8_1;

    % Pasleptojo sluoksnio aktyvacijos funkcija
    y1_1 = tanh(v1_1);
    y2_1 = tanh(v2_1);
    y3_1 = tanh(v3_1);
    y4_1 = tanh(v4_1);
    y5_1 = tanh(v5_1);
    y6_1 = tanh(v6_1);
    y7_1 = tanh(v7_1);
    y8_1 = tanh(v8_1);


    % Antras isejimo sluoksnis
    v1_2 = y1_1 * w11_2 + y2_1 * w12_2 + b1_2 + y3_1 * w13_2 + y4_1 * w14_2 + y5_1 * w15_2 + y6_1 * w16_2 + y7_1 * w17_2 + y8_1 * w18_2;

    %Isejimo sluoksnio aktyvacijos funkcija (tiesine aktyvavimo funkcija išėjimo neurone)
    y1_2 = v1_2;
    Y(i) = y1_2;
end

hold on
plot(x,Y)
legend('Target', 'Predicted', 'Testing')