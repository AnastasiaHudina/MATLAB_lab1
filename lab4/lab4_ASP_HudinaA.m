%% Filters design
freqArray = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order = 1024; % должен быть четным
fS = 44100;
bBank = CreateFilters(freqArray, order, fS);
nums = randperm(10,3);
bTmp = bBank(nums, :);
%частотная характеристика - это что?
for i=1:3
    [H(i, :), w(i, :)] = freqz(bTmp(i,:), 1, order);
end
x_db =@(x)20 * log10(x);
H_db = x_db(abs(H));
w = (w / pi) * (fS / 2);
%% Graph with standard functions
p1=plot(w(1, :),H_db(1, :), '-k', 'LineWidth', 1); hold on;
p2=plot(w(2, :),H_db(2, :),':*b', 'LineWidth', 1);
p3=plot(w(3, :),H_db(3, :),'-.rs', 'LineWidth', 1);
grid on;
title('Filters', 'FontSize', 16);
xlabel('f, kHz', 'FontSize', 16);
ylabel('|H|, dB', 'FontSize', 16);
legend('№1', '№2', '№3');
xlim([0, 21000]);
ylim([-60, 10]);
xticks([2000, 8000, 16000]);
xticklabels({'2 khz', '8 khz', '16 khz'});
%% Graph with changing object properties

%% Graph with no formatting
P1=plot(w(1, :), H_db(1, :)); hold on;
P2=plot(w(2, :), H_db(2, :));
P3=plot(w(3, :), H_db(3, :)); grid on;