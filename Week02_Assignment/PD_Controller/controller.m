% controller.m
function [u] = controller(~, s, s_des, params)
    % PD_CONTROLLER
    %
    %   s: 2x1 vector containing the current state [z; v_z]
    %   s_des: 2x1 vector containing desired state [z; v_z]
    %   params: robot parameters

    % Calculate the error
    e = s_des - s;

    % PD Controller gains (tune these values based on constraints)
    kp = 95; % Proportional gain
    kv = 200; % Derivative gain
    
    % Calculate desired acceleration
    a_z_des = kp * e(1) + kv * e(2);

    % PD Control law
    u = params.mass * (a_z_des + kp * e(1) + kv * e(2) + params.gravity);

    % Limit the control input within the min and max values
    if u < params.u_min
        u = params.u_min;
    elseif u > params.u_max
        u = params.u_max;
    end
end
