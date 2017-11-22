
clear all;
clc;
%Figen Sunal
%TABU SEARCH ALGOR�TMASI ile MINIMUM SPANNING TREE PROBLEMININ ��Z�LMES�
%yol maliyetlerini 8*8'lik matrisimizde tuttuk. yol olma durumuna g�re maliyetini,
%yol yoksa e�er yol maliyetini 0 olarak tan�mlad�k.
%�� farkl� dizi kullanaca��m�z i�in bunlar� ba�lang��ta bo� tan�mlad�k
%Bu dizilerimizde yol durumlar�na g�re gidilen gidilemeyen ve yasakl� yol
%bilgilerinin x ve y koordinatlar� tutulacakt�r.
array=[ 0 6 9 0 0 3 6 0;
        6 0 0 0 0 2 0 0;
        9 0 0 7 0 0 1 0;
        0 0 7 0 3 0 5 4;
        0 0 0 3 0 0 0 4;
        3 2 0 0 0 0 1 0;
        6 0 1 5 0 1 0 9;
        0 0 0 4 4 0 9 0]; 

 StartNode=round(1+(size(array,1)-1)*rand(1));%%Ba�lang�� nodumuzu random olarak belirledik.Hangi node fan ba�larsak yine minimum yol maliyetiyle gidecektir.
 StartNode=6;%% Raporda yer alan �rne�imizde ba�lang�� node muz F dir. �sterseniz bunu yorum sat�r� yaparak di�er ba�lang�� nodelar�ndan da mininmum yolu nas�l buldu�unu inceleyebilirsiniz.

row=StartNode;%%sat�rsal olarak i�leme ba�layaca��z sut�nsal bazda d���nsek de ayn� sonuca ula�acakt�k.

storeS=[];
storeE=[];
storeV=[];
values=[];

storePathS=[];
storePathE=[];

storeTabuS=[];
storeTabuE=[];   

while (size(storePathE)<9 & size(storePathS)<9)
    
    indexarray=find(array(row,:)); %Bulundu�umuz sat�rdaki s�f�rdan farkl� indis de�erlerini indexarray dizisinde tuutuk.
    
    for i=1:size(find(array(row,:)),2) %indexarray daki x y  indis de�erlerini storeE ve storeE dizilerinde tuttuk.
        storeE(end+1)=indexarray(i);
        storeS(end+1)=row;        
    end
    values=array(row,find(array(row,:)));
    storeV=[storeV values];   
    
    [value,index]=min(storeV);
    
    for i=1:8
        if array(row,i)==value;
            k=i;%minimum de�ere sahip value' nin indisini k degi�keninde tuttuk.
        end
    end  
 
    storePathE(end+1)=storeE(index);
    storePathS(end+1)=storeS(index);

  
    storeE(index)=[];
    storeS(index)=[];
    storeV(index)=[];
    
    storeTabuE=[storeE];    
    storeTabuS=[storeS];
    
     array(row,k)=0;%%gittitgim yol tekrardan kullan�lmas�n diye yol maliyet de�erlerini 0'lad�k.
     array(k,row)=0;
     
     row=storePathE(end);
end
display(storePathE);
display(storePathS);

