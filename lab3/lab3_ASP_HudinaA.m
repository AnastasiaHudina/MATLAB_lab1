%% Filters design
freqArray1 = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order1 = 1024; % должен быть четным
fS = 44100;
result = CreateFilters(freqArray1, order1, fS);
%% Filtering of signals
[mp3,fS] = audioread('song.mp3');
gain = ones(length(freqArray1), 1);
tic; signalOut0 = filteringBanks(mp3, result, gain, 'filter'); toc;
tic; signalOut1 = filteringBanks(mp3, result, gain, 'ffilter'); toc;