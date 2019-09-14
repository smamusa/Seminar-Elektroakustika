prozor = uifigure('Position', [ 100 200 1100 500], 'Name', 'Karte okružja');
drawnow;
prozor.WindowState = 'maximized';
tikovi = 0 : 25 : 150;
theta_tikovi = 0 : 15 : 180;
granice = [0 150];
sirina = 0.35;

pax1 = polaraxes(prozor, 'OuterPosition', [0.01 0.5 sirina 0.5]);
thetalim(pax1, [0 180]);
rlim(pax1, granice);
rticks(pax1, tikovi);
thetaticks(pax1, theta_tikovi);
title(pax1, 'Prvi krug: readEchoTime()');

pax2 = polaraxes(prozor, 'OuterPosition', [0.34 0.5 sirina 0.5]);
thetalim(pax2, [0 180]);
rlim(pax2, granice);
rticks(pax2, tikovi);
thetaticks(pax2, theta_tikovi);
title(pax2, 'Drugi krug: readEchoTime()');

pax3 = polaraxes(prozor, 'OuterPosition', [0.67 0.5 sirina 0.5]);
thetalim(pax3, [0 180]);
rlim(pax3, granice);
rticks(pax3, tikovi);
thetaticks(pax3, theta_tikovi);
title(pax3, 'Prosjek: readEchoTime()');

pax4 = polaraxes(prozor, 'OuterPosition', [0.01 0.01 0.33 0.5]);
thetalim(pax4, [0 180]);
rlim(pax4, granice);
rticks(pax4, tikovi);
thetaticks(pax4, theta_tikovi);
title(pax4, 'Prvi krug: readDistance()');

pax5 = polaraxes(prozor, 'OuterPosition', [0.34 0.01 0.33 0.5]);
thetalim(pax5, [0 180]);
rlim(pax5, granice);
rticks(pax5, tikovi);
thetaticks(pax5, theta_tikovi);
title(pax5, 'Drugi krug: readDistance()');

pax6 = polaraxes(prozor, 'OuterPosition', [0.67 0.01 0.33 0.5]);
thetalim(pax6, [0 180]);
rlim(pax6, granice);
rticks(pax6, tikovi);
thetaticks(pax6, theta_tikovi);
title(pax6, 'Prosjek: readDistance()');