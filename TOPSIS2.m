clc;clear all
a=[0.1 5 5000 4.7
    0.2 6 6000 5.6
    0.4 7 7000 6.7
    0.9 10 10000 2.3
    1.2 2 400 1.8];
[m,n]=size(a);
%quanjian = qj   x2 Ϊ�������   @Ϊ���������
x2 = @(qj,lb,ub,x)(1-(qj(1)-x)./(qj(1)-lb)).*(x>=lb&x<qj(1))+...   %  ���乫ʽ ��������ѡ��     ����  [lb,6]  
    (x>=qj(1)&x<=qj(2))+(1-(x-qj(2))./(ub-qj(2))).*...
    (x>qj(2)&x<=ub);  %��ʽ   [6,ub]   ����������Ϊ1��������Ϊ0
%quanjian=[5,6];
qj=[5,6];lb=2;ub=12;
a(:,2)=x2(qj,lb,ub,a(:,2)); %������2���б任 �����ͱ任

for j = 1:n
    b(:,j) = a(:,j)/norm(a(:,j)); %�����淶��norm
end
w = [0.2 0.3 0.4 0.1]; 
c = b.*repmat(w,m,1);%���Ȩ����  repamt��A��m,n����A����m*n��
cstar = max(c); %���������
cstar(4)=min(c(:,4));%����4Ϊ�ɱ���
c0 = min(c);  %�������
c0(4) = max(c(:,4));%����4Ϊ�ɱ���

for i = 1:m
    sstar(i) = norm(c(i,:)-cstar);%�� ����������
    s0(i) = norm(c(i,:)-c0);  %��
end
f=s0./(sstar+s0);  %�ۺ�ָ����
[sf,ind] = sort(f,'descend');%������  indΪ���  sortΪ����  descendΪ���� ��С