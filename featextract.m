a=2;
I=imread('15t.jpeg');
I1=graycomatrix(I);
Iout=GLCM_Features1(I1);
I=im2bw(I);
file='features.xls';
n=4;
Str=num2str(n);
Str1='b';
Str2=sprintf('B%d',n);
xlswrite(file,Iout.autoc,1,Str2);
Str2=sprintf('C%d',n);
xlswrite(file,Iout.contr,1,Str2);
Str2=sprintf('D%d',n);
xlswrite(file,Iout.corrp,1,Str2);
Str2=sprintf('E%d',n);
xlswrite(file,Iout.dissi,1,Str2);
Str2=sprintf('F%d',n);
xlswrite(file,Iout.energ,1,Str2);
Str2=sprintf('G%d',n);
xlswrite(file,Iout.entro,1,Str2);
Str2=sprintf('H%d',n);
xlswrite(file,Iout.homop,1,Str2);
Str2=sprintf('I%d',n);
xlswrite(file,Iout.cprom,1,Str2);
Str2=sprintf('J%d',n);
xlswrite(file,Iout.cshad,1,Str2);
Str2=sprintf('K%d',n);
xlswrite(file,Iout.savgh,1,Str2);
Str2=sprintf('L%d',n);
xlswrite(file,Iout.sosvh,1,Str2);
Str2=sprintf('M%d',n);
features=regionprops(I,'Area');
[area,i]=max([features.Area]);
xlswrite(file,area,1,Str2);
features=regionprops(I,'Centroid');
centroid=features(i);
Str2=sprintf('N%d',n);
xlswrite(file,struct2cell(centroid),1,Str2);
features=regionprops(I,'Eccentricity');
eccentricity=features(i);
Str2=sprintf('O%d',n);
xlswrite(file,struct2cell(eccentricity),1,Str2);
features=regionprops(I,'Orientation');
orientation=features(i);
Str2=sprintf('P%d',n);
xlswrite(file,struct2cell(orientation),1,Str2);
features=regionprops(I,'ConvexHull');
convexhull=features(i);
Str2=sprintf('Q%d',n);
xlswrite(file,struct2cell(convexhull),1,Str2);
features=regionprops(I,'ConvexArea');
convexarea=features(i);
Str2=sprintf('R%d',n);
xlswrite(file,struct2cell(convexarea),1,Str2);
features=regionprops(I,'FilledArea');
filledarea=features(i);
Str2=sprintf('S%d',n);
xlswrite(file,struct2cell(filledarea),1,Str2);
features=regionprops(I,'EulerNumber');
eulernumber=features(i);
Str2=sprintf('T%d',n);
xlswrite(file,struct2cell(eulernumber),1,Str2);
features=regionprops(I,'EquivDiameter');
equivdiameter=features(i);
Str2=sprintf('U%d',n);
xlswrite(file,struct2cell(equivdiameter),1,Str2);
features=regionprops(I,'Solidity');
solidity=features(i);
Str2=sprintf('V%d',n);
xlswrite(file,struct2cell(solidity),1,Str2);
features=regionprops(I,'MajorAxisLength');
majoraxislength=features(i);
Str2=sprintf('W%d',n);
xlswrite(file,struct2cell(majoraxislength),1,Str2);
features=regionprops(I,'MinorAxisLength');
minoraxislength=features(i);
Str2=sprintf('X%d',n);
xlswrite(file,struct2cell(minoraxislength),1,Str2);
features=regionprops(I,'Perimeter');
perimeter=features(i);
Str2=sprintf('Y%d',n);
xlswrite(file,struct2cell(perimeter),1,Str2);