% fixed_set_point.m
function [s_des] = fixed_set_point(t, z_des)
    % FIXED_SET_POINT  Outputs a constant desired state = [z_des;0] except at t = 0 where it returns [0;0]

    if t == 0
        s_des = [0; 0]; % Initial takeoff from the floor
    else
        % Calculate the time it takes to reach the set point (20m) with given kp and kv
        time_to_reach_setpoint = 15;

        if t <= time_to_reach_setpoint
            s_des = [z_des; 0]; % Keep the desired state at 20m until the calculated time
        else
            s_des = [0.5; 0]; % After the calculated time, set the desired state to hover at 0.5m
        end
    end
end
