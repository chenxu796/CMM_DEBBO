% Yao Xin benchmark
% maximal number of functional evaluations

switch problem
      
        case 1 
            maxFES = 1.5e5 ; % Sphere model
 
        case 2 
            maxFES = 2e5; % Schwefel's problem 2.22
 
        case 3 
            maxFES = 5e5; % Schwefel's problem 1.2
        
        case 4 
            maxFES = 5e5; % Schwefel's problem 2.21
 
        case 5 
            maxFES = 5e5; % Generalized Rosenbrock¡¯s functions 
             
        case 6 
            maxFES = 1.5e5; % Step function
          
        case 7 
            maxFES = 3e5; % Quartic function
              
        case 8 
            maxFES = 3e5; % Generalized Schwefel¡¯s problem 2.26
    
        case 9 
            maxFES = 3e5; % Generalized Rastrigin¡¯s function
            
        case 10 
            maxFES = 1.5e5; % Ackley¡¯s function
           
        case 11 
            maxFES = 2e5; % 3e5 % Generalized Griewank function
            
        case 12 
            maxFES = 1.5e5; % Generalized Penalized function 1
           
        case 13 
            maxFES = 1.5e5; % Generalized Penalized function 2
           
        case 14 
            maxFES = 1e4; % Shekel¡¯s Foxholes function
   
        case 15 
            maxFES = 4e5; % 2e5 % Kowalik¡¯s function
 
        case 16 
            maxFES = 1e4; % Six-Hump Camel-Back function          
             
        case 17 
            maxFES = 1e4; % Branin Function
            
        case 18 
            maxFES = 1e4; % Glodstein-Price function
 
        case 19 
            maxFES = 1e4; % Hartman¡¯s function 1
 
        case 20 
            maxFES = 2e4; % Hartman¡¯s function 2
             
        case 21 
            maxFES = 1e4; % Shekel¡¯s Function 1
 
        case 22
            maxFES = 1e4; % Shekel¡¯s Function 2
 
        case 23 
            maxFES = 1e4; % Shekel¡¯s Function 3
 
        
  end