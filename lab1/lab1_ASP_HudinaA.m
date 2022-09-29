%% Creating pitches
pitchDur=1;
fS=8000;
timeArray=0:1/fS: pitchDur;
A=1;
fi=0;
pitchA=A*sin(2*pi*pitchVSfreq(2,1)*timeArray+fi);
pitchB=A*sin(2*pi*pitchVSfreq(1,1)*timeArray+fi);
pitchC=A*sin(2*pi*pitchVSfreq(7,1)*timeArray+fi);
pitchD=A*sin(2*pi*pitchVSfreq(6,1)*timeArray+fi);
pitchE=A*sin(2*pi*pitchVSfreq(5,1)*timeArray+fi);
pitchF=A*sin(2*pi*pitchVSfreq(4,1)*timeArray+fi);
pitchG=A*sin(2*pi*pitchVSfreq(3,1)*timeArray+fi);
%%  Read the file with pitches
fid=fopen('song.txt', 'r');
formatspec='%s';
song=fscanf(fid, formatspec);
fclose(fid);
s=whos(song);
%% Create the song and the file.wav 
sigSong=[pitchF pitchC pitchF pitchC pitchF pitchE pitchE ...
    pitchE pitchC pitchE pitchC pitchE pitchF pitchF...
    pitchF pitchC pitchF pitchC pitchF pitchE pitchE...
    pitchE pitchC pitchE pitchC pitchF];
sound(sigSong,fS);
audiowrite('firstSong.wav',sigSong,fS);
audioWavInfo=audioinfo('firstSong.wav');
wavFileName=audioWavInfo.Filename;
wavFileCompMet=audioWavInfo.CompressionMethod;
wavFileNumCh=audioWavInfo.NumChannels;
wavFileRate=audioWavInfo.SampleRate;
wavFileSamples=audioWavInfo.TotalSamples;
wavFileDur=audioWavInfo.Duration;
%% Listen the mp3 file
[sigSong,fS]=audioread('songi.mp3');
sound(sigSong,fS);
audioMP3Info=audioinfo('songi.mp3');
mp3FileName=audioMP3Info.Filename;
mp3FileCompMet=audioMP3Info.CompressionMethod;
mp3FileNumCh=audioMP3Info.NumChannels;
mp3FileRate=audioMP3Info.SampleRate;
mp3FileSamples=audioMP3Info.TotalSamples;
mp3FileDur=audioMP3Info.Duration;
mp3FileTitle=audioMP3Info.Title;
mp3FileArtist=audioMP3Info.Artist;
mp3FileBitRate=audioMP3Info.BitRate;
save('data.mat', 'mp3FileName','mp3FileBitRate','mp3FileCompMet', ...
    'mp3FileNumCh','mp3FileRate', 'mp3FileSamples', ...
    'mp3FileDur', 'mp3FileTitle', 'mp3FileArtist');
%% fprintf
x1="----------.MP3 VS .WAV----------";
x2="          ";
x3=" VS ";
x4="------------------------------";
fprintf('%s\n', x1);
fprintf('          %s VS %s\n', convertCharsToStrings(wavFileName), convertCharsToStrings(mp3FileName));
fprintf('          %s VS %s\n', convertCharsToStrings(wavFileCompMet), convertCharsToStrings(mp3FileCompMet));
fprintf('          %4.4f VS %4.4f \n',wavFileDur,mp3FileDur);
fprintf('          %u VS %u \n',wavFileRate,mp3FileRate);
fprintf('%s\n', x4);
%% disp
X = ['          ',wavFileName,' VS ', mp3FileName];
Y = ['          ',wavFileCompMet,' VS ', mp3FileCompMet];
Z = ['          ',num2str(wavFileDur),' VS ', num2str(mp3FileDur)];
G = ['          ',num2str(wavFileRate),' VS ', num2str(mp3FileRate)];
disp(x1);
disp(X);
disp(Y);
disp(Z);
disp(G);
disp(x4);
%% EXTRA TASK 1
A=1;
B=A-10;
C=B-10;
D=C-10;

pitchC=A*sin(2*pi*pitchVSfreq(7,1)*timeArray+fi);
pitchE=A*sin(2*pi*pitchVSfreq(5,1)*timeArray+fi);
pitchF=A*sin(2*pi*pitchVSfreq(4,1)*timeArray+fi);
sigSong1=[pitchF pitchC pitchF pitchC pitchF pitchE pitchE];
audiowrite('song1.wav',sigSong1,fS);
clear pitchC pitchE pitchF;

pitchC=B*sin(2*pi*pitchVSfreq(7,1)*timeArray+fi);
pitchE=B*sin(2*pi*pitchVSfreq(5,1)*timeArray+fi);
pitchF=B*sin(2*pi*pitchVSfreq(4,1)*timeArray+fi);
sigSong2=[pitchE pitchC pitchE pitchC pitchE pitchF pitchF];
audiowrite('song2.wav',int16(sigSong2),fS);
clear pitchC pitchE pitchF;

pitchC=C*sin(2*pi*pitchVSfreq(7,1)*timeArray+fi);
pitchE=C*sin(2*pi*pitchVSfreq(5,1)*timeArray+fi);
pitchF=C*sin(2*pi*pitchVSfreq(4,1)*timeArray+fi);
sigSong3=[pitchF pitchC pitchF pitchC pitchF pitchE pitchE];
audiowrite('song3.wav',int16(sigSong3),fS);
clear pitchC pitchE pitchF;

pitchC=D*sin(2*pi*pitchVSfreq(7,1)*timeArray+fi);
pitchE=D*sin(2*pi*pitchVSfreq(5,1)*timeArray+fi);
pitchF=D*sin(2*pi*pitchVSfreq(4,1)*timeArray+fi);
sigSong4=[pitchE pitchC pitchE pitchC pitchF];
audiowrite('song4.wav',int16(sigSong4),fS);
%% EXTRA TASK 2
A1= randi(10, 3, 2);
s1=(A1(1,1) + A1(2,1) +  A1(3,1)) * sin(2*pi*pitchVSfreq(2,1)*timeArray);
s2=(A1(1,2) + A1(2,2) +  A1(3,2)) * sin(2*pi*pitchVSfreq(2,1)*timeArray);