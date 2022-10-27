%% Filters design
freqArray1 = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000, 16000];
order1 = 1024; % должен быть четным
%% 
fS = 44100;
result = CreateFilters(freqArray1, order1, fS);

%% filtering of signals
[mp3, fS] = audioread('Stronger.mp3');
gain = ones(length(freqArray1), 1);
initB = zeros(1, order1);
tic; [signlout0, initB] = filteringBanks(mp3, result, gain, 'filter', initB); toc;
tic; signlout1 = filteringBanks(mp3, result, gain, 'fftfilt', initB); toc;
tic; signlout2 = filteringBanks(mp3, result, gain, 'convFilter', initB); toc; 
%% Stream sound
deviceWriter = audioDeviceWriter('SampleRate', fS);
fileReader = dsp.AudioFileReader('Stronger.mp3');
gain = [10 10 10 0.1*ones(1, 7)]';
gain=ones(10,1);
while ~isDone(fileReader)
    gain = rand(size(freqArray1))'; 
    audiodata = fileReader();
    [dataPortionFiltering,initB]=filteringBanks(audiodata,result,gain,'filter',initB); 
    deviceWriter(dataPortionFiltering);
end