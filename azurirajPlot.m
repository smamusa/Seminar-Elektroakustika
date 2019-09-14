function azurirajPlot(pax)
    granice = [0 150];
    tikovi = 0 : 25 : 150;
    thetalim(pax, [0 180]);
    rlim(pax, granice);
    rticks(pax, tikovi);
    thetaticks(pax, theta_tikovi);
end