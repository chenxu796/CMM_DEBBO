function Uk = DEBBO_Migration(X,lambda,mu,k,CR)
% DEBBO Migration model for DE/BBO

[popsize,D] = size(X);

r = generateR(popsize,k);
j_rand = randi(D);
 for j = 1 : D
     if rand<lambda(k)
         if rand<CR || j==j_rand
             F = rand;
             Uk(j) = X(r(1),j) + F*(X(r(2),j)-X(r(3),j));   % DE/rand/1 
         else
            RandomNum = rand * sum(mu); % select SelectIndex based on mu
            Select = mu(1);
            SelectIndex = 1;
            while (RandomNum > Select) && (SelectIndex < popsize)
                SelectIndex = SelectIndex + 1;
                Select = Select + mu(SelectIndex);
            end
            Uk(j) = X(SelectIndex,j); 
         end
     else
         Uk(j) = X(k,j);
     end 
 end      
 
