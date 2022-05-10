function J=JMPC(x0,up,sp,A,B,Q,R,M,W)
% evaluate basic quadratic criterion 
% on prediction horizon with discrete-time lin. model
% with LQR terminal penalty

Nu=size(B,2);
N=length(up)/Nu;

J=0;
x=x0;           % initial x
e = sp - x;     % initial error

for k=0:N-1
    
    u=up(k+1);  % uk
    
%     if k>=1
%         delta_u = u - up(k);
%     else 
%         delta_u = 0;
%     end
        
    J=J+e'*Q*e+u'*R*u+2*x'*M*u; % sum
    
    x=A*x+B*u;  % xk+1
    
    e = sp - x; % e[k+1]

end

J=J+e'*W*e; % xN

