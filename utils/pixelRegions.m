function [trackingRegions,boxRegion] = pixelRegions(centroids)
    l = length(centroids(:,1));
    trackingRegions = zeros(l,2);
    boxRegion = zeros(1,l);
    for i = 1:l
        x = centroids(i,1);
        y = centroids(i,2);
        trackingRegions(i,1) = x - 20;
        trackingRegions(i,2) = x + 20;
        trackingRegions(i,3) = y - 20;
        trackingRegions(i,4) = y + 20;
        if  x > 300 && x < 340 && y > 220 && y<260
            boxRegion(1,i) = 5;
        elseif x >=0 && x <=320 && y >=0 && y<=240
            boxRegion(1,i) = 1;
        elseif x >=320 && x <=640 && y >=0 && y<=240
            boxRegion(1,i) = 2;
        elseif x >=0 && x <=320 && y >=240 && y<=480
            boxRegion(1,i) = 3;
        elseif x >=320 && x <=640 && y >=240 && y<=480
            boxRegion(1,i) = 4;
        end
    end   
end
%Region 1 - Top Left Box
%Region 2 - Top Right Box
%Region 3 - Bottom Left Box
%Region 4 - Bottom Right Box
%Region 5 - Center 40x40 Pixel Region