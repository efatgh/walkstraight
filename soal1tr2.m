
clc
clear all
close all
n=124;
frame0=imread('frame0.tif');
for i=1:9
frame0(:,:,:,i)=imread(['frame' num2str(i),'.tif']);
end
for i=10:99
frame0(:,:,:,i)=imread(['frame00' num2str(i),'.tif']);
end
for i=100:124
frame0(:,:,:,i)=imread(['frame0' num2str(i),'.tif']);
end
% im=frame0;
for j=1:n-2
diff1=abs(frame0(:,:,:,j+2)-frame0(:,:,:,j));
diff2=abs(frame0(:,:,:,j+2)-frame0(:,:,:,j+1));
motion2 = min(diff1,diff2);
image=frame0(:,:,:,j);
motion=rgb2gray(motion2);
tr=50;
t=motion>tr
motion=bwlabel(t,8);
motion=imdilate(motion,ones(3,3));
[d1,d2]=find(motion>0);
left=min(d2);
right=max(d2);
top=min(d1);bot=max(d1)
l=max(max(motion));
Top=top;%v1;
Bottom=bot;%v2;
Left=left;%abs(p2(1)-v1*240);
Right=right;%Left+10%abs(p2(end)-v2*240);
%image(Top:Bottom, Left,1) = 255;
image(Top:Bottom, Left,1) = 255;
image(Top:Bottom, Left,2) = 255;
image(Top:Bottom, Left,3) = 0;
image(Top:Bottom, Right,1) = 255;
image(Top:Bottom, Right,2) = 255;
image(Top:Bottom, Right,3) = 0;
image(Top, Left:Right,1) = 255;
image(Top, Left:Right,2) = 255;
image(Top, Left:Right,3) = 0;
image(Bottom, Left:Right,1) = 255;
image(Bottom, Left:Right,2) = 255;
image(Bottom, Left:Right,3) = 0;
m=immovie(image)
movie(m)
end

