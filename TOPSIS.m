clc;clear all
%quanjian = qj   x2 为函数句柄   @为句柄操作符
x2 = @(qj,lb,ub,x)(1-(qj(1)-x)./(qj(1)-lb)).*(x>=lb&x<qj(1))+...  %  区间公式 根据区间选择     条件  [lb,6]  
    (x>=qj(1)&x<=qj(2))+(1-(x-qj(2))./(ub-qj(2))).*...
    (x>qj(2)&x<=ub);  %公式   [6,ub]   满足条件则为1，不满足为0
%quanjian=[5,6];
qj=[5,6];lb=2;ub=12;
x2data=[5 6 7 10 2]';
y2=x2(qj,lb,ub,x2data); % 调用函数时使用圆括号
