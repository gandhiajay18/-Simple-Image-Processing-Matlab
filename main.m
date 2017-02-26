function main()
clc();
%mkdir('output');
%ts = datetime('now');
%dt1 = datestr(ts);
%disp(dt1);
%dt2 = strrep(dt1 , '/' , '-');
%dt3 = strrep(dt2 , '\' , '-');
%dt = strrep(dt3 , '.' , ':');
%disp (dt);
input = 'C:\Users\Ajay-Pc\Desktop\568\Projects\Lab3\img01.jpg';
img = imread(input);
h = ones(3, 3) * (1/9);
opImg = myImageFilter(img, h);
%disp(opImg);
%opConvolve = strcat('output\op-convolve-',dt,'.jpeg');
%imwrite(opImg, opConvolve);

sigma = 2;
[Im,Io,Ix,Iy] = myEdgeFilter(img, sigma);
%opEdgeIm = strcat('output\op-edge-Im',dt,'.jpeg');
%imwrite(Im, opEdgeIm);
%opEdgeIo = strcat('output\op-edge-Io',dt,'.jpeg');
%imwrite(Io, opEdgeIo);
%opEdgeIx = strcat('output\op-edge-Ix',dt,'.jpeg');
%imwrite(Ix, opEdgeIx);
%opEdgeIy = strcat('output\op-edge-Iy',dt,'.jpeg');
%imwrite(Iy, opEdgeIy);

 threshold = 243;
 R = myHarrisCorner(Ix, Iy, threshold);
imgyo = im2double(img);
rgb=cat(3,imgyo,imgyo,imgyo);
 [r,c]=size(R);
 for i=1:r
    for j=1:c
        if(R(i,j)>threshold)
            rgb(i,j,:)=[1,0,0];   
        end
    end
 end
%display(R);
imshow(rgb);

% opCorner = strcat('output\op-corner-',dt,'.jpeg');
%imwrite(R, opCorner);