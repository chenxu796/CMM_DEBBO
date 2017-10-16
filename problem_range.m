% Yao Xin benchmark

switch problem
      
     case 1 
            % lu: define the upper and lower bounds of the variables
            n = D; % Sphere model
            lu = [-100 * ones(1, n); 100 * ones(1, n)];

        case 2 
            n = D; % Schwefel's problem 2.22
            lu = [-10 * ones(1, n); 10 * ones(1, n)];

        case 3 
            n = D; % Schwefel's problem 1.2
            lu = [-100 * ones(1, n); 100 * ones(1, n)];
       
        case 4 
            n = D; % Schwefel's problem 2.21
            lu = [-100 * ones(1, n); 100 * ones(1, n)];

        case 5 
            n = D; % Generalized Rosenbrock¡¯s functions 
            lu = [-30 * ones(1, n); 30 * ones(1, n)];
            
        case 6 
            n = D; % Step function
            lu = [-100 * ones(1, n); 100 * ones(1, n)];
         
        case 7 
            n = D; % Quartic function
            lu = [-1.28 * ones(1, n); 1.28 * ones(1, n)];
             
        case 8 
            n = D; % Generalized Schwefel¡¯s problem 2.26
            lu = [-500 * ones(1, n); 500 * ones(1, n)];
   
        case 9 
            n = D; % Generalized Rastrigin¡¯s function
            lu = [-5.12 * ones(1, n); 5.12 * ones(1, n)];
           
        case 10 
            n = D; % Ackley¡¯s function
            lu = [-32 * ones(1, n); 32 * ones(1, n)];
          
        case 11 
            n = D; % Generalized Griewank function
            lu = [-600 * ones(1, n); 600 * ones(1, n)];
           
        case 12 
            n = D; % Generalized Penalized function 1
            lu = [-50 * ones(1, n); 50 * ones(1, n)];
          
        case 13 
            n = D; % Generalized Penalized function 2
            lu = [-50 * ones(1, n); 50 * ones(1, n)];
          
        case 14 
            n = 2; % Shekel¡¯s Foxholes function
            lu = [-65.536 * ones(1, n); 65.536 * ones(1, n)];
  
        case 15 
            n = 4; % Kowalik¡¯s function
            lu = [-5 * ones(1, n); 5 * ones(1, n)]; 

        case 16 
            n = 2; % Six-Hump Camel-Back function          
            lu = [-5 * ones(1, n); 5 * ones(1, n)];
            
        case 17 
            n = 2; % Branin Function
            lu = [-5 10; 0 15];
           
        case 18 
            n = 2; % Glodstein-Price function
            lu = [-2 * ones(1, n); 2 * ones(1, n)]; 

        case 19 
            n = 3; % Hartman¡¯s function 1
            lu = [-0 * ones(1, n); 1 * ones(1, n)]; 

        case 20 
            n = 6; % Hartman¡¯s function 2
            lu = [-0 * ones(1, n); 1 * ones(1, n)];
            
        case 21 
            n = 4; % Shekel¡¯s Function 1
            lu = [-0 * ones(1, n); 10 * ones(1, n)]; 

        case 22
            n = 4; % Shekel¡¯s Function 2
            lu = [-0 * ones(1, n); 10 * ones(1, n)]; 

        case 23 
            n = 4; % Shekel¡¯s Function 3
            lu = [-0 * ones(1, n); 10 * ones(1, n)]; 

        
  end