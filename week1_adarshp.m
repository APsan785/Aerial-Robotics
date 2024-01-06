syms v1(t) v2(t) v3(t);
ode1 = diff(v1) == (v1-v2)/2 -v3 +5 ;
ode2 = diff(v2) == v3-(v1-v2)/2 - 5;
ode3 = diff(v3) == v1-v3+2;

cond1 = v1(0) == -3;
cond2 = v2(0) == 5;
cond3 = v3(0) == 1;

odes = [ode1; ode2; ode3] ;
conds = [cond1; cond2; cond3];
s = dsolve(odes, conds);
disp(s);

t = 0:0.2:5;
%disp(t)

title('Speed-time graph of Batman, Catwoman and Bus');
xlabel('Time(sec)');
ylabel('Speed(m/s)');
hold on;
fplot(s.v1, [0,5]);
fplot(s.v2, [0,5]);
fplot(s.v3, [0,5]);
plot(2, 1, 'pk', 'MarkerFaceColor','k');

grid on;
legend('Batman', 'Catwoman', 'School Bus', 'Intersection');

