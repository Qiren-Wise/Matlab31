clc;clear all
a=[0.1 5 5000 4.7
    0.2 6 6000 5.6
    0.4 7 7000 6.7
    0.9 10 10000 2.3
    1.2 2 400 1.8];
[m,n]=size(a);
%quanjian = qj   x2 为函数句柄   @为句柄操作符
x2 = @(qj,lb,ub,x)(1-(qj(1)-x)./(qj(1)-lb)).*(x>=lb&x<qj(1))+...   %  区间公式 根据区间选择     条件  [lb,6]  
    (x>=qj(1)&x<=qj(2))+(1-(x-qj(2))./(ub-qj(2))).*...
    (x>qj(2)&x<=ub);  %公式   [6,ub]   满足条件则为1，不满足为0
%quanjian=[5,6];
qj=[5,6];lb=2;ub=12;
a(:,2)=x2(qj,lb,ub,a(:,2)); %对属性2进行变换 区间型变换

for j = 1:n
    b(:,j) = a(:,j)/norm(a(:,j)); %向量规范化norm
end
w = [0.2 0.3 0.4 0.1]; 
c = b.*repmat(w,m,1);%求加权矩阵  repamt（A，m,n）将A复制m*n块
cstar = max(c); %求正理想解
cstar(4)=min(c(:,4));%属性4为成本型
c0 = min(c);  %求负理想解
c0(4) = max(c(:,4));%属性4为成本型

for i = 1:m
    sstar(i) = norm(c(i,:)-cstar);%求 正理想解距离
    s0(i) = norm(c(i,:)-c0);  %负
end
f=s0./(sstar+s0);  %综合指标数
[sf,ind] = sort(f,'descend');%排序结果  ind为序号  sort为排序  descend为降序 大到小