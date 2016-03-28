function [x, iter] = SORSolve(A,b,maxiter,tol,omega,stopcrit)

x = zeros(length(A),1);

if ( strcmp(stopcrit,'absolute') == 1 )
    
    res = @(x,y) norm(x-y);
    
elseif ( strcmp(stopcrit,'relative') == 1 )
    
    res = @(x,y) norm(x-y)/norm(x);
    
else
    
    error('Stopping criterion not defined')
    
end

for k = 1:maxiter
    
    xprev = x;
    
    for i = 1:length(A)
        
        sigma = 0;
        
        for j = 1:length(A)
            
            if ( i == j )
                
                continue
                
            else
            
                sigma = sigma + A(i,j)*x(j);
                
            end
            
        end
        
        x(i) = ( 1-omega )*x(i) + omega*( b(i) - sigma )/A(i,i);
        
    end
    
    residual = res(x,xprev);
    
    if ( residual < tol )
        
        break
        
    end
    
end

iter = k;

return