clc;
clf;
clear all;
close all;
Kp = 0.1817;
Ki = 194.4;
beta = 1.216;
% alpha = 0.5;  
Wcr = (abs(Ki))^(1/beta);
% Wcr1 = (abs(1/0.4))^(1/alpha);
w = logspace(-2 , 2, 1000);
mask = w < Wcr;
% mask1 = w < Wcr1;
mag1 = 20*log10(Kp)*ones(size(w));
mag2 = mask.*(20*log10(Ki)) + (~mask).*(20*beta*log10(w));
mag3 = -20*beta*log10(w);
% mag4= (mask1).*(-20*log10(1)) + (~mask1).*(-20*alpha*log10(0.4*w));
combined = mag1 + mag2 + mag3;
 
figure(1);
plot(1,1);
semilogx(w, combined,'Color','black')
xlabel('Frequency(rad/sec)');
ylabel('Magnitude dB');
grid on;
legend('Asymptotic magnitude bode plot','Location','NorthEast');
% 
plot(1,1);
semilogx(w, combined,'Color','black','LineStyle','--')
xlabel('Frequency(rad/sec)');
ylabel('Magnitude dB');
grid on;
hold on;

 

clc;
clear 
beta = 1.216;
% alpha = 0.5;
% K=1;
% T=0.4;
Kp=0.1817;
Ki=194.4;
w=logspace(-2,2,1000);
 Mag=@(w) 20*log10(abs(sqrt(Kp).^2)) + 20*log10(abs(sqrt((1i.*w).^beta +Ki).^2)) - 20*log10(abs(sqrt((1i.*w).^beta).^2));  

semilogx(w,Mag(w),'Color','black');
hold on;
grid on;
xlabel('Frequency (rad/sec)');
ylabel('Magnitude (dB)');
legend('Asymptotic magnitude bode plot','Exact magnitude bode plot','Location','NorthEast')
