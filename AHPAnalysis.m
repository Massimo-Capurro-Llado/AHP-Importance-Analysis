function [D_weight, E_weight, C_weight, P_weight] = AHPAnalysis(table)
    % This function calculates the weight every method has in the Analysis of a network.
    % Parameters: table -> This table contains the data of the file created copying all the
    %   rows of 'http://www.sqware.it/AHP/Questionario/Analizza.php?id=6' page. Every row is
    %   an answer given by a certain user to a comparison between two of the methods. 
    % Output: D_weight, C_weight, E_weight, P_weight -> The weight value for every method. This
    %   must be a best compromise between all the answers received to the questionnaire. 


    n = 4; % Number of methods actually present
    user_list = unique(table{:,1}); % List of users that answered the questionnaire
    rr = zeros(n,1); % This accumulates the r result for every user
    LL = zeros(n,n); % This accumulates the L of every user
    
    % Iterate over every user that has compiled the questionnaire
    for u=1:length(user_list)
        user= user_list(u);
        M = zeros(n,n);

        for i=1:size(table,1)

            if strcmp(string(table{i,1}), user)
                from = ElementConverter(table{i,"Categoria1"});
                to = ElementConverter(table{i,"Categoria2"});
                value = AnswerConverter(table.Risposta(i));

                if min([from,to,value])>0
                    M(from,to) = value;
                    M(to,from) = inv(value);
                end
            end
        end

        P = log(M);
        P(find(isinf(P))) = 0;
        r = P*ones(n,1);
        rr = rr+r; % Add current user's r to the collection
        A = (M>0);
        D = diag(sum(A'));
        L= D-A;
        LL = LL+L; % Add current user's L to the collection
    end

    y = pinv(LL)*rr;
    w=exp(y);
    w=w./sum(w);

    D_weight= w(1);
    E_weight= w(2);
    C_weight= w(3);
    P_weight= w(4);


    % This function transforms an answer to a corresponding weight.
    % Parameters: answer -> Corresponds to a single row (of the table
    %   of the excel file) which represents an answer from a user in the AHP site 
    % Output: weight -> The weight of the answer
    function [weight] = AnswerConverter(answer)

        switch true
            case answer == "much less important"
                weight = 1/4;
            case answer == "less important"
                weight = 1/2;
            case answer == "equally important"
                weight = 1;
            case answer == "more important"
                weight = 2;
            case answer == "much more important"
                weight = 4;
            otherwise
                weight = -1;
        end
    end


    % This function transforms an element to a corresponding 'node'.
    % Parameters: element -> Corresponds to the single row element for 'Categoria'
    %   (where the methods confronted are being defined)
    % Output: n -> The node number for the method recieved
    function [n]= ElementConverter(element)
       
        switch true
            case element == "Degree Centrality"
                n = 1;
            case element == "Eigen Centrality"
                n = 2;
            case element == "Closeness Centrality"
                n = 3;
            case element == "Pairwise Connectivity"
                n = 4;
            otherwise
                n = -1;
        end
    end
end