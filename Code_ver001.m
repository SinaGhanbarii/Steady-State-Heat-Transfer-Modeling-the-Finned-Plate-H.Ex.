%% Study on Heat Transfer and Temperature distribution in Fin-Plate H.Ex. 
% MohammadSina GhanbariPakdehi - Jun. 2021 - Sharif University of Technology
clear, clc, close all
% Given Data:
k1 = 302;       % thermal conductivity of plate (W/m.C)
kf = 206;       % thermal conductivity of fin (W/m.C)
k2 = 500;       % thermal conductivity of fin (W/m.C)
A = 0.01 * 0.01;  % Area (m^2)
W = 0.04*(2^0.5); % Width (m)
                % Assume depth of plate is 1m. 
q = 2 * 10^6 * A * 0.001;   % given generated heat (W) - assume depth of plate is 0.001 m.
deltaX = 0.01;  % distance between two vertical or hortizal mesh (m) 
new_X = sqrt(2)*0.01; % distance between two mesh that are in the base of fin in plate2
deltaZ = 0.001; % depth of each mesh in each fin in plate 1&2(m)
Tbi = 20;       % initial temp. of each fin (degree C)
Tinf = 15;      % Temp. of air (degree C)
hp = 10;        % Convection heat transfer coefficient around plate (W/m^2.C)
hf = 2.5;       % Convection heat transfer coefficient around each fin (W/m^2.C)
L = 100;        % length of each fin (cm)
tic;
%% calculate temperature distribution in plate 1
T1 = 20*ones(51,51); %initial temperature of plate 1
for i = 1:200 %number of iterations
    for m = 1:51 %number of rows
        for n = 1:51 %number of columns
            if n == 1 %for first column
                T1(m,n) = 140;
            elseif n == 51 %for last column
                T1(m,n) = 160;
            elseif m == 1 %for first row
                T1(m,n) = (q + k1*0.5*(T1(m,n-1)+T1(m,n+1)+2*T1(m+1,n)) + 0.5*2*hp*(deltaX)^2 * Tinf)...
                    /(2*k1+ 0.5*2*hp*(deltaX)^2);
            elseif m == 51 %for last row
                T1(m,n) = (q + k1*0.5*(T1(m,n-1)+T1(m,n+1)+2*T1(m-1,n)) + 0.5*2*hp*(deltaX)^2 * Tinf) ...
                    /(2*k1 + 0.5*2*hp*(deltaX)^2);
            %for corners of base of fins
            elseif ((m==16 || m==31) && (n==16 || n==31)) || ((m==16 || m==31) && (n==21 || n==36)) ...
                    || ((m==21 || m==36) && (n==16 || n==31)) || ((m==21 || m==36) && (n==21 || n==36))
                T1(m,n) = (q +(T1(m,n+1)*k1+T1(m+1,n)*k1+ T1(m,n-1)*k1+ T1(m-1,n)*k1+ Tbi*0.1...
                    *0.25*kf)+(1+0.75)*hp*(deltaX)^2 * Tinf)/(4*k1+0.25*0.1*kf+(1+0.75)*hp...
                    *(deltaX)^2);
            %for sides of base of fins
            elseif ((m==16 || m==21) && (ismember(n,17:20)||ismember(n,32:35))) || ((m==31 || m==36) && (ismember(n,17:20)||ismember(n,32:35)))...
                    || ((n==16 || n==21) && (ismember(m,17:20)||ismember(m,32:35))) || ((n==31 || n==36) && (ismember(m,17:20)||ismember(m,32:35)))
                T1(m,n) = (q+(T1(m,n+1)*k1+T1(m+1,n)*k1+T1(m,n-1)*k1+T1(m-1,n)*k1+Tbi*0.1*0.5*kf)+(1+0.5)*hp*(deltaX)^2 * Tinf) ...
                    /(4*k1+0.1*0.5*kf+(1+0.5)*hp*(deltaX)^2);
            %for interrior elements in base of fin.
            elseif (ismember(m,17:21) && ismember(n,17:21)) || (ismember(m,17:21) && ismember(n,31:36)) || (ismember(m,31:36) ...
                    && ismember(n,17:21)) || (ismember(m,31:36) && ismember(n,31:36))
                T1(m,n) = (q+(T1(m,n+1)*k1+T1(m+1,n)*k1+T1(m,n-1)*k1+T1(m-1,n)*k1+Tbi*0.1*kf)+hp*(deltaX)^2 *Tinf) ... 
                    /(4*k1+0.1*kf+hp*(deltaX)^2);
            %for interrior elements in plate1 that are not in base of fin!
            else
                T1(m,n) = (q+k1*(T1(m,n+1)+T1(m+1,n)+T1(m,n-1)+T1(m-1,n))+2*hp*(deltaX)^2 * Tinf)/(4*k1+2*hp*(deltaX)^2);
            end     
        end
    end
