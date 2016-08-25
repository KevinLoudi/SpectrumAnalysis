%Run and Save

function main()
year = 2015;
%map preparation and data interpation
warning off;
figure(1);LoadMaps(3);hold on; %show 4 shps map
%figure(2);
GenerateData(88,108,1,year); %save the corresponding data in data.mat
load('Data.mat');
max_value = max(shown);
axis([103.93 104.17 30.53 30.77]);
%print('figure(1)', '-djpeg', '-r800'); %<-Save as JPEG with 500 DPI
figure(2);GenerateInterpData(100,year); %interpation in 100*100 grids

%Gobal correct of interpation data
%mapping interpation data
figure(1);
MappingData(year,max_value);

axis([103.94 104.18 30.57 30.75]);
set(gcf,'Position',[0,0,512,512],'PaperType','usletter');
axis normal;
title('mV m^{-1}');
xlabel('LONG.');ylabel('LAT.');
figure(1), 
uicontrol()
%plot(104.105,30.66,'*', 'MarkerSize',8);
%Plot sites ID on Map
%  if (year == 2014)
%     load('Position(2014).mat');
%     itemnum = 100;
%  else
%     load('Position(2015).mat');
%     itemnum = 60;
%  end
%  Group_0 = 1:itemnum;
%  %2014 with three groups GSM900
%  %Commerical
%  Group_1 = [20 21 22 35 40 39 26 42];
%  %Urban residental
%  Group_2 = [29 30 31 37 36 18 1 25];
%  %Rural residential
%  Group_3 = [43 44 45 46 50 51 55 57];
%  %2014 with three part FM
%  Part_1 = [20 21 22 23 19];
%  Part_2 = [25 41 40 37 32];
%  Part_3 = [43 44 45 46 47];
%  %2015
% %ID = Group_0; 
% ID = Part_1;
% itemnum = length(ID);
% tiny = 0.001;
% for i = 1:itemnum
%    j = ID(i); 
%    plot(Lon(j),Lat(j),'.k', 'MarkerSize',10);
%    text(Lon(j)+tiny,Lat(j)+tiny,num2str(j));
% end
% xlabel('LONG.');
% ylabel('LAT.');
% set(gca, 'fontsize',12); 
% axis([103.9 104.2 30.5 30.8]);
% %save mapping result
% %print('figure(1)', '-djpeg', '-r800'); %<-Save as JPEG with 500 DPI
end


