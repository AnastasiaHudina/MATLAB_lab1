fS = 44100;
freqHalf = fS/2;
freqCut = 14000;
freq = [0 freqCut/freqHalf freqCut/freqHalf 1];
mLow = [1, 1, 0, 0];
B=fir2(8,freq,mLow);