end       
%% calculate temperature distribution in plate 2
% In this section, we rotate plate 2 by 45 degree clockwise for simplification in calculations.
T2 = 20*ones(41,41); %initial temperature of plate 2
for i = 1:200 %number of iterations
    for m = 1:41 %number of rows
        for n = 1:41 %number of columns
            %for corners of plate 2
            if (m==1 && n==1) || (m==1 && n==41) || (m==41 && n==1) || (m==41 && n==41)
                T2(m,n) = 100; 
            %for first and last row of plate2
            elseif m==1 || m==41
                T2(m,n) = 130;
            %for first and last column of plate 2
            elseif n==1 || n==41
                T2(m,n) = 70;
            %for corners of base of fins
            elseif (n == 21 && ismember(m,[6,14,28,36])) || ((n==17 || n==25) && ismember(m,[10,32])) ...
                    || (m==21 && ismember(n,[6,14,28,36])) || ((m==17 || m==25) && ismember(n,[10,32])) 
                T2(m,n) = ((T2(m+1,n+1)*k2+T2(m-1,n+1)*k2+T2(m-1,n-1)*k2+T2(m+1,n-1)*k2+Tbi*0.2*0.25*kf)+(1+0.75)*hp*(new_X)^2 ...
                    *Tinf)/(4*k2+0.2*0.25*kf+(1+0.75)*hp*(new_X)^2);
            %for sides of base of fins
            elseif ((n==18 || n==24) && ismember(m,[9,11,31,33])) || ((n==19 || n==23) && ismember(m,[8,12,30,34])) ...
                    || ((n==20 || n==22) && ismember(m,[7,13,29,35])) || ((m==20 || m==22) && ismember(n,[7,13,29,35])) ...
                    || ((m==19 || m==23) && ismember(n,[8,12,30,34])) || ((m==18 || m==23) && ismember(n,[9,11,31,33]))
                T2(m,n) = ((T2(m-1,n+1)*k2+T2(m+1,n+1)*k2+T2(m+1,n-1)*k2+T2(m-1,n-1)*k2+Tbi*0.2*0.5*kf)+(1+0.5)*hp*(new_X)^2 ...
                    *Tinf)/(4*k2+0.2*0.5*kf+(1+0.5)*hp*(new_X)^2);
            %for interrior elements in base of fins
            elseif (n==21 && (ismember(m,7:13) || ismember(m,29:35))) || ((n==20 || n==22) && (ismember(m,8:12) || ismember(m,30:34))) ...
                    || ((n==19 || n==23) && (ismember(m,9:11) || ismember(m,31:33))) || ((n==18 || n==24) && (m==10 || m==32)) ...
                    || (m==21 && (ismember(n,7:13) || ismember(n,29:35))) || ((m==20 || m==22) && (ismember(n,8:12) || ismember(n,30:34))) ...
                    || ((m==19 || m==23) && (ismember(n,9:11) || ismember(n,31:33))) || ((m==18 || m==24) && (n==10 || n==32))
                T2(m,n) = ((T2(m,n+1)*k2+T2(m+1,n)*k2+T2(m,n-1)*k2+T2(m-1,n)*k2+Tbi*0.2*kf)+hp*(deltaX)^2 *Tinf) ...
                    /(4*k2+0.2*kf+hp*(deltaX)^2);
            %for interrior elements in plate 2 and they're not in base of fins!
            else
                T2(m,n) = (k2*(T2(m,n+1)+T2(m+1,n)+T2(m,n-1)+T2(m-1,n))+2*hp*(deltaX)^2 *Tinf)/(4*k2+2*hp*(deltaX)^2);
            end
        end
    end
