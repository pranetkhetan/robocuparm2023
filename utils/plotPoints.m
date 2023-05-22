function plotPoints(img,C)
    imshow(img);
    axis on;
    hold on;
    for i = 1:length(C(:,1))
        plot(C(i,1),C(i,2), 'r+', 'MarkerSize', 10, 'LineWidth', 4);
    end
    hold off;
    axis off;
end