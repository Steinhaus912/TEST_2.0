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

%% Masse
m1=4;       %in kg
m2=3;       %in kg
m3=2;       %in kg
m=[m1 m2 m3];
M=diag(m);

%% Dämpfungsbeiwert
d1=0.1;     %in Ns/m
d2=0.2;     %in Ns/m
d3=0.5;     %in Ns/m
D=[d1+d2 -d2 0; -d2 d2+d3 -d3; 0 -d3 d3];

%% Federkonstanten:

c1=3;       %in N/m
c2=1;       %in N/m
c3=2;       %in N/m
C=[c1+c2 -c2 0; -c2 c2+c3 -c3; 0 -c3 c3];

%% Systemmatrix
%xip= x1 x2 x3 x1_p x2_p x3_p

O=zeros(length(C));
E=eye(length(C));

A=[O E; -inv(M)*C -inv(M)*D];

%% Berechnung der Eigenwerte und Eigenvektoren
[V,la]=eig(A);		%V= Eigenvektoren la=Eigenwerte
la=diag(la);

w=imag(la); 		%Eigenkreisfrequenz
f=w./(2*pi); 		%Eigenfrequenz
Stabil=real(la); 	%Stabilität 

[f,I]=sort(f);
la=la(I);
Stabil=Stabil(I);
V=V(:,I);

% Automatisches Bestimmen der Stabilitaet durch pruefen des Realteils vom
% Eigenwert
for idx = 1:length(Stabil)
		if Stabil(idx)<0
			Stabil_str(idx) = "stabil";
		elseif Stabil(idx)==0
			Stabil_str(idx) = "grenzstabil";
		elseif Stabil(idx)>0
			Stabil_str(idx) = "instabil";
		else
			Stabil_str(idx) = "unbestimmt";
	end
end


%%test branch


