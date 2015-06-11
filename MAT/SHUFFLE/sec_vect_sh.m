function [vect, time]=sec_vect_sh(x)
tic
n=length(x);% d�ugo�� wektora x
Ls=n/4;%liczba sekcji
Lps = 2 * Ls; %Liczba podsekcji
E = log2(n)-1; %number of etap�w
vect=zeros(1,n); % help vector
DLs = 4; %d�ugo�� sekcji
DLps = 2; %d�ugo�� podsekcji
for i=1:E %p�tla po etapach
    for j=1:Ls%p�tla po sekcjach
       for k=1+(j-1)*DLs:DLs+(j-1)*DLs % obliczanie indeksu tablicy pomocniczej,
                                       % do kt�rego nale�y wstawi�
                                       % konkretn� liczb�
             if (k==1+(j-1)*DLs) ||  (k==DLs+(j-1)*DLs)
                 vect(k)= x(k);
                 ip=k;inp=ip;
                 continue;                
             end
             if mod(k,2)==0
                  vect(k)=x(ip+DLps);                 
                  ip=ip+1;
             end
             if mod(k,2)==1;                  
                  vect(k)=x(inp+1);
                  inp=inp+1;                  
             end       
       end
    end
    x=vect;% podmiana wektora pomocniczego z oryginalnym
    vect=zeros(1,n);   % wyzerowanie wektora pomocniczego 
    Ls=Ls/2; % obliczenie nowej liczby sekcji
    Lps = Ls*2; % obliczenie nowej liczby podsekcji
    DLs = DLs*2;%obliczenie ilo�ci element�w w sekcji
    DLps = DLps*2;% obliczenie ilo�ci element�w w podsekcji     
end
vect = x;% ostatnia podmiana wektora

time = toc;
end

