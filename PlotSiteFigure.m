%New plot
%Author: Zhu Genyu 2016.6.6

function PlotSiteFigure()
 clf;
 StartFreq = 20;
 StopFreq = 3000;
 index = 13;%2014 index
 index_n = 29;% 2015 index
 StartItem = (StartFreq-20)/0.025+1;
 StopItem = (StopFreq-20)/0.025+1;
 Pic = tight_subplot(1,2,[.08 .02],[.12 .03],[.10 .03]);
 warning off;
 axes(Pic(1));
 LoadMaps(3);hold on; %show 4 shps map
 Path = sprintf('Position(2014).mat'); load(Path);
 H = [1 2 3 4 11 12 13 14 15 16 17 18 19 20 44 45 46 47 48 49 50]; %urban-commerical
 for i = H(1:end)
   plot(Lon(ID(i)-2000),Lat(ID(i)-2000),'Marker','*','MarkerEdgeColor',[0,0,0],'MarkerSize',5);
   hold on;
 end
 
 H = [72 30 31 32 33 5 6 7 8 9 10 21 22 23 24 25 26 27 28 29 34 35 38 39 40 42 41 43 68 69 73 74 77 79 80]; %urban-residental
 for i = H(1:end)
   plot(Lon(ID(i)-2000),Lat(ID(i)-2000),'Marker','+','MarkerEdgeColor',[0,0,0],'MarkerSize',5);
   hold on;
 end

 H = [56 57 66 78 61 62 63 64 65 36 37 51 52 53 54 55 58 59 60 67 70 71 76 75 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99]; %subruban
 for i = H(1:end)
   plot(Lon(ID(i)-2000),Lat(ID(i)-2000),'Marker','o','MarkerEdgeColor',[0,0,0],'MarkerSize',5);
   hold on;
 end

 H = [2003 2070 2034 2025 2014 2033 2051 2044 2054];     %[2014 2003 2070 2034 2025 2044 2033 2051 2054];
   %[2003 2070 2034 2025 2014 2033 2051 2044 2054];
   % 5    1    2     3   4    8    6    7     9 »»
 k = 1; tiny = 0.002;
 for i = H(1:end)
   if(i == 2014)
       text(Lon(i-2000)+tiny,Lat(i-2000)-tiny,num2str(k));
   else
       text(Lon(i-2000)+tiny,Lat(i-2000)+tiny,num2str(k));
   end
   k = k + 1;
   hold on;
 end
 xlabel('LONG. /n (a)');
 ylabel('LAT.');
 set(gcf,'Position',[0,0,512,512]);
 axis normal;
 %text(104.105,30.765,'*:Commerical');
 %hold on;
 %text(104.105,30.755,'+:Residential-urban');
 %hold on;
 %text(104.105,30.745,'o:Residential-rural');
 %hold on;
 set(gca, 'fontsize',12); 
 axis([103.93 104.17 30.53 30.77]);
 
 axes(Pic(2));loadMaps(3);hold on; %show 4 shps map
 Path = sprintf('Position(2015).mat'); load(Path); 
 H = [19 20 21 22 23 24 25 26 27 28 29 30 31 39 40 41];%urban commerical
 for i = H(1:end)
   plot(Lon(ID(i)-1000),Lat(ID(i)-1000),'Marker','*','MarkerEdgeColor',[0,0,0], 'MarkerSize',5);
   hold on;
 end
 H = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 18 35 36 37 32 33 34];
 for i = H(1:end)
   plot(Lon(ID(i)-1000),Lat(ID(i)-1000),'Marker','+','MarkerEdgeColor',[0,0,0], 'MarkerSize',5);
   hold on;
 end
 H = [16 17 38 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 15];
 for i = H(1:end)
   plot(Lon(ID(i)-1000),Lat(ID(i)-1000),'Marker','o','MarkerEdgeColor',[0,0,0], 'MarkerSize',5);
   hold on;
 end
 xlabel('LONG.');
 set(gcf,'Position',[0,0,512,512]);
 axis normal;
 text(104.105,30.765,'*:Commerical');
 hold on;
 text(104.105,30.755,'+:Residential-urban');
 hold on;
 text(104.105,30.745,'o:Residential-rural');
 hold on;
 set(gca, 'fontsize',12,'yticklabel',[]); 
 axis([103.93 104.17 30.53 30.77]);
 hold off;

 
end