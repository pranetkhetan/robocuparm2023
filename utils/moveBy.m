function currentpos = moveBy(currentpos,deltaX,deltaY)
    x = currentpos(1) + deltaX;
    y = currentpos(2) + deltaY;
    z = currentpos(3);
    gposy = currentpos(4);
    gposz = currentpos(5);
    currentpos = moveTo(x,y,z,gposy,gposz);
end