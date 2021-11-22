%******************************************************************
%               Institut fuer Dynamik und Schwingungen               
%           Modellierung und Simulation in der Fahrzeugtechnik                     
%******************************************************************
% Programmbeschreibung:
% 
%
% Autor(in): Lukas Steinhaus
% Matrikel-Nummer: 4874692
% Erstellt am: [04.11.2021]
%
clear all;                   % loescht die alten Variablen im Workspace
close all;                  % schließt alle offenen Figures
clc;                           % Command-Window zurücksetzen
%
% Programmanfang

%% Aufgabe 3a
x=linspace(-pi,pi,21);
y1=sin(x);
figure
plot(x,y1,'sr-');
title('Trigonometrische Funktion')
xlabel('Zeit in [rad/s]')
ylabel('Auslenkung in [ ]')
legend('Sin(x)','Location','best')
xlim([min(x)*1.1 max(x)*1.1])
ylim([min(y1)*1.1 max(y1)*1.1])
grid on

%% Aufgabe 3b
y2=cos(x);
hold on
plot(x,y2,'b-.')
legend('Sin(x)','Cos(x)','Location','best')
hold off

%% Aufgabe 3c
x2=-1:0.01:2;
%Polynom 
p=[1 -1.5 0 0.5];
%Auswerten von Polynomwerten
y3=polyval(p,x2);
%Nullstellenbestimmen
null=roots(p)

figure(2)
plot(x2,y3,'k:','LineWidth',3);
hold on 
plot(null,[0 0 0],'mo','LineWidth',15);
title('Polynom Funktion')
xlabel('Zeit in [s]')
ylabel('Auslenkung in [ ]')
legend('Polynom 3. Grades','Nullstellen','Location','northwest')
xlim([min(x2)*1.1 max(x2)*1.1])
ylim([min(y3)*1.1 max(y3)*1.1])
grid on