end                                     
%% Calculations for fins 
% At first, we should calculate the temperature of first node and last node of each fin
%Temperature of first node in each fin
Ti1 = (sum(sum(T1([16,21],16:21)))+sum(sum(T1(17:20,[16,21])))+sum(sum(T1([17,20],17:20))) + ...
    sum(sum(T1([18,19],[17,20])))+sum(sum(T1([18,19],[18,19]))))/36; %for fin 1
Ti2 = (sum(sum(T1([16,21],31:36)))+sum(sum(T1(17:20,[16,21])))+sum(sum(T1([17,20],32:35))) + ...
    sum(sum(T1([18,19],[32,35])))+sum(sum(T1([18,19],[33,34]))))/36; %for fin 2
Ti3 = (sum(sum(T1([31,36],31:36)))+sum(sum(T1(32:35,[31,36])))+sum(sum(T1([32,35],32:35))) + ...
    sum(sum(T1([32,33],[32,35])))+sum(sum(T1([33,34],[33,34]))))/36; %for fin 3
Ti4 = (sum(sum(T1([31,36],16:21)))+sum(sum(T1(32:35,[16,21])))+sum(sum(T1([17,20],17:20))) + ...
    sum(sum(T1([33,34],[17,20])))+sum(sum(T1([33,34],[18,19]))))/36; %for fin 4
%Temperature of last node in each fin
Tl1 = (sum(sum(T2(10,[17,25])))+sum(sum(T2([9,11],[18,24])))+sum(sum(T2([8,12],[19,23])))+sum(sum(T2([7,13],[20,22]))) ...
    +sum(sum(T2([6,14],21)))+sum(sum(T2(10,[18,24])))+sum(sum(T2([9,11],[19,23])))+sum(sum(T2([8,12],[20,22]))) ...
    +sum(sum(T2([7,13],21)))+sum(sum(T2(10,[19,23])))+sum(sum(T2([9,11],[20,22])))+sum(sum(T2([8,12],21))) ...
    +sum(sum(T2(10,[20,22])))+sum(sum(T2([9,11],21)))+0.4*T2(10,21))/39; %for fin 1
Tl2 = (sum(sum(T2(21,[28,36])))+sum(sum(T2([20,22],[29,35])))+sum(sum(T2([19,23],[30,34])))+sum(sum(T2([18,24],[31,33]))) ...
    +sum(sum(T2([17,25],32)))+sum(sum(T2(21,[29,35])))+sum(sum(T2([20,22],[30,34])))+sum(sum(T2([19,23],[31,33]))) ...
    +sum(sum(T2([18,24],32)))+sum(sum(T2(21,[30,34])))+sum(sum(T2([20,22],[31,33])))+sum(sum(T2([19,23],32))) ...
    +sum(sum(T2(21,[31,33])))+sum(sum(T2([20,22],32)))+0.4*T2(21,32))/39; %for fin 2
Tl3 = (sum(sum(T2(32,[17,25])))+sum(sum(T2([31,33],[18,24])))+sum(sum(T2([30,34],[19,23])))+sum(sum(T2([29,35],[20,22]))) ...
    +sum(sum(T2([28,36],21)))+sum(sum(T2(32,[18,24])))+sum(sum(T2([31,33],[19,23])))+sum(sum(T2([30,34],[20,22]))) ...
    +sum(sum(T2([29,35],21)))+sum(sum(T2(32,[19,23])))+sum(sum(T2([31,33],[20,22])))+sum(sum(T2([30,34],21))) ...
    +sum(sum(T2(32,[20,22])))+sum(sum(T2([31,33],21)))+0.4*T2(32,21))/39; %for fin 3
Tl4 = (sum(sum(T2(21,[6,14])))+sum(sum(T2([20,22],[7,13])))+sum(sum(T2([19,23],[8,12])))+sum(sum(T2([18,24],[9,11]))) ...
    +sum(sum(T2([17,25],10)))+sum(sum(T2(21,[7,13])))+sum(sum(T2([20,22],[8,12])))+sum(sum(T2([19,23],[9,11]))) ...
    +sum(sum(T2([18,24],10)))+sum(sum(T2(21,[8,12])))+sum(sum(T2([20,22],[9,11])))+sum(sum(T2([19,23],10))) ...
    +sum(sum(T2(21,[9,11])))+sum(sum(T2([20,22],10)))+T2(21,10))/39; % for fin 4
