clc
clear
% Using Linear Quadratic Regulator
% a) check controllability and observabillity

A=[1 0;2 0]
B=[1;0]
C=[0 1]
D=[0]
sys=ss(A,B,C,D)
t=0:0.01:2
eig(A)%0,1 unstable
Q=C'*C
R=0.001
Co=ctrb(A,B)
unco=length(A)-rank(Co)
Ob=obsv(A,C)
uncb=length(A)-rank(Ob)

nx=2%No. of states
ny=1%No. of outputs

[K,S,E]=lqr(A,B,Q,R)
K1=K(1)
K2=K(2)

A_lqr=A-B*K

syss=ss(A_lqr,B,C,D)
step(syss,t)%now it is stable,the stade state is far then goood
Nbar=rscale(sys,K)
syss_bar=Nbar*syss
hold on
grid on
step(syss_bar,t)
% alternative Nbar
Nbar_ALT=-inv(C*inv(A-B*K)*B)
BB=Nbar*B
sys_ALT=ss(A_lqr,BB,C,D)
step(sys_ALT,t)
%b) Use LQR to improve response,R=0.001,Q=eye(2)

%c)set reference point

%d)simulate response

%e) use simulink
%% Primer 3-12
clc
clear
A=[0 2 0 0 0;-0.1 -0.35 0.1 0.1 0.75;0 0 0 2 0; 0.4 0.4 -0.4 -1.4 0;0 -0.03 0 0 -1]
B=[0;0;0;0;10]
C2=[0 0 1 0 0]
C3=[0.5 0 0.5 0 0]
Cr=[-0.2 -0.2 0.2 0.2 0]
rho=[0.1 1 10]
R=1
Q=rho(2)*C3'*C3
K=lqr(A,B,Q,R)

%b)
t=1:0.1:12
for i=1:1:3
    Q=rho(i)*C2'*C2
K=lqr(A,B,Q,R)
    sys=ss(A-B*K,B,C2,0)
    step(sys,t)
    hold on
end
