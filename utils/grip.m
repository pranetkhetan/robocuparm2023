function grip(pos,effort)
    [gripAct,gripGoal] = rosactionclient('/franka_gripper/gripper_action');
    gripperCommand = rosmessage(gripAct);    
    pause(2)
    gripperCommand.Command.Position = pos;
    gripperCommand.Command.MaxEffort = effort;
    gripperCommand.Command.Position = gripperCommand.Command.Position / 100;
    gripGoal.Command = gripperCommand.Command;
    sendGoal(gripAct,gripGoal)
end