% 求导法计算李亚普诺夫指数，使用扰动追踪

clc; clear; close all;

%% 参数设置
r = 3.99;         % Logistic 映射参数（混沌区域）
x0 = 0.5;         % 初始值
T = 1000;         % 迭代步数
transients = 200; % 去除瞬态

%% Logistic 映射函数及其导数
logistic = @(x) r * x .* (1 - x);             % Logistic 映射
logistic_derivative = @(x) r * (1 - 2 * x);   % Logistic 映射的导数

%% 初始化
x = x0;      % 初始值
lyapunov_sum = 0; % 李雅普诺夫指数的累加值

% 迭代计算李雅普诺夫指数
for t = 1:T
    if t > transients
        % 计算导数并累加
        lyapunov_sum = lyapunov_sum + log(abs(logistic_derivative(x)));
    end
    % 更新状态
    x = logistic(x);
end

% 计算李雅普诺夫指数
lyapunov_exponent = lyapunov_sum / (T - transients);
disp(['Lyapunov Exponent: ', num2str(lyapunov_exponent)]);