%Temperature distribution in fin number 1
Tf1 = 20*ones(1,L+1); %initial temperature of fin 1
for i = 1:200 %number of iterations
    m=1; %there's just 1 row!
    for n= 1:L+1 %number of columns
        if n==1 %Temperature of first node
            Tf1(m,n) = Ti1;
        elseif n==L+1 %Temperature of last node
            Tf1(m,n) = Tl1;
        else %Temperature of other nodes
            Tf1(m,n) = (0.32*kf*(Tf1(m,n-1)+Tf1(m,n+1))+4*hf*(deltaX)^2 *Tinf)/(0.32*2*kf+4*hf*(deltaX)^2);
        end 
    end
end
%Temperature distribution in fin number 2
Tf2 = 20*ones(1,L+1); %initial temperature of fin 2
for i = 1:200 %number of iterations
    m=1; %there's just 1 row!
    for n= 1:L+1 %number of columns
        if n==1 %Temperature of first node
            Tf2(m,n) = Ti2;
        elseif n==L+1 %Temperature of last node
            Tf2(m,n) = Tl2;
        else %Temperature of other nodes
            Tf2(m,n) = (0.32*kf*(Tf2(m,n-1)+Tf2(m,n+1))+4*hf*(deltaX)^2 *Tinf)/(0.32*2*kf+4*hf*(deltaX)^2);
        end
    end
end
%Temperature distribution in fin number 3
Tf3 = 20*ones(1,L+1); %initial temperature of fin 3
for i = 1:200 %number of iterations
    m=1; %there's just 1 row!
    for n= 1:L+1 %number of columns
        if n==1 %Temperature of first node
            Tf3(m,n) = Ti3;
        elseif n==L+1 %Temperature of last node
            Tf3(m,n) = Tl3;
        else %Temperature of other nodes
            Tf3(m,n) = (0.32*kf*(Tf3(m,n-1)+Tf3(m,n+1))+4*hf*(deltaX)^2 *Tinf)/(0.32*2*kf+4*hf*(deltaX)^2);
        end
    end
end
% Temperature distribution in fin number 4
Tf4 = 20*ones(1,L+1); %initial temperature of fin 4
for i = 1:200 %number of iterations
    m = 1; %there's just 1 row!
    for n= 1:L+1 %number of columns
        if n==1 %Temperature of first node
            Tf4(m,n) = Ti4;
        elseif n==L+1 %Temperature of last node
            Tf4(m,n) = Tl4;
        else %Temperature of other nodes
            Tf4(m,n) = (0.32*kf*(Tf4(m,n-1)+Tf4(m,n+1))+4*hf*(deltaX)^2 *Tinf)/(0.32*2*kf+4*hf*(deltaX)^2);
        end
    end
