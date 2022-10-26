%% Read and listen
[bass, Fs] = audioread("bass.mp3");
sound(bass, Fs);
[drums, ~] = audioread("drums.mp3");
sound(drums, Fs);
[synths, ~] = audioread("synths.mp3");
sound(synths, Fs);
[guitars, ~] = audioread("guitars.mp3");
sound(guitars, Fs);
%опред длительность
szBass=size(bass);
Ts=1/Fs;
dur=Ts*szBass(1);

%another variant
bassdur = length(bass)/Fs;
drumsdur = length(drums)/Fs;
synthsdur = length(synths)/Fs;
guitarsdur = length(guitars)/Fs;
%% Melody Matrix
MelodyMatrix = [bass, drums, synths, guitars];
tmpVector = ones(4,1);
melody = MelodyMatrix*tmpVector;
sound (melody, Fs);
%% Minus one
sound(melody - guitars, Fs);
%% Signal distortion
timeArray=0:Ts:dur-Ts;
A=1;
t=(0:1:length(bass)-1)*Ts;
f=2/(length(bass));
volumeMod=A*sin(2*pi*f*timeArray);

%teacher said
%f = 2 / (lengthBass);
%t = (0:length(bass) - 1) / Fs;
%volumeMod = sin(2*pi*f*t);

volumeMod=volumeMod';
sound(melody.*volumeMod, Fs);
sound(melody.*(volumeMod.*volumeMod*2-1), Fs);
%% Shorten melody
%point a
X = MelodyMatrix';
tmp = X(1:1:length(X(:))/2);
halfMelodyMatrix = reshape(tmp, 4,length(tmp)/4);

%фффффффффффуtmp1 = reshape(halfMelodyMatrix, length(tmp)/4,4);

halfMelody = sum(halfMelodyMatrix);
sound(halfMelody,Fs)
%point b
halfMelody1 = melody(1:end/2, 1);
%% 2-channel sound
melodya = (melody>0);
melodyb = (melody<=0);
lmelodya=length(melodya);
lmelodyb=length(melodyb);
Fsa=lmelodya/bassdur;
Fsb=lmelodyb/bassdur;
sound(melodya,Fsa);
sound(melodyb,Fsb);
melody1 = melody.*(melody>0.5);
melody2 = melody.*(melody<0.5);
twochannel1 = [melody1, melody2];
sound(twochannel1,Fs);

twochannel2 = [melody flip(melody)];
sound(twochannel2,Fs);