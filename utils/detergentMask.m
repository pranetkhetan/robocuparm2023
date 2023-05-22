function [BW,maskedRGBImage] = detergentMask(RGB)
I = rgb2hsv(RGB);
channel1Min = 0.457;
channel1Max = 0.574;
channel2Min = 0.000;
channel2Max = 1.000;
channel3Min = 1.000;
channel3Max = 1.000;
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;
maskedRGBImage = RGB;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
end
