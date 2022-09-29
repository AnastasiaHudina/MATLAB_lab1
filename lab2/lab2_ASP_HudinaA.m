%% Read and listen
[bass, Fs] = audioread("bass.mp3");
%sound(bass, Fs);
[drums, ~] = audioread("drums.mp3");
[synths, ~] = audioread("synths.mp3");
[guitars, ~] = audioread("guitars.mp3");

szBass=size(bass);
Ts=1/Fs;
dur=Ts*szBass(1);

%bassdur = length(bass)/Fs;
%drumsdur = length(drums)/Fs;
%synthsdur = length(synths)/Fs;
%guitarsdur = length(guitars)/Fs;
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

%f = 2 / (lengthBass);
%t = (0:length(bass) - 1) / fs;
%volumeMod = sin(2*pi*f*t);

volumeMod=volumeMod';
sound(melody.*volumeMod, Fs);
sound(melody.*(volumeMod.*volumeMod*2-1), Fs);