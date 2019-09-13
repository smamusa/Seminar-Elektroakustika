init; % pozovi M-file koji inicijalizira Arduino, Servo i HC-SR04 senzor udaljenosti
init_0; % pozovi M-file koji inicijalizira grafiku
udaljenost = 0; % udaljenost objekta -> udaljenost = (vrijeme X brzina zvuka) / 2
brzinaZvuka = 343; % Brzina zvuka na 20 °C i atmosferskom tlaku od 10^5 Pa
vrijednosti = zeros(180,2); % Napravi matricu 180 redaka X 2 stupca i popuni je nulama
% Brojaèi
i = 1;
j = 1;

% Rotiraj servo od 0 do 180 stupjeva
for kut = 0 : 1/180 : 1
    writePosition(s, kut);
    udaljenost1 = (u.readEchoTime() * brzinaZvuka) / 2;
    pause(0.5); % prièekaj 500ms
    udaljenost2 = (u.readEchoTime() * brzinaZvuka) / 2;
    udaljenost = seconds((udaljenost1 + udaljenost2) / 2); % uzmi prosjek 2 mjerenja i spremi u udaljenost
    vrijednosti(i,1) = (i-1); % U prvoj iteraciji postavlja i-ti redak (prvi) prvog stupca na nulu ( kut nula )
    vrijednosti(i,2) = round(udaljenost * 100,2); % pomnoži sa 100 da dobijemo centimetre i zaokruži na 2 decimale
    i = i + 1;
end

% Nacrtaj graf prvog kruga
polarplot(pax1,deg2rad(vrijednosti(:,1)), vrijednosti(:,2));
azurirajPlot(pax1);
title(pax1, 'Prvi krug: readEchoTime()');

% Rotiraj servo od 180 do 0 stupnjeva

for kut = 1 : -1/180 : 0
    writePosition(s, kut);
    udaljenost1 = (u.readEchoTime() * brzinaZvuka) / 2;
    pause(0.5); % prièekaj 500ms
    udaljenost2 = (u.readEchoTime()* brzinaZvuka) / 2;
    udaljenost = seconds((udaljenost1 + udaljenost2) / 2); % uzmi prosjek 2 mjerenja i spremi u udaljenost
    vrijednosti(i-j, 2) = (vrijednosti(i-j, 2) + round(udaljenost * 100, 2)) / 2; % uzmi prosjek starog i novog mjerenja
    j = j + 1;
end

% Nacrtaj graf drugog kruga
polarplot(pax2,deg2rad(vrijednosti(:,1)), vrijednosti(:,2));
azurirajPlot(pax2);
title(pax2, 'Drugi krug: readEchoTime()');

% Nacrtaj graf prosjeka u polarnim koordinatama
polarplot(pax3,deg2rad(vrijednosti(:,1)), vrijednosti(:,2));
azurirajPlot(pax3);
title(pax3, 'Prosjek: readEchoTime()');



