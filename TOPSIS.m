clc;clear all
%quanjian = qj   x2 Ϊ�������   @Ϊ���������
x2 = @(qj,lb,ub,x)(1-(qj(1)-x)./(qj(1)-lb)).*(x>=lb&x<qj(1))+...  %  ���乫ʽ ��������ѡ��     ����  [lb,6]  
    (x>=qj(1)&x<=qj(2))+(1-(x-qj(2))./(ub-qj(2))).*...
    (x>qj(2)&x<=ub);  %��ʽ   [6,ub]   ����������Ϊ1��������Ϊ0
%quanjian=[5,6];
qj=[5,6];lb=2;ub=12;
x2data=[5 6 7 10 2]';
y2=x2(qj,lb,ub,x2data); % ���ú���ʱʹ��Բ����
