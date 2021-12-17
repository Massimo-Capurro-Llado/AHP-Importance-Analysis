function[ranking] = DegreeCentrality(A,numerosity)
%numerosity è la lunghezza del vettore ranking in output richiesta
    
%calcolo il numero di nodi dalla matrice di adiacenza A
    nodes = size(A,1);

%calcolo il numero di link di ciascun nodo e li ordino in senso decrescente
    D = sum(A');
    D_sort = sort(D,'descend');
    
%ottengo gli indici dei nodi in D_sort
    ranking = [];
    for j=1:nodes
        ranking = [ranking,find(D(1,:)==D_sort(j))];
    end

%elimino i duplicati e restituisco array di numerosità richiesta
    ranking=unique(ranking,"stable");
    ranking = ranking(1:numerosity);
end

