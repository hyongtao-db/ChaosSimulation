% Wolf法计算李亚普诺夫指数，使用扰动追踪

%% 参数设置
r = 3.99;           % 控制参数 (choose r > 3.57 for chaos)
x0 = 0.5;           % 初始值
delta_x0 = 1e-8;    % 轻微扰动
n_iter = 2000;         % 迭代步数
n_skip = 200;          % 分岔图取后 T 轮数据

% 初始化
x = zeros(n_iter, 1);
x_perturbed = zeros(n_iter, 1);
delta_x = zeros(n_iter, 1);
lyapunov_sum = 0;
x(1) = x0;

%% Logistic 映射函数及其导数
logistic = @(x) r * x .* (1 - x);             % Logistic 映射

% 迭代logistcs 计算扰动
for i = 2:n_iter
    % Logistic 映射迭代
    x(i) = logistic( x(i-1) );
    x_perturbed = logistic( x(i-1)+delta_x0 );
    
    % 计算扰动值
    delta_x = x_perturbed - x(i);
    
    % 跳过前几步，前几步还没进入混沌
    if i > n_skip
        % 计算扰动增长率
        lyapunov_sum = lyapunov_sum + log( (delta_x / delta_x0) );
    end
end

% 计算李亚普诺夫指数
lambda = lyapunov_sum / (n_iter - n_skip);

% 展示结果
fprintf('Lyapunov exponent for r = %.2f:  %.5f\n', r, lambda);