end
%% Secttion2 - Drawing plots
%in this section, we want to show the plots of temperatue distribution in plates & fins.
[X,Y] = meshgrid(1:51,1:51);
subplot(4,3,1);surf(X,Y,T1);title('3D plot of plate1');xlabel('Horizontal length(cm)');ylabel('Vertical length(cm)')
subplot(4,3,2);imagesc(T1);title('imagesc plot of plate1');xlabel('Horizontal length(cm)');ylabel('Vertical length(cm)')
subplot(4,3,3);contour(T1);title('Contour plot of plate1');xlabel('Horizontal length(cm)');ylabel('Vertical length(cm)')
subplot(4,3,4);heatmap(T1);title('Heat map of plate1');xlabel('Horizontal length(cm)');ylabel('Vertical length(cm)')
[A,B] = meshgrid(1:41,1:41);
subplot(4,3,5);surf(A,B,T2);title('3D plot of plate2');xlabel('Horizontal length(cm)');ylabel('Vertical length(cm)')
subplot(4,3,6);imagesc(T2);title('imagesc plot of plate2');xlabel('Horizontal length(cm)');ylabel('Vertical length(cm)')
subplot(4,3,7);contour(T2);title('Contour plate of plate2');xlabel('Horizontal length(cm)');ylabel('Vertical length(cm)')
subplot(4,3,8);heatmap(T2);title('Heat map of plate2');xlabel('Horizontal length(cm)');ylabel('Vertical length(cm)')
subplot(4,3,9);plot(1:L+1,Tf1);title('1D plot of fin1');xlabel('Length(cm)');ylabel('Temperature(C)')
subplot(4,3,10);plot(1:L+1,Tf2);title('1D plot of fin2');xlabel('Length(cm)');ylabel('Temperature(C)')
subplot(4,3,11);plot(1:L+1,Tf3);title('1D plot of fin3');xlabel('Length(cm)');ylabel('Temperature(C)')
subplot(4,3,12);plot(1:L+1,Tf4);title('1D plot of fin4');xlabel('Length(cm)');ylabel('Temperature(C)')
%% Section 3 - Effect of changing heat generation rate on heat transfer between H.Ex. & air.
%calculating the waste heat before changing q
Q0_p1 = hp*(deltaX)^2*(T1 - Tinf*ones(51,51)); %waste heat in plate 1
Q0_p2 = hp*(deltaX)^2*(T2 - Tinf*ones(41,41)); % waste heat in plate 2
Q0_f1 = 4*hf*deltaX* W * (Tf1 - Tinf*ones(1,L+1)); % waste heat in fin 1
Q0_f2 = 4*hf*deltaX* W * (Tf2 - Tinf*ones(1,L+1)); % waste heat in fin 1
Q0_f3 = 4*hf*deltaX* W * (Tf3 - Tinf*ones(1,L+1)); % waste heat in fin 1
Q0_f4 = 4*hf*deltaX* W * (Tf4 - Tinf*ones(1,L+1)); % waste heat in fin 1
Q0_tot = sum(sum(Q0_p1))+sum(sum(Q0_p2))+sum(Q0_f1)+sum(Q0_f2)+sum(Q0_f3)+sum(Q0_f4); %total waste heat
% calculating total heat transfer between heat exchanger & air when we change the value of q
q_new = input('Enter the new value of generated heat in W: ');
T1new = 20*ones(51,51); %initial temperature of plate 1 when we change the value of q
for i = 1:200 %number of iterations
    for m = 1:51
        for n = 1:51
            if n == 1 %for first column
                T1new(m,n) = 140;
            elseif n == 51 %for last column
                T1new(m,n) = 160;
            elseif m == 1 %for first row
                T1new(m,n) = (q_new + k1*0.5*(T1new(m,n-1)+T1new(m,n+1)+2*T1new(m+1,n)) + 0.5*2*hp*(deltaX)^2 * Tinf)...
                    /(2*k1+ 0.5*2*hp*(deltaX)^2);
            elseif m == 51 %for last row
                T1new(m,n) = (q_new + k1*0.5*(T1new(m,n-1)+T1new(m,n+1)+2*T1new(m-1,n)) + 0.5*2*hp*(deltaX)^2 * Tinf) ...
                    /(2*k1 + 0.5*2*hp*(deltaX)^2);
            %for corners of base of fins
            elseif (m==16 && (n==16 || n==31)) || (m==31 && (n==16 || n==31)) || (m==16 && (n==21 || n==36)) ...
                    || (m==31 && (n==21 || n==36)) || (m==21 && (n==16 || n==31)) || (m==36 && (n==16 || n==31)) ...
                    || (m==21 && (n==21 || n==36)) || (m==36 && (n==21 || n==36))
                T1new(m,n) = (q_new +(T1new(m,n+1)*k1+T1new(m+1,n)*k1+ T1new(m,n-1)*k1+ T1new(m-1,n)*k1+ Tbi*0.1...
                    *0.25*kf)+(1+0.75)*hp*(deltaX)^2 * Tinf)/(4*k1+0.25*0.1*kf+(1+0.75)*hp...
                    *(deltaX)^2);
            %for sides of base of fins
            elseif (m==16 && (ismember(n,17:20)||ismember(n,32:35))) || (m==21 && (ismember(n,17:20)||ismember(n,32:35))) ...
                    || (m==31 && (ismember(n,17:20)||ismember(n,32:35))) || (m==36 && (ismember(n,17:20)||ismember(n,32:35))) ...
                    || (n==16 && (ismember(m,17:20)||ismember(m,32:35))) || (n==21 && (ismember(m,17:20)||ismember(m,32:35))) ...
                    || (n==31 && (ismember(m,17:20)||ismember(m,32:35))) || (n==36 && (ismember(m,17:20)||ismember(m,32:35)))
                T1new(m,n) = (q_new+(T1new(m,n+1)*k1+T1new(m+1,n)*k1+T1new(m,n-1)*k1+T1new(m-1,n)*k1+Tbi*0.1*0.5*kf)+(1+0.5)*hp*(deltaX)^2 * Tinf) ...
                    /(4*k1+0.1*0.5*kf+(1+0.5)*hp*(deltaX)^2);
            %for interrior elements in base of fin.
            elseif (ismember(m,17:21) && ismember(n,17:21)) || (ismember(m,17:21) && ismember(n,31:36)) || (ismember(m,31:36) ...
                    && ismember(n,17:21)) || (ismember(m,31:36) && ismember(n,31:36))
                T1new(m,n) = (q_new+(T1new(m,n+1)*k1+T1new(m+1,n)*k1+T1new(m,n-1)*k1+T1new(m-1,n)*k1+Tbi*0.1*kf)+hp*(deltaX)^2 *Tinf) ... 
                    /(4*k1+0.1*kf+hp*(deltaX)^2);
            %for interrior elements in plate1 that are not in base of fin!
            else
                T1new(m,n) = (q_new+k1*(T1new(m,n+1)+T1new(m+1,n)+T1new(m,n-1)+T1new(m-1,n))+2*hp*(deltaX)^2 * Tinf)/(4*k1+2*hp*(deltaX)^2);
            end
        end
    end
