function [u1, u2] = controller(~, state, des_state, params)
    % Extracting desired and current positions
    des_pos = des_state.pos;
    cur_pos = state.pos;
    des_vel = des_state.vel;
    cur_vel = state.vel;
    des_acc = des_state.acc;
    
    % Controller gains
    k_pz = 1000;
    k_pphi = 1000;
    k_py = 110;
    k_dz = 1250;
    k_dy = 160;
    k_dphi = 1000;

    % Calculating desired thrust (u1)
    u1 = params.mass * (params.gravity + des_acc(2) + k_pz * (des_pos(2) - cur_pos(2)) + k_dz * (des_vel(2) - cur_vel(2)));

    % Calculating desired roll angle (phic)
    phic = -1 / params.gravity * (des_state.acc(1) + k_py * (des_pos(1) - cur_pos(1)) + k_dy * (des_vel(1) - cur_vel(1)));
    phic_dot = 0;

    % Calculating desired yaw moment (u2)
    u2 = params.Ixx * (k_pphi * (phic - state.rot) + k_dphi * (phic_dot-state.omega));

    % Applying constraints to u1 and u2
    u1 = max(min(u1, params.maxF), params.minF);
    u2 = max(min(u2, params.maxTau), -params.maxTau);
    
end