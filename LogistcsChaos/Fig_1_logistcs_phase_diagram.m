clc; clear; close all;

%% 参数设置
N = 2000;         % 迭代步数
T = 200;          % 分岔图取后 T 轮数据
x0 = 0.5;         % 初始值

% 4️⃣ Logistic 映射的相图
r_sample = 3.8;   % 选择一个典型混沌参数
x = rand();       % 初始值
X = zeros(1, N);
for i = 1:N
    X(i) = x;
    x = r_sample * x * (1 - x);
end

figure;
hold on;
plot(X(1:end-1), X(2:end), 'b.', 'MarkerSize', 1);
xlabel('X_n');
ylabel('X_{n+1}');
title(['Logistic map phase diagram (r = ', num2str(r_sample), ')']);
grid on;
hold off;

