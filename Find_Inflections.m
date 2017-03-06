% function [datapeaks datavalleys] = findpeak(plotswitch,datain)
% This program finds peaks
% Arguments: 
%   ploswitch: 0 or 1 : disable or enable plots (for debugging)

function [datapeaks datavalleys] = findinflections(plotswitch,datain)
% datain = gconv;
datad1=[diff(datain)];
mp = find(datad1>0);
mn = find(datad1<=0);

datapeaks = [];
for pindex = 1:length(mp)
    [maxvalue, maxindex] = max(datain(mp(pindex):mn(min(find(mn>mp(pindex))))));
    if ~isempty(maxindex)
        datapeaks = cat(1,datapeaks, floor(mean(maxindex))+mp(pindex)-1);
    end
end
datapeaks= unique(datapeaks);

datavalleys = [];
for pindex = 1:length(mn)
    [minvalue, minindex] = min(datain(mn(pindex):mp(min(find(mp>mn(pindex))))));
    if ~isempty(minindex)
        datavalleys = cat(1,datavalleys, floor(mean(minindex))+mn(pindex)-1);
    end
end
datavalleys= unique(datavalleys);

if (plotswitch) 
    plot(1:length(datain),datain,'k-',mp,datain(mp),'b.',mn,datain(mn),'r.',datapeaks,datain(datapeaks),'g.',datavalleys,datain(datavalleys),'c.');
end