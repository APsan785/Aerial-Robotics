close all;
clear;

% the value of the set-point
z_des = 20.0142;
% Given trajectory generator
trajhandle = @(t) fixed_set_point(t, z_des);

% This is your controller
controlhandle = @controller;

% Run simulation with given trajectory generator and controller
[t, z] = height_control(trajhandle, controlhandle);
