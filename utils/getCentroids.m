function [centroids,number] = getCentroids(bboxes,labels,img)
    l = length(bboxes(:,1));
    centroids = zeros(l,2);
    for i = 1:l
        if labels(i) == "bottle" || labels(i) == "can"
            box = bboxes(i,:);
            x = box(1) + box(3)/2;
            y = box(2) + box(4)/2;
            centroids(i,:) = [x,y];
        elseif labels(i) == "bottle_standing"
            I = blueMask(img);
            stats = regionprops(I,"Centroid");
            centTemp = struct2cell(stats);
            box = bboxes(i,:);
            rangeLimitX = box(1) + box(3);
            rangeLimitY = box(2) + box(4);
            for a = 1:length(centTemp)
                cent = centTemp{a};
                if cent(1) > box(1) && cent(1) < rangeLimitX && cent(2) > box(2) && cent(2) < rangeLimitY
                    centroids(i,:) = [cent(1),cent(2)];
                end
            end
        elseif labels(i) == "can_standing"
            I2 = greyMaskNew(img);
            windowSize = 5;
            kernel = ones(windowSize) / windowSize ^ 2;
            blurryImage = conv2(single(I2), kernel, 'same');
            I3 = blurryImage > 0.5;
            stats = regionprops(I3,"Centroid");
            centTemp = struct2cell(stats);
            box = bboxes(i,:);
            rangeLimitX = box(1) + box(3);
            rangeLimitY = box(2) + box(4);
            for a = 1:length(centTemp)
                cent = centTemp{a};
                if cent(1) > box(1) && cent(1) < rangeLimitX && cent(2) > box(2) && cent(2) < rangeLimitY
                    centroids(i,:) = [cent(1),cent(2)];
                end
            end
        end
    end
    number = length(centroids(:,1));
end