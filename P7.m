function [P1, P2] = P7()
    g11 = 0.7;
    g22 = 0.4;
    g12 = 0.4; 
    g21 = 0.1;
    N = 1;
    theta = 2;
    P1 = 5;
    P2 = 30;
    P1_next = 0;
    P2_next = 0;
    %power units are mW
    
    isConverged = false;
    P1_next = zeros(1, 100);
    P2_next = zeros(1, 100);
    i = 1;
    for j = 1:100
        SINR1 = P1*g11/(g21*P2 + N);
        SINR2 =  P2*g22/(g12*P1 + N);
        P1_next(j) = theta*P1/SINR1;
        P2_next(j) = theta*P2/SINR2;
%         if P1 == P1_next(i) && P2 == P2_next(i)
%             isConverged = true;
%         end
        P1 = P1_next(j);
        P2 = P2_next(j);
%         i = i +1;
    end
    fprintf('P1, P2, i = %f\t%f\t%f\n', P1, P2, i);
%     P1_next = P1_next(1:i-1);
%     P2_next = P2_next(1:i-1);
    t = 0:1: 99;
    plot(t, P1_next);
    hold on;
    plot(t, P2_next);
    xlabel('Iterations', 'FontSize', 18);
    ylabel('Power alloted', 'FontSize', 18);
    title('Power allocation per channel vs Iterations', 'FontSize', 18);
    legend('P1', 'P2', 'FontSize', 18);
    hold off;
    
end

