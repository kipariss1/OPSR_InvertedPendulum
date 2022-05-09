function J=JMPC(x0,up,A,B,Q,R,M,W)
% evaluate basic quadratic criterion 
% on prediction horizon with discrete-time lin. model
% with LQR terminal penalty

Nu=size(B,2);
N=length(up)/Nu;

J=0;
x=x0;
for k=0:N-1
    
    u=up(k+1);  % uk
    
    J=J+x'*Q*x+u'*R*u+2*x'*M*u; % sum
    
    x=A*x+B*u;  % xk+1

end

J=J+x'*W*x; % xN

