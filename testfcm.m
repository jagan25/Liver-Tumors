clear;clc;
im=imread('1l.jpeg');
J=im;
fim=mat2gray(im);
level=graythresh(fim);
bwfim=im2bw(fim,0.1);
[bwfim0,level0]=fcmthresh(fim,0);
[bwfim1,level1]=fcmthresh(fim,1);
subplot(2,2,1);
imshow(fim);title('Original');
subplot(2,2,2);
imshow(bwfim);title(sprintf('Otsu,level=%f',level));
subplot(2,2,3);
imshow(bwfim0);title(sprintf('FCM0,level=%f',level0));
subplot(2,2,4);
imshow(bwfim1);title(sprintf('FCM1,level=%f',level1));
imwrite(bwfim1,'ftumor30.jpeg')
imm=bwfim0-bwfim1;
yy=bwareaopen(imm,200);
%J=imread('30s.jpeg');
%k=bwfim1;
k=yy;
y2=bwmorph(k,'dilate',1);
b=J;
%b=rgb2gray(b);
b = im2double(b);              
thresh_level = graythresh(b);  
c = b > thresh_level;          
imshow(c)
figure;imshow(y2);

y4=bwmorph(b,'erode',15);
figure;imshow(y4);

d = im2double(k).*b;           
imshow(d,[])
figure, imshow(d,[])
imwrite(d,'1t.jpeg');