end

T2new = T2; %because in plate 2 we don't have changes in heat generation, so they're equal together.
%calculating base temperature of fin in plate1 we change the value of q
Ti1new = (sum(sum(T1new([16,21],16:21)))+sum(sum(T1new(17:20,[16,21])))+sum(sum(T1new([17,20],17:20))) + ...
    sum(sum(T1new([18,19],[17,20])))+sum(sum(T1new([18,19],[18,19]))))/36;
Ti2new = (sum(sum(T1new([16,21],31:36)))+sum(sum(T1new(17:20,[16,21])))+sum(sum(T1new([17,20],32:35))) + ...
    sum(sum(T1new([18,19],[32,35])))+sum(sum(T1new([18,19],[33,34]))))/36;
Ti3new = (sum(sum(T1new([31,36],31:36)))+sum(sum(T1new(32:35,[31,36])))+sum(sum(T1new([32,35],32:35))) + ...
    sum(sum(T1new([32,33],[32,35])))+sum(sum(T1new([33,34],[33,34]))))/36;
Ti4new = (sum(sum(T1new([31,36],16:21)))+sum(sum(T1new(32:35,[16,21])))+sum(sum(T1new([17,20],17:20))) + ...
    sum(sum(T1new([33,34],[17,20])))+sum(sum(T1new([33,34],[18,19]))))/36;

Tl1new = Tl1; 
Tl2new = Tl2;
Tl3new = Tl3;
Tl4new = Tl4;
%Temperature distribiution in fin number 1 when we change the value of q
Tf1new = 20*ones(1,L+1); %initial temperature of fin 1
for i = 1:200 %number of iterations
    m=1;
    for n= 1:L+1 
        if n==1 %Temperature of first node
            Tf1new(m,n) = Ti1new;
        elseif n==L+1 %Temperature of last node
            Tf1new(m,n) = Tl1new;
        else %Temperature of other nodes
            Tf1new(m,n) = (0.32*kf*(Tf1new(m,n-1)+Tf1new(m,n+1))+4*hf*(deltaX)^2 *Tinf)/(0.32*2*kf+4*hf*(deltaX)^2);
        end 
    end
end
%Temperature distribiution in fin number 2 when we change the value of q
Tf2new = 20*ones(1,L+1); %initial temperature of fin 2
for i = 1:200 %number of iterations
    m=1;
    for n= 1:L+1
        if n==1 %Temperature of first node
            Tf2new(m,n) = Ti2new;
        elseif n==L+1 %Temperature of last node
            Tf2new(m,n) = Tl2new;
        else %Temperature of other nodes
            Tf2new(m,n) = (0.32*kf*(Tf2new(m,n-1)+Tf2new(m,n+1))+4*hf*(deltaX)^2 *Tinf)/(0.32*2*kf+4*hf*(deltaX)^2);
        end
    end
