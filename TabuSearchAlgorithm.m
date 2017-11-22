
clear all;
clc;
%Figen Sunal
%TABU SEARCH ALGORÝTMASI ile MINIMUM SPANNING TREE PROBLEMININ ÇÖZÜLMESÝ
%yol maliyetlerini 8*8'lik matrisimizde tuttuk. yol olma durumuna göre maliyetini,
%yol yoksa eðer yol maliyetini 0 olarak tanýmladýk.
%Üç farklý dizi kullanacaðýmýz için bunlarý baþlangýçta boþ tanýmladýk
%Bu dizilerimizde yol durumlarýna göre gidilen gidilemeyen ve yasaklý yol
%bilgilerinin x ve y koordinatlarý tutulacaktýr.
array=[ 0 6 9 0 0 3 6 0;
        6 0 0 0 0 2 0 0;
        9 0 0 7 0 0 1 0;
        0 0 7 0 3 0 5 4;
        0 0 0 3 0 0 0 4;
        3 2 0 0 0 0 1 0;
        6 0 1 5 0 1 0 9;
        0 0 0 4 4 0 9 0]; 

 StartNode=round(1+(size(array,1)-1)*rand(1));%%Baþlangýç nodumuzu random olarak belirledik.Hangi node fan baþlarsak yine minimum yol maliyetiyle gidecektir.
 StartNode=6;%% Raporda yer alan örneðimizde baþlangýç node muz F dir. Ýsterseniz bunu yorum satýrý yaparak diðer baþlangýç nodelarýndan da mininmum yolu nasýl bulduðunu inceleyebilirsiniz.

row=StartNode;%%satýrsal olarak iþleme baþlayacaðýz sutünsal bazda düþünsek de ayný sonuca ulaþacaktýk.

storeS=[];
storeE=[];
storeV=[];
values=[];

storePathS=[];
storePathE=[];

storeTabuS=[];
storeTabuE=[];   

while (size(storePathE)<9 & size(storePathS)<9)
    
    indexarray=find(array(row,:)); %Bulunduðumuz satýrdaki sýfýrdan farklý indis deðerlerini indexarray dizisinde tuutuk.
    
    for i=1:size(find(array(row,:)),2) %indexarray daki x y  indis deðerlerini storeE ve storeE dizilerinde tuttuk.
        storeE(end+1)=indexarray(i);
        storeS(end+1)=row;        
    end
    values=array(row,find(array(row,:)));
    storeV=[storeV values];   
    
    [value,index]=min(storeV);
    
    for i=1:8
        if array(row,i)==value;
            k=i;%minimum deðere sahip value' nin indisini k degiþkeninde tuttuk.
        end
    end  
 
    storePathE(end+1)=storeE(index);
    storePathS(end+1)=storeS(index);

  
    storeE(index)=[];
    storeS(index)=[];
    storeV(index)=[];
    
    storeTabuE=[storeE];    
    storeTabuS=[storeS];
    
     array(row,k)=0;%%gittitgim yol tekrardan kullanýlmasýn diye yol maliyet deðerlerini 0'ladýk.
     array(k,row)=0;
     
     row=storePathE(end);
end
display(storePathE);
display(storePathS);

