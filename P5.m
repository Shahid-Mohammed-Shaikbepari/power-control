noise_to_gain = [3, 6, 1, 9, 5];
noise_to_gain = sort(noise_to_gain );

p1 = zeros(1, 26);
p2 = zeros(1, 26);
p3 = zeros(1, 26);
p4 = zeros(1, 26);
p5 = zeros(1, 26);
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
    p1(ind) = slope*Pt(ind) + p1(breakPoints(i)+1);
    if numOfActiveChannels >= 2
        p2(ind) = slope*Pt(ind)+ p2(breakPoints(i)+1);
    end
    if numOfActiveChannels >= 3
        p3(ind) = slope*Pt(ind)+ p3(breakPoints(i)+1);
    end
    if numOfActiveChannels >= 4
        p4(ind) = slope*Pt(ind)+ p4(breakPoints(i)+1);
    end
    if numOfActiveChannels >= 5
        p5(ind) = slope*Pt(ind)+ p5(breakPoints(i)+1);
    end
end
markers = ['o', '+', '*', 'x', '^'];
for k = 1:5
p = plot(Pt, );
p.Marker = markers(k);
p.MarkerSize = 10;
p.LineWidth = 2;
hold on;
end
% plot(Pt, p2);
% hold on;
% plot(Pt, p3);
% hold on;
% plot(Pt, p4);
% hold on;
% plot(Pt, p5);
% hold on;
title("Power per channel versus total power", 'FontSize', 18);
xlabel('Total Power', 'FontSize', 18);
ylabel('Power to each channel', 'FontSize', 18);
lgd = legend('P1', 'P2', 'P3', 'P4', 'P5');
lgd.FontSize = 18;
hold off;