end
%Temperature distribiution in fin number 3 when we change the value of q
Tf3new = 20*ones(1,L+1); %initial temperature of fin 3
for i = 1:200 %number of iterations
    m=1;
    for n= 1:L+1
        if n==1 %Temperature of first node
            Tf3new(m,n) = Ti3new;
        elseif n==L+1 %Temperature of last node
            Tf3new(m,n) = Tl3new;
        else %Temperature of other nodes
            Tf3new(m,n) = (0.32*kf*(Tf3new(m,n-1)+Tf3new(m,n+1))+4*hf*(deltaX)^2 *Tinf)/(0.32*2*kf+4*hf*(deltaX)^2);
        end
    end
end
% Temperature distribiution in fin number 4 when we change the value of q
Tf4new = 20*ones(1,L+1); %initial temperature of fin 4
for i = 1:200 %number of iterations
    m = 1;
    for n= 1:L+1
        if n==1 %Temperature of first node
            Tf4new(m,n) = Ti4new;
        elseif n==L+1 %Temperature of last node
            Tf4new(m,n) = Tl4new;
        else %Temperature of other nodes
            Tf4new(m,n) = (0.32*kf*(Tf4new(m,n-1)+Tf4new(m,n+1))+4*hf*(deltaX)^2 *Tinf)/(0.32*2*kf+4*hf*(deltaX)^2);
        end
    end
end
%calculating the waste heat after changing q
Q1_p1 = hp*(deltaX)^2*(T1new - Tinf*ones(51,51)); %waste heat in plate 1 when we change the value of q
Q1_p2 = hp*(deltaX)^2*(T2new - Tinf*ones(41,41)); %waste heat in plate 2 when we change the value of q
Q1_f1 = 4*hf*deltaX* W * (Tf1new - Tinf*ones(1,L+1)); %waste heat in fin 1 when we change the value of q
Q1_f2 = 4*hf*deltaX* W * (Tf2new - Tinf*ones(1,L+1)); %waste heat in fin 2 when we change the value of q
Q1_f3 = 4*hf*deltaX* W * (Tf3new - Tinf*ones(1,L+1)); %waste heat in fin 3 when we change the value of q
Q1_f4 = 4*hf*deltaX* W * (Tf4new - Tinf*ones(1,L+1)); %waste heat in fin 4 when we change the value of q
Q1_tot = sum(sum(Q1_p1))+sum(sum(Q1_p2))+sum(Q1_f1)+sum(Q1_f2)+sum(Q1_f3)+sum(Q1_f4); % total waste heat when we change the value of q
disp('The value of q/Q0_tot is: ')
q_0 = 2 * 10^6 * 0.5 * 0.5 * 0.001;
disp(q_0 / Q0_tot)
disp('')
q_1 = (q_new/q) * q_0 ;
disp('The value of q_new/Q1_tot is: ')
disp(q_1 / Q1_tot)

%% Section 4 - Optimizing the length of fins for minimizing the waste heat
Qf1 = ones(1,91);
% h_new is new defined h that depends on length of fin
for i = 1:200 %iteration number
	for L = 10:100 %length range
		Tf1_n = 20*ones(1,L+1); % Temperature vector for fin1
		h_new = -2*(10^-9)*(L)^6 + 5*(10^-7)*(L)^5 - 6*(10^-5)*(L)^4 + 0.0031*(L)^3 - 0.0401*(L)^2 - 1.0438*(L) + 26.947;
		m = 1; %row
		for n = 1:L+1
                if n == 1 
                    Tf1_n(m,n) = Ti1; %temperature of first node 
                elseif n == L+1
                    Tf1_n(m,n) = Tl1; %temperature of last node
                else                    % temperature of other nodes
                    Tf1_n(m,n) = (0.32*kf*(Tf1_n(m,n-1)+Tf1_n(m,n+1))+4*h_new*(deltaX)^2 *Tinf)/(0.32*2*kf+4*h_new*(deltaX)^2);
                end                    
            Q_fin_1 = 4*h_new*deltaX*W*(Tf1_n - Tinf*ones(m,L+1)); %wasted heat vector in a specific length
		end
		
	Qf1(m,L-9) = sum(Q_fin_1); % each element of this vector is the sum of wasted heat in all nodes of fin 1
		
	end
