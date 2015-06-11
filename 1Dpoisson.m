X = 2; % fizyczne rozmiary obszaru
k = 2.45; % sta�a dyfuzji

Nx = 20;
hx = X/(Nx+1);
px = hx*[0:Nx+1]'; 	% prawdziwe wsp�rz�dne w�z��w dyskretyzacji
			% potrzebne m.in. do definicji prawej strony;
			% okre�lone ��cznie z brzegiem obszaru
Tx = lap1ddset(Nx,hx)	% macierz laplasjanu

% wyznaczamy funkcj� prawej strony
m = 1; % punkt graniczny
pxl = px(px<m); pxr = px(px>=m); % w�z�y na lewo i prawo od "m"
Fx = [1./(2-pxl); 1./(pxr.^5)] / k;
plot(px,Fx); % sprawdzamy wizualnie poprawno�� Fx
Fx = Fx(2:end-1); % wybieramy tylko warto�ci w wewn�trznych w�z�ach

Ux = Tx \ Fx;
plot(px, [0; Ux; 0]); legend('U_{N_x}(x)'); grid on;




