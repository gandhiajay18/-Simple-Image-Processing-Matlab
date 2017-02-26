function [Im Io Ix Iy] = myEdgeFilter(img, sigma)
gaussKernel = fspecial('gaussian', [3 3], sigma);
%if(size(img,3)==3)
%img= rgb2gray(img);
%end;

smoothImg = myImageFilter(img, gaussKernel);

ySobelKernel = fspecial('sobel');
xSobelKernel = ySobelKernel';

Ix = myImageFilter(smoothImg, xSobelKernel);
Iy = myImageFilter(smoothImg, ySobelKernel);
Ix = im2double(Ix);
Iy = im2double(Iy);
[row, col] = size(smoothImg);
Im = zeros([row col]);
Io = zeros([row col]);

for i=1:row
    for j=1:col
        Im(i,j) = sqrt( (Ix(i,j)^2) + (Iy(i,j)^2) );
        if(Iy(i,j) == 0)
            Io(i,j) = 0;
        else
            Io(i,j) = atand( abs(Iy(i,j)) / abs(Ix(i,j)) );
        end
    end
end

for i=1:row
    for j=1:col
if((Io(i,j) >= 0 && Io(i,j) <= 15) || (Io(i,j) >= 165 && Io(i,j) <= 180))
            if(i==1)
                if(Im(i,j)>Im(i+1,j))
                    Im(i,j) = 0;
                end
            else if (i == size(Im,1))
                    if (Im(i,j)>Im(i-1,j))
                        Im(i,j) = 0;
                    end
                else
                    if((Im(i,j)>Im(i+1,j))&&(Im(i,j)>Im(i-1,j)))
                        Im(i,j) = 0;
                    end
                end
            end
        else
            if((Io(i,j) >= 75) && (Io(i,j)<=105))
               if(j==1)
                    if(Im(i,j)>Im(i,j+1))
                        Im(i,j) = 0;
                    end
                else if (j == size(Im,2))
                        if (Im(i,j)>Im(i,j-1))
                            Im(i,j) = 0;
                        end
                    else
                        if((Im(i,j)>Im(i,j+1))&&(Im(i,j)>Im(i,j-1)))
                            Im(i,j) = 0;
                        end
                    end
               end
            else if((Io(i,j) >= 30) && (Io(i,j) <= 60))
               if(j==1) 
                   if(i == size(Im,1))
                        continue;
                    else if(Im(i,j)>Im(i+1,j+1))
                           Im(i,j) = 0;
                        end
                    end
                else if (j == size(Im,2))
                        if(i == 1)
                            continue;
                        else if(Im(i,j)>Im(i-1,j-1))
                                 Im(i,j) = 0;
                            end
                        end
                    else
                         if(i == 1)
                             if(Im(i,j) > Im(i+1,j+1))
                                 Im(i,j) = 0;
                             end
                         else if(i == size(Im,1))
                                if(Im(i,j) > Im(i-1,j-1))
                                    Im(i,j) = 0;
                                end 
                              else
                                if((Im(i,j)>Im(i+1,j+1))&&(Im(i,j)>Im(i-1,j-1)))
                                    Im(i,j) = 0;
                                end
                             end
                         end
                    end
               end
              else if((Io(i,j) <= 150) && (Io(i,j) >= 120))
               if(j==1) 
                   if(i == 1)
                        continue;
                    else if(Im(i,j)>Im(i-1,j+1))
                           Im(i,j) = 0;
                        end
                    end
                else if (j == size(Im,2))
                        if(i == size(Im,1))
                            continue;
                        else if(Im(i,j)>Im(i+1,j-1))
                                 Im(i,j) = 0;
                            end
                        end
                    else
                         if(i == 1)
                             if(Im(i,j) > Im(i+1,j-1))
                                 Im(i,j) = 0;
                             end
                         else if(i == size(Im,1))
                                if(Im(i,j) > Im(i-1,j+1))
                                    Im(i,j) = 0;
                                end 
                              else
                                if((Im(i,j)>Im(i-1,j+1))&&(Im(i,j)>Im(i+1,j-1)))
                                    Im(i,j) = 0;
                                end
                             end
                         end
                    end
               end
                end
             
                    end
                end
    end
    end
end
end
 %imshow(Ix);
 %figure();
 %imshow(Iy);
% pause;
