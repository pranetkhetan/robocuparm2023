function [labels,centroids,nos,trackingRegions,boxRegions] = detectObjects(img,detector)
    [bboxes,~,labels] = detect(detector,img);
    [centroids,nos] = getCentroids(bboxes,labels,img);
    [trackingRegions,boxRegions] = pixelRegions(centroids);
end