clear all
close all

% Initial values needed to be entered
% Inputs:
fonk=@(x) x^2-2; % a function to find its root (let's find the roots of sin(x) between x=xl and xu)
d_fonk=@(x) 2*x; % derivative of the function
xr=2; % initial value (look for the root around this value)
es=0.001; % stopping criterion (Stop if error is less than this)
imax=100; % maximum iteration number (to protect infinite loop)
bound_eps=0.8; % parameter to plot the function around the initial guess ([xr-bound_eps xr+bound_eps])

figure(1)
fplot(fonk,[xr-bound_eps xr+bound_eps]) % plot the function
title('Plot of the function "fonk" to search the roots around the red circle')
grid
hold on
plot(xr,0,'o','LineWidth',1.5,'MarkerSize',9,'MarkerEdgeColor','r','MarkerFaceColor','c')
xl=xr-bound_eps;
xu=xr+bound_eps;
plot([xl xu],[0 0],'k-','LineWidth',2)
hold off

% Algorithm started
iter = 0;
while (1)
    xrold = xr;
    xr = xr - fonk(xr)/d_fonk(xr); % Newton-Raphson Equation
    iter = iter + 1;
    
    pause % press any key to continue when you run the program
    % Figure operations started
    figure(1)
    fplot(fonk,[xl xu]) % plot the function
    grid
    fr=fonk(xr);
    frold=fonk(xrold);
    hold on
    
    % Plot related with xrold
    plot(xrold,frold,'rx','LineWidth',1.5,'MarkerSize',9)
    plot([xrold xrold],[0 frold],'c-.','LineWidth',1.5)
    plot(xrold,0,'o','LineWidth',1.5,'MarkerSize',9,'MarkerEdgeColor','r','MarkerFaceColor','c')
    
    % Plot related xr on the x-axis
    plot(xr,0,'o','LineWidth',1.5,'MarkerSize',9,'MarkerEdgeColor','m','MarkerFaceColor','y')
    
    % Plot the tangent line with a green line
    plot([xr xrold],[0 frold],'g-','LineWidth',2)
    
    % Plot black line through the x-axis
    plot([xl xu],[0 0],'k-','LineWidth',2)
    
    % Title of the figure
    title(sprintf('iteration=%d',iter))
    hold off
    
    if xr ~= 0
        ea = abs((xr - xrold)/xr) * 100;
    end
    if ((ea <= es) | (iter >= imax))
        break
    end
end

Root_Newt_Raph = xr
Numb_iter=iter