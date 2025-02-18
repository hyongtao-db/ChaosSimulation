clc; clear; close all;

%% 参数设置
N = 2000;        % 迭代步数
T = 200;          % 分岔图取后 T 轮数据
x0 = 0.5;         % 初始值
r_values = linspace(2.5, 4, 300); % Logistic 参数 r 变化范围

%% Logistic 映射迭代计算
figure;
hold on;
% 1️⃣ 绘制分岔图
for j = 1:length(r_values)
    r = r_values(j);
    x = x0;
    for i = 1:N   % 迭代 N 轮
        x = r * x * (1 - x);
        if i > (N - T)  % 只记录后 T 轮数据
            plot(r, x, 'k.', 'MarkerSize', 1);
        end
    end
end
xlabel('r');
ylabel('X');
title('Logistic Map Bifurcation Diagram');
grid on;
hold off;





