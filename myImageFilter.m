function [img1] = myImageFilter(img0, h)
% [img1] = myImageFilter(img0, h)
%c = imfilter(img0,h);

img0 = im2double(img0);
h = im2double(h);

img1 = zeros(size(img0));

kernel = h;

[rowk, colk] = size(kernel);
windrowk = floor(rowk/2);
windcolk = floor(colk/2);

padded = padarray(img0, [windrowk windcolk],'replicate');
[rowp, colp] = size(padded);


for i=1+windrowk:rowp-windrowk
    for j=1+windcolk:colp-windcolk
        
        weightedSum = 0;
        
      
        for m=-windrowk:windrowk
            for n=-windcolk:windcolk
                weightedSum = weightedSum + (kernel(m+windrowk+1,n+windcolk+1) * padded(i+m,j+n));
            end
        end
        
        img1(i-windrowk,j-windcolk) = weightedSum;
                
    end
end

%output uint8
img1 = im2uint8(img1);
%imshow(img1);
%c = imfilter(img01,h);
%d = c - img1;
%display(d);
end