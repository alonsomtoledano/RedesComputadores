uiopen('C:\Users\Alonso\Desktop\Nebrija\2º Año\2º Cuatrimestre\Redes de ordenadores\Practicas\Practica 2\Grafo.csv', 1);
n_start=3;
G=Grafo;
A=G(n_start,:); A(n_start)=0; A(isnan(A))=10e6;
B=zeros(1,length(G)); B(n_start)=1;
for i=2:length(G)
    [mag,pos]=sort(A(i-1,:));
    for j=1:length(G)
        if B(pos(j))~=1
            new_index=pos(j);
            new_magnitude=mag(j);
            break;
        end
    end
    
    B(1,new_index)=1;
    new_A=G(new_index,:)+new_magnitude;
    A=[A; min(new_A,A(i-1,:))]
end
