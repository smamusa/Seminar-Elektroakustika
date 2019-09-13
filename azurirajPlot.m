function azurirajPlot(pax)
    granice = [0 150];
    tikovi = 0 : 25 : 200;
    thetalim(pax, [0 180]);
    rlim(pax, granice);
    rticks(pax, tikovi);
end