function [signalOut, initB] = filteringBanks(signal, f_bank, gain, typeOfFilter, initB)
f_bank_new = sum(gain .* f_bank,1);

switch typeOfFilter
    case 'filter'
        [signalOut, initB] = filter(f_bank_new, 1, signal, initB);
    case 'fftfilt'
        signalOut = fftfilt(f_bank_new, signal);
    case 'convFilter'
        signalOut = convFilter(f_bank_new, signal);    
end
end
function signalOut2 = convFilter(bBank, signal)
    sizeA = size(signal);
    if sizeA(1) < sizeA(2)
        for i = 1:sizeA(1)
            signalOut2(i,:) = conv(signal(i,:), bBank);
        end
    else
        for i = 1:sizeA(2)
            signalOut2(:,i) = conv(signal(:,i), bBank);
        end
    end
end