end

Qf2 = ones(1,91);
for i = 1:200 %iteration number
	for L = 10:100 %length range
		Tf2_n = 20*ones(1,L+1); % Temperature vector for fin2
		h_new = -2*(10^-9)*(L)^6 + 5*(10^-7)*(L)^5 - 6*(10^-5)*(L)^4 + 0.0031*(L)^3 - 0.0401*(L)^2 - 1.0438*L + 26.947;
		m = 1;
		for n = 1:L+1
                if n == 1 
                    Tf2_n(m,n) = Ti2; %temperature of first node 
                elseif n == L+1
                    Tf2_n(m,n) = Tl2; %temperature of last node
                else                    % temperature of other nodes
                    Tf2_n(m,n) = (0.32*kf*(Tf2_n(m,n-1)+Tf2_n(m,n+1))+4*h_new*(deltaX)^2 *Tinf)/(0.32*2*kf+4*h_new*(deltaX)^2);
                end    
            Q_fin_2 = 4*h_new*deltaX*W*(Tf2_n - Tinf*ones(m,L+1)); %wasted heat vector in a specific length
		end
		
	Qf2(m,L-9) = sum(Q_fin_2); % each element of this vector is the sum of wasted heat in all nodes of fin 2
		
	end
end

Qf3 = ones(1,91);
for i = 1:200 %iteration number
	for L = 10:100 %length range
		Tf3_n = 20*ones(1,L+1); % Temperature vector for fin3
		h_new = -2*(10^-9)*(L)^6 + 5*(10^-7)*(L)^5 - 6*(10^-5)*(L)^4 + 0.0031*(L)^3 - 0.0401*(L)^2 - 1.0438*L + 26.947;
		m = 1;
		for n = 1:L+1
                if n == 1 
                    Tf3_n(m,n) = Ti1; %temperature of first node 
                elseif n == L+1
                    Tf3_n(m,n) = Tl1; %temperature of last node
                else                    % temperature of other nodes
                    Tf3_n(m,n) = (0.32*kf*(Tf3_n(m,n-1)+Tf3_n(m,n+1))+4*h_new*(deltaX)^2 *Tinf)/(0.32*2*kf+4*h_new*(deltaX)^2);
                end    
            Q_fin_3 = 4*h_new*deltaX*W*(Tf3_n - Tinf*ones(m,L+1)); %wasted heat vector in a specific length
		end
		
	Qf3(m,L-9) = sum(Q_fin_3); % each element of this vector is the sum of wasted heat in all nodes of fin 3
		
	end
end

Qf4 = ones(1,91);
for i = 1:200 %iteration number
	for L = 10:100 %length range
		Tf4_n = 20*ones(1,L+1); % Temperature vector for fin4
		h_new = -2*(10^-9)*(L)^6 + 5*(10^-7)*(L)^5 - 6*(10^-5)*(L)^4 + 0.0031*(L)^3 - 0.0401*(L)^2 - 1.0438*L + 26.947;
		m = 1;
		for n = 1:L+1
                if n == 1 
                    Tf4_n(m,n) = Ti1; %temperature of first node 
                elseif n == L+1
                    Tf4_n(m,n) = Tl1; %temperature of last node
                else                    % temperature of other nodes
                    Tf4_n(m,n) = (0.32*kf*(Tf4_n(m,n-1)+Tf4_n(m,n+1))+4*h_new*(deltaX)^2 *Tinf)/(0.32*2*kf+4*h_new*(deltaX)^2);
                end    
            Q_fin_4 = 4*h_new*deltaX*W*(Tf4_n - Tinf*ones(m,L+1)); %wasted heat vector in a specific length
		end
		
	Qf4(m,L-9) = sum(Q_fin_4); % each element of this vector is the sum of wasted heat in all nodes of fin 4
		
	end
end

Qfin_tot = Qf1 + Qf2 +Qf3 +Qf4; % each element of this vector is the sum of wasted heat in all fins in specific length
Q_pos = Qfin_tot(Qfin_tot>0);
disp('The minimum value of wasted heat for all fins is (W): ')
disp(min(Q_pos))
disp(' And the length of that minimum is (cm): ')
disp(find(Q_pos == min(Q_pos)))
toc;