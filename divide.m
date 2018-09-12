I=imread('1.jpeg');
%I=Iout;
%K=I;
K=imguidedfilter(I);
%I=y1;
I=rgb2gray(I);
J=I;
I=imresize(I,[200 200]);
cell1=mat2cell(I, [50 50 50 50], [50 50 50 50]);
clear ener;
for r = 1 : 4
	for c = 1 : 4
        I=cell1{r,c};
        glcmin=graycomatrix(I);
        out= GLCM_Features1(glcmin,0);
        ener(r,c)=out.energ;
    end
end
clear rac3;
maxener=min(ener(:));
avener=mean(ener(:));
for r = 1 : 4
	for c = 1 : 4
        ener1=ener(r,c);
        ca1=cell1(r,c);
        %seed=1;
        if((gt(ener1,avener))&&(lt(ener1,maxener))||eq(ener1,maxener))
            rac3(r,c)=ca1;
       
        end
    end
end
clear enerac1;
for r=1:4
    for c=1:4
        enerac1(r,c)=0;
    end
end
maxener=max(ener(:));
avener=mean(ener(:));
for r = 1 : 4
	for c = 1 : 4
        ener1=ener(r,c);
        ca1=cell1(r,c);
        if((gt(ener1,avener))&&(lt(ener1,maxener))||eq(ener1,maxener))
            enerac1(r,c)=ener1;
       
        end
    end
end
for r=1:4
    for c=1:4
        if(enerac1(r,c)==0)
            enerac1(r,c)=10;
        end
    end
end
            
seed11=min(enerac1(:));
for r=1:4
    for c=1:4
        if(enerac1(r,c)==seed11)
            seed12=cell1{r,c};
            r1=(c-1)*50+25;
            c1=(r-1)*50+25;
            
        end
    end
end
%J=rgb2gray(J);
[h,w]=size(J);
h1=h/200;
w1=w/200;
r1=r1*h1;
c1=c1*w1;
r1=round(r1)
c1=round(c1)

%level set%

b=K;

Img=K;
%Img=imread('31.jpeg');
Img=double(Img(:,:,1));
timestep=1;  
mu=0.2/timestep;  
iter_inner=30;
iter_outer=70;
lambda=5; 
alfa=-3;  
epsilon=1.5; 
sigma=.8;    
G=fspecial('gaussian',15,sigma); 
Img_smooth=conv2(Img,G,'same');  
[Ix,Iy]=gradient(Img_smooth);
f=Ix.^2+Iy.^2;
g=1./(1+f);  


c0=2;
initialLSF = c0*ones(size(Img));
initialLSF(r1-6:r1+6,c1-6:c1+6)=-c0;
phi=initialLSF;

figure(1);
mesh(-phi);   
hold on;  contour(phi, [0,0], 'r','LineWidth',2);
title('Initial level set function');
view([-80 35]);

figure(2);
imagesc(Img,[0, 255]); axis off; axis equal; colormap(gray); hold on;  contour(phi, [0,0], 'r');
title('Initial zero level contour');
pause(0.5);

potential=2;  
if potential ==1
    potentialFunction = 'single-well';   
elseif potential == 2
    potentialFunction = 'double-well';  
else
    potentialFunction = 'double-well';  
end  


for n=1:iter_outer
    phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);    
    if mod(n,2)==0
        figure(2);
        imagesc(Img,[0, 255]); axis off; axis equal; colormap(gray); hold on;  contour(phi, [0,0], 'r');
    end
end

alfa=0;
iter_refine = 10;
phi = drlse_edge(phi, g, lambda, mu, alfa, epsilon, timestep, iter_inner, potentialFunction);

finalLSF=phi;
figure(2);
imagesc(Img,[0, 255]); axis off; axis equal; colormap(gray); hold on;  contour(phi, [0,0], 'r');
hold on;  contour(phi, [0,0], 'r');
str=['Final zero level contour, ', num2str(iter_outer*iter_inner+iter_refine), ' iterations'];
title(str);

figure;
mesh(-finalLSF); 
hold on;  contour(phi, [0,0], 'r','LineWidth',2);
view([-80 35]);
str=['Final level set function, ', num2str(iter_outer*iter_inner+iter_refine), ' iterations'];
title(str);
axis on;
[nrow, ncol]=size(Img);
axis([1 ncol 1 nrow -5 5]);
set(gca,'ZTick',[-3:1:3]);
set(gca,'FontSize',14)
y2=bwmorph(phi,'dilate',1);
%b=rgb2gray(K);
b=J;
b = im2double(b);              
thresh_level = graythresh(b);  
c = b > thresh_level;          
imshow(c)
figure;imshow(y2);

y4=bwmorph(phi,'erode',15);
figure;imshow(y4);

d = im2double(phi).*b;           
imshow(d,[])
figure, imshow(d,[])
f=b-d;
t=f-b;
imshow(t);
imwrite(t,'1l.jpeg');