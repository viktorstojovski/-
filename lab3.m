%% Zadaca 1
clc
clear
syms Beta
A=[0 1 0 0;1 0 0 0;0 0 0 1;-0.5 0 0 0]
B=[0;1;0;-1]
C=[0 0 1 0]
sys=ss(A,B,C,0)
Beta=0.5
%a)
zeta=-log(7/100)/(sqrt(pi^2+(log(7/100))^2))
wn=4/(5*zeta)
p1=-zeta*wn+(wn*sqrt(1-zeta^2))*i
p2=-zeta*wn-(wn*sqrt(1-zeta^2))*i
p3=-1.5*zeta*wn
p4=-3*zeta*wn
P=[p1 p2 p3 p4]

K=place(A,B,[p1 p2 p3 p4])
sys_K=ss(A-B*K,B,C,0)
t=0:0.1:20
u=ones(size(t))
%lsim(sys_K,u,t)
hold on
%b)
K_acker=acker(A,B,P)
sys_k_aker=ss(A-B*K_acker,B,C,0)
%lsim(sys_k_aker,u,t)

%v)
rho=[0.1 1 10]
Q=rho(2)*C'*C
R=1
for i=1:1:3
    Q=rho(i)*C'*C
K=lqr(A,B,Q,R)
    sys_lqr=ss(A-B*K,B,C,0)
   lsim(sys_lqr,u,t)

    hold on
end
%% zadaca 2
clc
clear
J = 3.2284e-6;
b = 3.5077e-6;
K = 0.0274;
R = 4;
L = 2.75e-6;

A = [0 1 0; 0 -b/J K/J; 0 -K/L -R/L];
B = [0; 0; 1/L];
C = [1 0 0];
D = [0];
t=0:0.1:20
u=ones(size(t))
rho=[0.1 0.5 1]
Q=rho(2)*C'*C
R=1
for i=1:1:3
    Q=rho(i)*C'*C
K=lqr(A,B,Q,R)
    sys_lqr=ss(A-B*K,B,C,0)
   lsim(sys_lqr,u,t)

    hold on
end
