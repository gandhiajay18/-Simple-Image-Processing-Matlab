function [R] = myHarrisCorner(Ix,Iy,threshold)
   
  k = 0.04;
kernel = [-1,0,1;-1,0,1;-1,0,1];
   Ix = myImageFilter(Ix,kernel);
   Iy = myImageFilter(Iy,kernel);
 
  ixx = Ix.^2;
  iyy = Iy.^2;
  ixy = Ix.*Iy;
  h = fspecial('gaussian',3,0.5);
    ix2 = myImageFilter(ixx,h);
    iy2 = myImageFilter(iyy,h);
    ixy2 = myImageFilter(ixy,h);
%M = [ixx,ixy;ixy,iyy];
        %dm = det(M);
        %tm = trace(M);
        %tm = tm*tm;
        R = ((ix2.*iy2 - ixy2.*ixy2) - 0.04*(ix2 +iy2).^2);
[r,c]=size(R);
for i=1:r
    for j=1:c
        if(R(i,j)<threshold)
            R(i,j)=0;
        end
    end
end

end