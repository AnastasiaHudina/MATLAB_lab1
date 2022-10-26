function signalOut = filteringBanks(signal, f_bank, gain, typeOfFilter)
f_bank_new = sum(gain .* f_bank);
switch typeOfFilter
    case 'filter'
        signalOut = filter(f_bank_new, 1, signal);
    case 'fftfilt'
        signalOut = fftfilt(f_bank_new, signal);
end