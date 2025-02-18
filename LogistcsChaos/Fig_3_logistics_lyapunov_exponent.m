clc; clear; close all;

%% 参数设置
N = 2000;        % 迭代步数
T = 200;          % 分岔图取后 T 轮数据
x0 = 0.5;         % 初始值
r_values = linspace(2.5, 4, 300); % Logistic 参数 r 变化范围
Lyapunov = zeros(size(r_values)); % 记录李雅普诺夫指数

%% Logistic 映射迭代计算
figure;
% 2️⃣ 计算李雅普诺夫指数 求导法
for j = 1:length(r_values)
    r = r_values(j);
    x = x0;
    sum_log_derivative = 0;
    for i = 1:N
        x = r * x * (1 - x);
        derivative = abs(r * (1 - 2 * x)); % 计算导数 |f'(x)|
        if derivative > 0
            sum_log_derivative = sum_log_derivative + log(derivative);
        end
    end
    Lyapunov(j) = sum_log_derivative / N;
end

figure;
hold on;
% 3️⃣ 绘制李雅普诺夫指数图
plot(r_values, Lyapunov, 'r', 'LineWidth', 1);
yline(0, '--k'); % 混沌与周期行为的分界线
xlabel('r');
ylabel('\lambda');
title('Lyapunov Exponent');
grid on;
hold off;


