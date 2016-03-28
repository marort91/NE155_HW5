function [x, iter] = JacobiSolve(A,b,maxiter,tol,stopcrit)

x0 = zeros(length(b),1);
x = zeros(length(b),1);

if ( strcmp(stopcrit,'absolute') == 1 )
    
    res = @(x,y) norm(x-y);
    
elseif ( strcmp(stopcrit,'relative') == 1 )
    
    res = @(x,y) norm(x-y)/norm(x);
    
else
    
    error('Stopping criterion not defined')
    
end

for k = 1:maxiter
    
    for i = 1:length(A)
        
        sigma = 0;
        
        for j = 1:length(A)
            
            if ( i == j )
                
                continue
                
            else
                
                sigma = sigma + A(i,j)*x0(j);
                
            end
            
        end
        
        x(i) = ( b(i) - sigma )/A(i,i);
        
    end
    
    residual = res(x,x0);
    
    if ( residual < tol )
        
        break
        
    else
        
        x0 = x;
        
    end
    
end

iter = k;

return