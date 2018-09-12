function [bw,level]=fcmthresh(IM,sw)
if (nargin<1)
    error('You must provide an image.');
elseif (nargin==1)
    sw=0;
elseif (sw~=0 && sw~=1)
    error('sw must be 0 or 1.');
end
data=reshape(IM,[],1);
[center,member]=fcm(data,3);
[center,cidx]=sort(center);
member=member';
member=member(:,cidx);
[maxmember,label]=max(member,[],2);
if sw==0
    level=(max(data(label==1))+min(data(label==2)))/2;
else
    level=(max(data(label==2))+min(data(label==3)))/2;
end
bw=im2bw(IM,level);