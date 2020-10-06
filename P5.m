noise_to_gain = [3, 6, 1, 9, 5];
noise_to_gain = sort(noise_to_gain );
p = zeros(5, 26);
Pt = 0:1:25;
numOfActiveChannels = 1;
breakPoints = zeros(1, length(noise_to_gain));
for i = 1: length(breakPoints)
    sum = 0;
    for j = 1: i
    sum = sum + (noise_to_gain(i) - noise_to_gain(j));
    end
    breakPoints(i) = sum;
end
i = 1;
for ind = 1: 26
    if i< 5 && Pt(ind) > breakPoints(i+1)
        numOfActiveChannels = numOfActiveChannels +1;
        i = i+1;
    end
    slope = 1/numOfActiveChannels ;
    % current power to channel i = slope*Pt + power_at_prev_breakPoint
    p(1,ind) = slope*Pt(ind) + p(1, breakPoints(i)+1);
    if numOfActiveChannels >= 2
        p(2, ind) = slope*Pt(ind)+ p(2, breakPoints(i)+1);
    end
    if numOfActiveChannels >= 3
        p(3, ind) = slope*Pt(ind)+ p(3, breakPoints(i)+1);
    end
    if numOfActiveChannels >= 4
        p(4, ind) = slope*Pt(ind)+ p(4, breakPoints(i)+1);
    end
    if numOfActiveChannels >= 5
        p(5, ind) = slope*Pt(ind)+ p(5, breakPoints(i)+1);
    end
end
markers = ['o', '+', '*', 'x', '^'];
for k = 1:5
pl = plot(Pt, p(k,:));
pl.LineWidth = 2;
hold on;
end

title("Power per channel versus total power", 'FontSize', 18);
xlabel('Total Power', 'FontSize', 18);
ylabel('Power to each channel', 'FontSize', 18);
lgd = legend('P1', 'P2', 'P3', 'P4', 'P5');
lgd.FontSize = 18;
hold off;
