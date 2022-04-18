%% zadaca 1

clc
clear
s=tf('s')
G01=(s+3)/(s^2-3*s+1)
G2=((s-3)*(s-5))/((s+1)*(s+2))
G02=G2/(1-G2)
G3=1/(s*(s^2+6*s+25))
G03=G3/(1-G3)
G4=1/(s*(s^2+4*s+5))
G04=G4/(1-G4)
G5=1/(s*(s^2+3.6*s))
G05=G5/(1-G5)
rlocus(G01,G02,G03,G04,G05)
hold on
legend('sys1','sys2','sys3','sys4','sys5')
hold off
%% zadaca 2
clc
clear
s=tf('s')
G0=((s-3)*(s-5))/((s+1)*(s+2))
zeta=-log(5/100)/(sqrt(pi^2+(log(5/100))^2))
wn=1/(0.8*zeta)
figure (1)
rlocus(G0)
sgrid(zeta,wn)

K=0.0627
figure(2)
step(feedback(K*G0,1))
%% zadaca 3
clc
clear
s=tf('s')
G0=1/(s*(s^2+6*s+25))
zeta=0.6
wn=4.8
figure (1)
rlocus(G0)
sgrid(zeta,wn)

K=8.1
figure(2)
step(feedback(K*G0,1))
a=1+G0
stepinfo(feedback(K*G0,1))







