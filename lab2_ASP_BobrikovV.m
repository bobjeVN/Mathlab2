%% Read and listen
[bass, fS1] = audioread('bass.mp3');
[drums, fS2] = audioread('drums.mp3');
[guitars, fS3] = audioread('guitars.mp3');
[synths, fS4] = audioread('synths.mp3');
N1 = length(bass);
N2 = length(drums);
N3 = length(guitars);
N4 = length(synths);
Num_sec1 = N1/fS1;
Num_sec2 = N2/fS2; 
Num_sec3 = N3/fS3; 
Num_sec4 = N4/fS4;
%% Melody Matrix
melodyMatrix = [bass drums guitars synths];
tmpVector = ones(4,1);
melody = melodyMatrix * tmpVector;
sound(melody, fS1)
%% Minus one
mellody = melody - bass;
sound(mellody, fS1);

%% Signal distortion
T = Num_sec2/2;
time_array = (0: N2-1)/fS2;
volumeMod = sin(2*pi*time_array/T);
volumeMod = volumeMod';
volumeMod = volumeMod.* melody;
volumeMod = volumeMod.^2 * 2 - 1;
c = volumeMod .* melody;
sound(c, fS3);
%% Shorten melody

