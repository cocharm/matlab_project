%% Initialization
clear; close all; clc;
%% Dynamic System
% Continuous System
Ac = [0, 1; 0, 0]; % s' = v
Bc = [0; 1]; % v' = a = u
Cc = [1, 0; 0, 1];
Dc = [0; 0];

% Sampling Time
Ts = 1;

% Discretization
[Ad, Bd, Cd, Dd] = c2dm(Ac, Bc, Cc, Dc, Ts);
%% PID Controller
% Simulation Time
Tf = 900; % 900s
Sf = 8990;
Distance = 1 : 10 : Sf;

% PID Gain
Kp = 0.95;
Ki = 0.01;
Kd = 0.008;

% Initialization
x = zeros(2, Tf);
u = zeros(1, Tf);
y = zeros(2, Tf);
e = zeros(2, Tf);
ad = 0;

% Initial Conditions
x(:, 1) = [0; 0];
u(1) = 0;
r(1) = 10;
e(1) = x(2, 1) - r(1);

for k = 2 : Tf-1
    % Reference Velocity w.r.t Distance
    if k < Tf/2
        r(k) = 10; % 10 m/s
        
    else
        r(k) = 20;
    end
    
    % Error
    e(k) = r(k) - x(2, k);
    
    % Integral Term
    ad(k) = ad(k-1) + e(k)*Ts;
    
    % Feedback
    u(k) = Kp*e(k) + Ki*ad(k) + Kd*(e(k)-e(k-1))/Ts;
    
    x(:, k+1) = Ad*x(:, k) + Bd*u(k);
    y(:, k) = Cd*x(:, k);
end

plot(Distance, x(2, 1:Tf-1), 'k--', 'LineWidth', 1.2);
hold on;
plot(Distance, r, 'r-.', 'LineWidth', 1.2);