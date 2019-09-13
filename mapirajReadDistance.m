udaljenost = 0; % udaljenost objekta -> udaljenost = (vrijeme X brzina zvuka) / 2
vrijednosti = zeros(180,2); % Napravi matricu 180 redaka X 2 stupca i popuni je nulama
% Brojaèi
i = 1;
j = 1;

% Rotiraj servo od 0 do 180 stupjeva
for kut = 0 : 1/180 : 1
    writePosition(s, kut);
    udaljenost1 = u.readDistance();
    pause(0.5); % prièekaj 500ms
    udaljenost2 = u.readDistance();
    udaljenost = (udaljenost1 + udaljenost2) / 2; % uzmi prosjek 2 mjerenja i spremi u udaljenost
    vrijednosti(i,1) = (i-1); % U prvoj iteraciji postavlja i-ti redak (prvi) prvog stupca na nulu ( kut nula )
    vrijednosti(i,2) = round(udaljenost * 100,2); % pomnoži sa 100 da dobijemo centimetre i zaokruži na 2 decimale
    i = i + 1;
end

% Nacrtaj graf prvog kruga
polarplot(pax4,deg2rad(vrijednosti(:,1)), vrijednosti(:,2));
azurirajPlot(pax4);
title(pax4, 'Prvi krug: readDistance()');

% Rotiraj servo od 180 do 0 stupnjeva

for kut = 1 : -1/180 : 0
    writePosition(s, kut);
    udaljenost1 = u.readDistance();
    pause(0.5); % prièekaj 500ms
    udaljenost2 = u.readDistance();
    udaljenost = (udaljenost1 + udaljenost2) / 2; % uzmi prosjek 2 mjerenja i spremi u udaljenost
    vrijednosti(i-j, 2) = (vrijednosti(i-j, 2) + round(udaljenost * 100, 2)) / 2; % uzmi prosjek starog i novog mjerenja
    j = j + 1;
end

% Nacrtaj graf drugog kruga
polarplot(pax5,deg2rad(vrijednosti(:,1)), vrijednosti(:,2));
azurirajPlot(pax5);
title(pax5, 'Drugi krug: readDistance()');

% Nacrtaj graf prosjeka u polarnim koordinatama
polarplot(pax6,deg2rad(vrijednosti(:,1)), vrijednosti(:,2));
azurirajPlot(pax6);
title(pax6, 'Prosjek: readDistance()');



