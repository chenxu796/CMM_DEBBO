%************************************************************************************************** 
%  Biogeography-based Optimization with Covariance Matrix based
%  Migration, Applied Soft Computing, 2016, doi:10.1016/j.asoc.2016.04.022
%  CMM-DE/BBO
%  Writer: Chen Xu
%  Date: 2015/03/14
%************************************************************************************************** 

clc;
clear all;  
format long; 
addpath('benchmark_YaoXin');  
fun = @benchmark_YaoXin;

for problem = 1:1
     
    Number = 1;
    runNumber = 1;  % The total number of runs  

    while Number <= runNumber

        tic 
        rand('seed', sum(100 * clock));  

        D = 30;
        problem_range;
        problem_maxFES; 
        
        Xmin = lu(1,:);
        Xmax = lu(2,:); 

        % intput parameters
        popsize = 100;
        I = 1; % max immigration rate for each island
        E = 1; % max emigration rate, for each island 
        SpeciesCount =  (popsize-1):-1:0;
        U = zeros(popsize, D); % allocate memory for the temporary population  
        CR = 0.9;  % crossover rate 
 
        Pe = 0.5;   % probability to use covariance matrix-based migration 

        % Compute migration rates, assuming the population is sorted from most fit to least fit
        for k= 1 : popsize
            lambda(k) = I * (1 - SpeciesCount(k)/popsize);
            mu(k) = E * SpeciesCount(k)/popsize;
        end 
        
        % Initialize the main population            
        X = repmat(Xmin, popsize, 1) + rand(popsize, n) .* (repmat(Xmax-Xmin, popsize, 1));
        val_X = fun(X,problem);   

        outcome = [];  % record the best results 
        FES = 0; 

        while   FES < maxFES  
 
            % sort the population based on fitness
            [~,sortIndex] = sort(val_X);
            X = X(sortIndex,:);  val_X = val_X(sortIndex,:);  
        
            [Q, ~] = eig(cov(X));
            X_eig = X * Q;
            % Hybrid migration operator of DE/BBO
            for k = 1 : popsize
                 if rand<Pe
                    Uk_eig = DEBBO_Migration(X_eig,lambda,mu,k,CR);  % covariance matrix based migration
                    U(k,:) = Uk_eig*Q';
                 else
                    U(k,:) = DEBBO_Migration(X,lambda,mu,k,CR);
                 end
            end 
            
            U = boundConstraint_reflect(U,Xmin,Xmax);            
            val_U = fun(U,problem);   % calculate cost
            FES = FES + popsize; 
            
            for k = 1 : popsize
                if val_U(k,:)<val_X(k,:)
                    val_X(k,:) = val_U(k,:); X(k,:) = U(k,:);
                end 
            end
              
            val_gBest = min(val_X); 
            outcome = [outcome; val_gBest*ones(popsize,1)];   
                        
            if mod(FES,1e4)==0
                disp(sprintf('problem=%d;  Number=%d;  FES=%d;  val_gBest=%d;',problem,Number,FES,val_gBest)); 
            end
        
        end

        disp(sprintf('problem=%d;  Number=%d;  FES=%d;  val_gBest=%d;  runtime=%d;',problem,Number,FES,val_gBest,toc)); 


%       record the results
        eval(['record.outcome',num2str(Number),'=','outcome',';']);
        record.FES(Number) = FES;
        record.time(Number) = toc; 

        Number = Number + 1;  
    end

%   Save data
    filename = strcat( 'out_f', num2str(problem),'_CMM_DEBBO');  
    save(filename, 'record');
 
end
 