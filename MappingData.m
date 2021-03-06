%Format:figure(1); MappingData(year)
%Author:Zhu Gengyu 2016.2.23
function MappingData(year,max_value)
 if (year == 2014)
    load('Position(2014).mat');
 else
    load('Position(2015).mat');
 end
 load('InterpData.mat');
 [W] = Gobal(10,5,YX);
 YX = W;
 %max_value = max(max(1000*YX));
 max_value = 150;
 %plot as image 
  for i = 1:size(X1)
     for j = 1:size(X1)
         if(YX(i,j)<0.005)
             YX(i,j)=0.005;
         end
     end
 end
 X = X1(1,1:end);
 Y = X2(1:end,1);
 imagesc(Y,X,1000*YX');
 %colormap(gray);
 caxis([0 max_value]);
 %colormap(flipud(colormap));
 hold on;
 %imagesc(peaks)
 alpha(0.5);  
 colorbar; 
 colormap(gray(15));
 colormap(flipud(colormap));
 max_value = 150;
 caxis([0,max_value]);
 axI = colorbar;
 set(axI,'ytick',[0:max_value/15:max_value]);
 set(axI,'ytick',[0:max_value/15:max_value],'yticklabel',[[0:max_value/15:max_value]]);
 cb = findobj(gcf,'Type','axes','Tag','Colorbar');
 cbIm = findobj(cb,'Type','image');
 alpha(cbIm,0.5);
 
 %plot as contour
 X = X1(1,1:end);
 Y = X2(1:end,1);
 [C,h] = contour(Y,X,1000*YX');
 shading interp;
 hold on;
 %v = [5,10,15,20,25,30];
 %clabel(C,h,v);
 clabel(C,h);
 clabel(C,h,'FontSize',8,'Color','black');

 
 %Mark sites
 hold on,
 plot(Lon,Lat,'ko', 'MarkerSize',4);
 %plot(104.105,30.66,'.k', 'MarkerSize',20);
 
 axis([min(Y),max(Y),min(X),max(X)]);
%  c = colorbar;
%  c.Label.String = 'Electric Value(mV/m)';
% set(gca, 'fontsize',12,'Position','right'); 
end

%***********************************
%Gobal filter
%MarkSize shall not be a odd (4,6,20,40 is acceptable)
%LocalWeight represent influence lead by the exact grid 
function [OutputData] = Gobal(MaskSize,LocalWeigth,InputData)
 m = MaskSize;
 YX = InputData;
 H = zeros(m,m);
 c = m/2;
 for i = 1:m
    for j = 1:m
        if (i==c&&j==c)
            H(i,j) = LocalWeigth;%Local weigth
        else
            distance = sqrt(((i-c)^2)+((j-c)^2));
            H(i,j) = 1/distance;
        end
    end
 end
 sumup = sum(sum(H));
 H = H/sumup;%Generate mask matrix
 W = filter2(H,YX);%2-D filter
 OutputData = W;
end