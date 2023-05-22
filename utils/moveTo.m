function currentpos = moveTo(x,y,z,gposy,gposz)
    jointMess = rosmessage("geometry_msgs/PoseStamped");
    jointPub = rospublisher("/cartesian_impedance_example_controller/equilibrium_pose");  
    pause(1)
    gripperRotationX = -pi;
    if gposy == 1
        gripperRotationY = -0.01;
    elseif gposy == 2
        gripperRotationY = 89.5;
    else 
        gripperRotationY = -0.01;
    end
    if gposz == 1
        gripperRotationZ = 0;
    elseif gposz == 2
        gripperRotationZ = 89.5;
    else 
        gripperRotationZ = 0;
    end
    jointMess.Pose.Position.X = x;
    jointMess.Pose.Position.Y = y;
    jointMess.Pose.Position.Z = z;
    quat = angle2quat(gripperRotationX, gripperRotationY, gripperRotationZ, "XYZ");
    jointMess.Pose.Orientation.W = quat(1);
    jointMess.Pose.Orientation.X = quat(2);
    jointMess.Pose.Orientation.Y = quat(3);
    jointMess.Pose.Orientation.Z = quat(4);
    send(jointPub,jointMess);
    currentpos = [x,y,z,gposy,gposz];
end