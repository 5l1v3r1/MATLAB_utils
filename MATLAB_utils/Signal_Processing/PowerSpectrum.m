function out=PowerSpectrum(data)
data=data(3,34000:36000);
 % Apply wavelet denoising
data=wden(data,'rigrsure','s', 'sln',4,'db2');
[pxx f]=pwelch(data,[],[],[],256);
 % Find the desired frequency
deltaIdx = find(f>=1 & f<=4);
thetaIdx = find(f>=4 & f<=8);
alphaIdx = find(f>=8 & f<=13);
betaIdx  = find(f>=13 & f<=30);
gammaIdx = find(f>=30 & f<=50);
 
 % Compute power.
 deltaPower = mean(10*log10(pxx(deltaIdx)));
 thetaPower = mean(10*log10(pxx(thetaIdx)));
 alphaPower = mean(10*log10(pxx(alphaIdx)));
 betaPower  = mean(10*log10(pxx(betaIdx)));
 beta1Power  = mean(10*log10(pxx(beta1)));
 beta2Power  = mean(10*log10(pxx(beta2)));
 gammaPower = mean(10*log10(pxx(gammaIdx)));

out=deltaPower;
end