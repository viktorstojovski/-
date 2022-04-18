%% primer 1-1
A=[1 1; 0 -2]
B=[1;3]
C=[1 0]
D=[0]
Co=ctrb(A,B)
unco=length(A)-rank(Co)
det(Co)



%% zadaca 1-1
%a)
clc
clear
s=tf('s')
G=(s-1)/((s+1)*(s-3))
p1=-1+i
p2=-1-i
[A,B,C,D]=tf2ss([1 -1],[1 -2 -3])
Co=ctrb(A,B)
unco=length(A)-rank(Co)
det(Co)
sys=ss(A,B,C,D)
K=place(A,B,[p1 p2])

Nbar=rscale(sys,K)

sys_cl=ss(A-B*K,B,C,0)

t=0:0.01:10
x0=[0.001 0.0001]
u=ones(size(t))

lsim(sys_cl,u,t)


hold on
u=0.001*ones(size(t))

lsim(sys_cl,Nbar*u,t)

%% b)
clc
clear
s=tf('s')

p1=-12+12i
p2=-12-12i
p3=-20
[A,B,C,D]=tf2ss([18*14*20],[1 -42 552 -2240])
Co=ctrb(A,B)
unco=length(A)-rank(Co)
det(Co)
sys=ss(A,B,C,D)
K=place(A,B,[p1 p2 p3])
Nbar=rscale(sys,K)

sys_cl=ss(A-B*K,B,C,0)

t=0:0.01:6
x0=[1 1 1]
u=ones(size(t))


lsim(sys_cl,u,t)


hold on
u=ones(size(t))

lsim(sys_cl,Nbar*u,t)


%% zadaca 1-2
clc
clear
R=4
L=2.75*10^-6
K=0.0274
J=3.2284*10^-6
b=3.5077*10^-6

A=[0 1 0; 0 -b/J K/J;0 -K/L -R/L]
B=[0;0;1/L]
C=[1 0 0]
D=[0]

zeta=-log(5/100)/(sqrt(pi^2+(log(5/100))^2))
wn=4/(zeta)
p1=-zeta*wn+(wn*sqrt(1-zeta^2))*i
p2=-zeta*wn-(wn*sqrt(1-zeta^2))*i
p3=-1.5*zeta*wn

Co=ctrb(A,B)
unco=length(A)-rank(Co)
det(Co)
sys=ss(A,B,C,D)
K_k=place(A,B,[p1 p2 p3])

Nbar=rscale(sys,K_k)

sys_cl=ss(A-B*K_k,B,C,0)
[num, den] = ss2tf(A-B*K_k,B,C,0)
G=tf(num, den)

t=0:0.01:5
x0=[1 1 1]
u=ones(size(t))


lsim(G,u,t)


hold on


lsim(G,Nbar*u,t)


%% 
clear
clc

pi = sym('pi');
s = tf('s');

%Ts = 4/C*Wn;
%Mp = 100 * exp((C * pi)/(1 - C^2));

J = 3.2284e-6;
b = 3.5077e-6;
K = 0.0274;
R = 4;
L = 2.75e-6;

A = [0 1 0; 0 -b/J K/J; 0 -K/L -R/L];
B = [0; 0; 1/L];
Cd = [1 0 0];
D = [0];

[num, den] = ss2tf(A, B, Cd, D)

G0 = ss(A,B,Cd,D);

G = tf(num, den)

C = 0.6;
Wn = 7;

p1 = -C*Wn + j*Wn*sqrt(1-C^2);
p2 = -C*Wn - j*Wn*sqrt(1-C^2);
p3 = -1.5*C*Wn;

K = place(A, B, [p1 p2 p3])

G = ss(A - B*K, B, Cd, 0);

t = 0:0.01:5;
u = ones(size(t));
x0 = [0 0 0];

lsim(G, u, t, x0);
grid on;
hold on;

Nbar = rscale(G0, K)
lsim(G, Nbar*u, t, x0)
grid on;
