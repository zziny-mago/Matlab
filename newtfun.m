function [x, f, convg] = newtfun(fh, dfh, x0)
% NEWTON  Uses Newton's method to solve f(x) = 0.
%                   fh is handle to f(x), dfh is handle to f'(x).
%                   Initial guess is x0.
%                   Returns final value of x, f(x), and
%                   convg (1 = convergence, 0 = divergence)
steps = 0;                         % iteration counter
x = x0;
re = 1e-8;                         % required relative error
myrel = 1;
while myrel > re & (steps < 2000)
    xold = x;
    x = x - feval(fh, x)/feval(dfh, x);
    steps = steps + 1;
    disp( [x feval(fh, x)] )
    myrel = abs((x-xold)/x);
end;
if myrel <= re
    convg = 1;
else
    convg = 0;
end;
f = feval(fh, x);
