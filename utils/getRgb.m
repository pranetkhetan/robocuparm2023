function I = getRgb()
    Sub = rossubscriber("/camera/rgb/image_raw","sensor_msgs/Image","DataFormat","struct");
    C = receive(Sub,5);
    pause(2);
    I = rosReadImage(Sub.LatestMessage);
end