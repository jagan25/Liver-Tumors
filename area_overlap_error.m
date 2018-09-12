clear all;
I1=imread('1l.jpeg');%segmented with seed point selection
I2=imread('1s.jpeg');%segmented without seed point selection
I3=imread('1p.jpeg');%mask of ground truth segmented liver 
%converting images to binary images%
bw1=im2bw(I1);%segmented liver with segmented liver
bw2=im2bw(I2);%segmented liver without seed point selection
bw3=im2bw(I3);
area1=nnz(bw1&bw3);%counts no of pixels comprising both bw1 and bw3(intersection)
area2=nnz(bw1|bw3);%counts no of pixels comprising both bw1 or bw3(union)
area3=nnz(bw2&bw3);%counts no of pixels comprising both bw2 and bw3(intersection)
area4=nnz(bw2|bw3);%%counts no of pixels comprising both bw2 or bw3(union)
ao1=(1-(area1/area2))*100 %with seed point
ao2=(1-(area3/area4))*100 %fixed seed