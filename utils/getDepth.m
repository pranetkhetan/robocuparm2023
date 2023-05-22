function [img,points] = getDepth()
    Sub = rossubscriber("/camera/depth/image_raw","sensor_msgs/Image","DataFormat","struct");
    C = receive(Sub,5);
    pause(1);
    img = rosReadImage(Sub.LatestMessage);
    Sub2 = rossubscriber("/camera/depth/points","sensor_msgs/PointCloud2","DataFormat","struct");
    C2 = receive(Sub2,5);
    pause(1);
    points = rosReadXYZ(Sub2.LatestMessage);
end