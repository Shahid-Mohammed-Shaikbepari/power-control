g11 = 0.7;
g22 = 0.4;
g12 = 0.4; 
g21 = 0.1;
N = 1;
theta = 2;
if g11*g22 >= theta^2*g12*g21
    fprintf("Yes minimum power solution exits");
else
    fprintf("No there isn't a solution");
end

P1= linspace(0, 50); % Adapt n for resolution of graph
P2= ((theta*g12*P1)+N*theta)/g22; %l2
p = plot(P2, P1);%l2
p.LineWidth = 2;
hold on;
P2 = linspace(0, 150);
P1 = (theta*g21*P2+ N*theta)/g11; %l1
p = plot(P2, P1);%l1
p.LineWidth = 2;
    
xlabel('P2(mW)', 'FontSize', 18);
ylabel('P1(mW)', 'FontSize', 18);
title('Power control on Channels for theta = 2', 'FontSize', 18);
% lgd = legend('theta = 1 and l1', 'theta = 1 and l2', 'theta = 2 and l1', 'theta = 2 and l2' );
lgd = legend('l2', 'l1');
lgd.FontSize = 18;
hold off;

