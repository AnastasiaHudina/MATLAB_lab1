%% Creating pitches
pitchDur=1;
fS=8000;
timeArray=0:1/fS: pitchDur;
A=1;
fi=0;
pitchA=A*sind(2*pi*pitchVSfreq(2,1)*timeArray+fi);
pitchB=A*sind(2*pi*pitchVSfreq(1,1)*timeArray+fi);
pitchC=A*sind(2*pi*pitchVSfreq(7,1)*timeArray+fi);
pitchD=A*sind(2*pi*pitchVSfreq(6,1)*timeArray+fi);
pitchE=A*sind(2*pi*pitchVSfreq(5,1)*timeArray+fi);
pitchF=A*sind(2*pi*pitchVSfreq(4,1)*timeArray+fi);
pitchG=A*sind(2*pi*pitchVSfreq(3,1)*timeArray+fi);
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
fprintf('%s', x2, wavFileName, x3, mp3FileName);
fprintf('\n');
fprintf('%s', x2, wavFileCompMet, x3, mp3FileCompMet);
fprintf('\n');
fprintf('%s', x2);
formatSpec = '%4.4f VS %4.4f';
fprintf(formatSpec,wavFileDur,mp3FileDur);
fprintf('\n');
fprintf('%s', x2);
formatSpec = '%u VS %u';
fprintf(formatSpec,wavFileRate,mp3FileRate);
fprintf('\n');
fprintf('%s', x4);
fprintf('\n');
