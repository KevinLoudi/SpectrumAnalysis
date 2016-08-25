%Plot figure in one
%Author:Zhugengyu  2016.1.28
 %Reliable function: ConvertLevelToFS.m  Analysis.m FindFolderandRead.m
 %Format of Analysis result: FS_dB_max,FS_dB_mean,Occ_factor,Occ_max,FS_dB_max_95

 function FigurePlotInOne()
 StartFreq = 20;
 StopFreq = 3000;
 index = 13;%2014 index
 index_n = 29;% 2015 index
 StartItem = (StartFreq-20)/0.025+1;
 StopItem = (StopFreq-20)/0.025+1;
 Clip = [1.23456,1.23456,1.23456,1.23456,1.23456];
 
%  %Initialize load genes,position and display it.
%  load('DG-A2103_gene.mat');%20-3600监测天线因子表 2015年用
%  gene = gene(StartItem:StopItem);
%  [FS_band,Occ_band,Clip] = ObtainOneData(StartItem,StopItem,2014,gene,index);%2014
%  %[FS_band_n,Occ_band_n,Clip_n] = ObtainOneData(StartItem,StopItem,2015,gene,index_n);%2015
% 
%  FS_dB_max = Clip(1);FS_dB_mean = Clip(2);
%  Occ_factor = Clip(3);Occ_mean = Clip(4);FS_dB_max_95 = Clip(5);
%  FS_Vm_max = ConvertdBtoVm(FS_dB_max);
%  FS_Vm_max_95 = ConvertdBtoVm(FS_dB_max_95);
%  FS_Vm_band = ConvertdBtoVm(FS_band);
 %Sites Used 
 %Urban residential 'DZKD' 'XHGY' 'SN'
 %Rural residential 'YXLJ' 'NWM' 'WHLJ'
 %Urban commerical 'QYG' 'CDZ' 'GHC'
 %Indoor
 Folder = {'QYG','CDZ','GHC','DZKD','XHGY','SN','YXLJ','NWM','WHLJ','INDOOR'};% 9+1 sites
 mark = {'','o','*','.','x','+','>','<','#'};
 %2014 2003 2070 2034 2025 2044 2033 2051 2011 2054
 %2015 1039
 %[5,4,8,6,3,1,2,7]
% ha = tight_subplot(Nh, Nw, gap, marg_h, marg_w)
%
%   in:  Nh      number of axes in hight (vertical direction)
%        Nw      number of axes in width (horizontaldirection)
%        gap     gaps between the axes in normalized units (0...1)
%                   or [gap_h gap_w] for different gaps in height and width 
%        marg_h  margins in height in normalized units (0...1)
%                   or [lower upper] for different lower and upper margins 
%        marg_w  margins in width in normalized units (0...1)
%                   or [left right] for different left and right margins 
%
%  out:  ha     array of handles of the axes objects
%                   starting from upper left corner, going row-wise as in
%                   going row-wise as in
 %Plot Field Strength
%  figure(1),
%  x_index = 20:0.025:3000;
%  Folder = {'NWM','DZKD','YXLJ'};
%  Pic = tight_subplot(3,1,[.04 .06],[.1 .02],[.08 .04])
%  for i = 1:3; 
%      axes(Pic(i));
%      Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{i});
%      load(Path);
%      plot(x_index,FieldStrengthVm_2014(StartItem:StopItem)*1000,'LineWidth',0.2,'Color',[.0 0 0]);
%      %grid on;
%      set(gca, 'fontsize',12);
%      axis([20 3000 0 60]);
%      %ADD ylabel remain not solved
%      if (i == 1)||(i == 2)
%        set(Pic(i),'XTick',[]);  
%      end
%      box off;
%      if (i == 1)
%        text(150,50,'FM');
%        text(800,40,'CDMA');
%        text(1200,30,'GSM900');
%        text(1600,40,'TD-SCDMA');
%        text(2300,40,'WCDMA');
%        text(2200,30,'CDMA2000');
%        text(2600,20,'TD-LTE');  
%      end
%      if(i == 2)
%        text(400,30,'TV');
%        text(1800,40,'GSM1800');
%        text(2350,40,'FDD-LTE');
%      end
%      if(i == 3)
%        text(2000,20,'DECT');
%        text(2600,20,'WiFi 2G');  
%      end
%  end
%  set(Pic(3),'XTickLabel',{'500','1000','1500','2000','2500','3000'});
%  %text_y = text('Electric Value(mV/m)')
%  %linkaxes(Pic(1:4),'xy');
%  xlabel('Frequencies(MHz)');
%  ylabel('Electric  Value(mV m^{-1})');
%  set(gca, 'fontsize',12);
 
%  hf1=figure(2);
%  Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{1});
%  load(Path);
%  plot(x_index,FieldStrengthVm_2014(StartItem:StopItem)*1000,'LineWidth',0.2,'Color',[.8 0 0]);
%  grid on;
%  %88-108
%  axes('parent',hf1,'position',[0.20 0.65 0.25 0.25]);
%  Start = (88-20)/0.025+1;
%  Stop = (108-20)/0.025+1;
%  plot(x_index(Start:Stop),FieldStrengthVm_2014(Start:Stop)*1000);
%  hold on;
%  %930-960
%  axes('parent',hf1,'position',[0.20 0.65 0.5 0.5]);
%  Start = (930-20)/0.025+1;
%  Stop = (960-20)/0.025+1;
%  plot(x_index(Start:Stop),FieldStrengthVm_2014(Start:Stop)*1000);


%  hf1=figure(1);
%  Folder = {'QYG','CDZ','GHC','DZKD','XHGY','SN','YXLJ','NWM','WHLJ','INDOOR'};% 9+1 sites
%  %2130-2150
%  Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{2});
%  load(Path);
%  axes('parent',hf1,'position',[0.20 0.65 0.5 0.5]);
%  Start = (2130-20)/0.025+1;
%  Stop = (2150-20)/0.025+1;
%  x_index = 20:0.025:3000;
%  plot(x_index(Start:Stop),FieldStrengthVm_2014(Start:Stop)*1000);

 
% Map involved sites
figure(1);LoadMaps(3);hold on; %show 4 shps map
Path = sprintf('Position(2014).mat');
H = [1 2 3 4 11 12 13 14 15 16 17 18 19 20 44 45 46 47 48 49 50]; %urban-commerical
     %H = [5 6 7 8 9 10 21 22 23 24 25 26 27 28 29 34 35 38 39 40 42 41 43 56 57 61 62 63 64 65 66 68 69 73 74 75 77 78 79 80 99 69 100]; %urban-residental
     %H = [72 76 71 75 30 31 32 33 36 37 51 52 53 54 55 58 59 60 67 70 81
     %82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99]; %subruban
tiny = 0.001;
load(Path);
for i = H(1:end)
   plot(Lon(ID(i)-2000),Lat(ID(i)-2000),'Marker','*','MarkerEdgeColor',[0,0,0],'MarkerSize',8);
   %text(Lon(ID(i)-2000)+tiny,Lat(ID(i)-1000)+tiny,num2str(i));
   hold on;
end


H = [5 6 7 8 9 10 21 22 23 24 25 26 27 28 29 34 35 38 39 40 42 41 43 56 57 61 62 63 64 65 66 68 69 73 74 75 77 78 79 80 99 69]; %urban-residental
for i = H(1:end)
   plot(Lon(ID(i)-2000),Lat(ID(i)-2000),'Marker','+','MarkerEdgeColor',[0,0,0],'MarkerSize',8);
   %text(Lon(ID(i)-2000)+tiny,Lat(ID(i)-1000)+tiny,num2str(i));
   hold on;
end

H = [72 76 71 75 30 31 32 33 36 37 51 52 53 54 55 58 59 60 67 70 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99]; %subruban
for i = H(1:end)
   plot(Lon(ID(i)-2000),Lat(ID(i)-2000),'Marker','o','MarkerEdgeColor',[0,0,0],'MarkerSize',8);
   %text(Lon(ID(i)-2000)+tiny,Lat(ID(i)-1000)+tiny,num2str(i));
   hold on;
end

H = [2003 2070 2034 2025 2014 2033 2051 2044 2054];     %[2014 2003 2070 2034 2025 2044 2033 2051 2054];
   %[2003 2070 2034 2025 2014 2033 2051 2044 2054];
   % 5    1    2     3   4    8    6    7     9 换
k = 1;
for i = H(1:end)
   %plot(Lon(ID(i)-1000),Lat(ID(i)-1000),'Marker','o','MarkerEdgeColor',[0,0,0], 'MarkerSize',5);
   text(Lon(i-2000)+tiny,Lat(i-2000)+tiny,num2str(k));
   k = k + 1;
   hold on;
end

%set(gcf,'Position',[200 200 260 220]);
%set(gca,'Position',[.13 .17 .80 .74]);
%figure_FontSize = 12;

%imshow(figure1,'border','tight','initaImagnification','fit');



% Path = sprintf('Position(2015).mat');
% load(Path);
%  H = [19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 39];%urban commerical
%  %H = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 18 40 41 35 36 37];
%  %H = [16 17 38 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59
%      %60];
% for i = H(1:end)
%    plot(Lon(ID(i)-1000),Lat(ID(i)-1000),'Marker','*','MarkerEdgeColor',[0,0,0], 'MarkerSize',5);
%    %text(Lon(ID(i)-1000),Lat(ID(i)-1000),num2str(i));
%    hold on;
% end
% H = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 18 40 41 35 36 37];
% for i = H(1:end)
%    plot(Lon(ID(i)-1000),Lat(ID(i)-1000),'Marker','+','MarkerEdgeColor',[0,0,0], 'MarkerSize',5);
%    %text(Lon(ID(i)-1000),Lat(ID(i)-1000),num2str(i));
%    hold on;
% end
% H = [16 17 38 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60];
% for i = H(1:end)
%    plot(Lon(ID(i)-1000),Lat(ID(i)-1000),'Marker','o','MarkerEdgeColor',[0,0,0], 'MarkerSize',5);
%    %text(Lon(ID(i)-1000),Lat(ID(i)-1000),num2str(i));
%    hold on;
% end



xlabel('LONG.');
ylabel('LAT.');
set(gcf,'Position',[0,0,512,512]);
axis normal;
text(104.09,30.765,'*:Commerical');
hold on;
text(104.09,30.755,'+:Residential-urban');
hold on;
text(104.09,30.745,'o:Residential-rural');
hold on;
%figure_FontSize = 8;
set(gca, 'fontsize',12); 
axis([103.93 104.17 30.53 30.77]);
i=0;
 
%  %Plot Signal Presence Rate,have to read from 20MHz to 3000MHz
%  figure(2),
%  Folder = {'QYG'};
%  Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\StatData.mat',Folder{1});
%  load(Path);
%  bar(FB_factor_2015,0.5);
%  axis([0 10 0 100]);
%  xlabel('Frequency Bands');   
%  ylabel('Occurrpied Rate of Bands (%)');
%  set(gca,'xticklabel',{'FM','TV','2G','3G','4G','DECT','WiFi','Mobile'});
%  set(gca, 'fontsize',12);
%  print -dtiff -r500 im.tiff
%  im = imread( 'im.tiff', 'tiff' );
%  [im_hatch,colorlist] = applyhatch_pluscolor(im,'\-x.');

%  figure(3),
%  Folder = {'QYG','CDZ','GHC','DZKD','XHGY','SN','YXLJ','NWM','WHLJ','INDOOR'};% 9+1 sites
%  FigItem = zeros(4,8);
%  List = [1,2,4,7,9,10];
%  for i = 1:6
%    Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{List(i)});
%    load(Path);
%    [PowerDensity_2014,Contributions_2014] = PowerDensityandContris(FieldStrengthVm_2014,occ_2014,1.00074);
%    FigItem(i,1:end) = Contributions_2014;
%  end
%  bar(FigItem,0.5,'stack');
%  colormap(gray);
%  xlabel('Locations');
%  ylabel('Contributions to power density(%)');
%  set(gca,'xticklabel',{'site1','site2','site4','site7','site9','indoor'});
%  set(gca,'yticklabel',{0:10:100})
%  legend('FM','TV','2G','3G','4G','DECT','Wi-Fi','others');
%  axis([0 9 0 1+eps]);
%  set(gca, 'fontsize',12);
%  [im_hatch,colorlist] = applyhatch_pluscolor(gcf,'\-x.',1,[],[],150);
%  xlabel('Locations');
%  ylabel('Contributions to power density(%)');
%  set(gca,'xticklabel',{'site1','site2','site4','site7','site9','indoor'});
%  legend('FM','TV','2G','3G','4G','DECT','Wi-Fi','others');
%  print -dtiff -r1200 im.tiff   
%  im = imread( 'im.tiff', 'tiff' );
%  [im_hatch,colorlist] = applyhatch_pluscolor(im,'\-b.');
%  print('figure(2)', '-dtiff', '-r1200'); %<-Save as JPEG with 500 DPI
 
%Plot Power density contribution of several sites,have to read whole
%  figure(3),
%  Folder = {'QYG','CDZ','GHC','DZKD','XHGY','SN','YXLJ','NWM','WHLJ','INDOOR'};% 9+1 sites
%  FigItem = zeros(4,8);
%  List = [1,2,4,7,9,10];
%  for i = 1:6
%    Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{List(i)});
%    load(Path);
%    [PowerDensity_2014,Contributions_2014] = PowerDensityandContris(FieldStrengthVm_2014,occ_2014,1.00074);
%    FigItem(i,1:end) = Contributions_2014;
%  end
%  bar(FigItem,'stacked');
%  colormap(gray);
%  xlabel('Locations');
%  ylabel('Contributions to power density(%)');
%  set(gca,'xticklabel',{'site1','site2','site4','site7','site9','indoor'});
%  legend('FM','TV','2G','3G','4G','DECT','Wi-Fi','others');
%  axis([0 9 0 1+eps]);
%  [im_hatch,colorlist] = applyhatch_pluscolor(gcf,'\-x.',1,[],[],500);
%   xlabel('Locations');
%   ylabel('Contributions to power density(%)');
%   set(gca,'xticklabel',{'site1','site2','site4','site7','site9','indoor'});
%   legend('FM','TV','2G','3G','4G','DECT','Wi-Fi','others');
  %set(gcf,'PaperPosition',[0 0 10 15],'Color','b');
%   print('figure(3)', '-djpeg', '-r800'); %<-Save as JPEG with 500 DPI
  
  %Plot Cdf comparison
%   for i = [1,2,3,4,5,6,7,9]
%       Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{i});
%       load(Path);
%       FS_2015 = FieldStrengthdB_2014;
%       index = 1;
%       show = 0;
%       for(j=FS_2015(1:end))
%         if(j>20)
%             show(index) = j;
%         end
%         index = index+1;
%       end
%       len = length(show);
%       H = hist(show,100);
%       cdf = zeros(1,length(H));
%       for k = 1:length(H)
%          cdf(k) = sum(H(1:k));
%       end
%       %plot(cdf/len,'LineWidth',1.6,'Color',color{i})  
%       plot(cdf/len,'LineWidth',1.2,'Color','k');
%       hold on;
%   end
%  
%   xlabel('Electric Value (dBuV/m)');
%   ylabel('Probability (%)');
%   legend('site1','site2','site3','site4','site5','site6','site7','site8');
%   set(gca, 'fontsize',12);
%   axis([0 70 0 1])
%   
  %Box Plot `
%   figure(1);
%  StartFreq = 930;
%  StopFreq = 960;
%  Length = (StopFreq-StartFreq)/0.025;
%  Pic = tight_subplot(1,2,[.08 .05],[.1 .02],[.09 .01]);
%  axes(Pic(2));
%  num = 8;
%  %ID = [5,4,8,6,3,1,2,7];
%  for j = 1:num
%     %i = ID(j); 
%     i = j;
%     Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{i});
%     load(Path);
%     %循环输入组计算结果，场强数据和信号存在程度
% %     FS_2014 = FieldStrengthdB_2014;
% %     FS_2015 = FieldStrengthdB_2015;
%     
%     FS_2014 = FieldStrengthdB_2014*1;
%     FS_2015 = FieldStrengthdB_2015*1;
%     
%     [FS_part_2014,Occ_part_2014] = ReturnPartialFS(FS_2014,occ_2014,StartFreq,StopFreq);
%     [FS_part_2015,Occ_part_2015] = ReturnPartialFS(FS_2015,occ_2015,StartFreq,StopFreq);
%     %得到截取的部分数组
%     Figure_2014(j,1:(Length+1)) = FS_part_2014(1:end)';
%     Figure_2015(j,1:(Length+1)) = FS_part_2015(1:end)';
%     Figure_occ_2014(j,1:(Length+1)) = Occ_part_2014(1:end)';
%     Figure_occ_2015(j,1:(Length+1)) = Occ_part_2015(1:end)';
%  end
%      for i = 1:num
%      %绘制指定频段场强的分布图，均值，标准差和离散方向
%        boxplot(Figure_2015',1,'k*',1,0);
%        hold on;
%      end
%  set(gca,'xticklabel',{'site5','site4','site8','site1','site6','site3','site2','site7'});
%  xlabel('(b)');
%  ylabel('');
%  axis([0.5 8.5 0 120]);
%   set(gca, 'fontsize',12);
% 
%  axes(Pic(1));
%  StartFreq = 88;
%  StopFreq = 108;
%  Length = (StopFreq-StartFreq)/0.025;
%  ID = [5,4,8,6,3,1,2,7];
%  for j = 1:num
%     i = ID(j); 
%     i = j;
%     Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{i});
%     load(Path);
%     %循环输入组计算结果，场强数据和信号存在程度
% %     FS_2014 = FieldStrengthdB_2014;
% %     FS_2015 = FieldStrengthdB_2015;
%     
%     FS_2014 = FieldStrengthdB_2014*1;
%     FS_2015 = FieldStrengthdB_2015*1;
%     
%     [FS_part_2014,Occ_part_2014] = ReturnPartialFS(FS_2014,occ_2014,StartFreq,StopFreq);
%     [FS_part_2015,Occ_part_2015] = ReturnPartialFS(FS_2015,occ_2015,StartFreq,StopFreq);
%     %得到截取的部分数组
%     Figure_2014(j,1:(Length+1)) = FS_part_2014(1:end)';
%     Figure_2015(j,1:(Length+1)) = FS_part_2015(1:end)';
%     Figure_occ_2014(j,1:(Length+1)) = Occ_part_2014(1:end)';
%     Figure_occ_2015(j,1:(Length+1)) = Occ_part_2015(1:end)';
%  end
%      for i = 1:num
%      %绘制指定频段场强的分布图，均值，标准差和离散方向
%        boxplot(Figure_2015',1,'k*',1,0);
%        hold on;
%      end
%  
%  set(gca,'xticklabel',{'site1','site2','site3','site4','site5','site6','site7','site8'});
%  xlabel('(a)')
%  ylabel('Electric Field Vaule(dBuV^{-1})');
%  axis([0.5 8.5 0 120]);
%  set(gca, 'fontsize',12);

%Plot OCC
%     % ha = tight_subplot(Nh, Nw, gap, marg_h, marg_w)
%     Pic = figure(1),
%     num = 2;%number of location in comparison
%     bandnum = 8;%number of frequecny bands in comparison
%     ID = [1,4,6,8];
%     index = 1:bandnum*(num+1);
%     ha = tight_subplot(2,2,[.05 .01],[.1 .02],[.06 .01]);
%     xl = {'(a)','(b)','(c)','(d)'};
%     for i = 1:4; 
%         axes(ha(i)); 
%         j = ID(i);
%         Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\StatData.mat',Folder{j});
%         load(Path);
%         Figure_2014 = FB_factor_2014;
%         Figure_2015 = FB_factor_2015;
%         bar(index(1:3:(end-2)),Figure_2014,0.2,'grouped','w');
%         hold on;
%         bar(index(2:3:(end-1)),Figure_2015,0.2,'grouped','k');
%         axis([0 25 0 100]);
%         legend('2014','2015');
%         %ADD ylabel remain not solved
%         set(gca, 'fontsize',12);
%         xlabel(xl{i});
%     end
%     ylabel('Band-averaged occupy rate(%)');
%     %xlabel('Frequency bands');
%     set(ha(1:2),'XTickLabel',''); set(ha(2:2:4),'YTickLabel','')
%     %set(ha(5:6),'XTickLabel','1'); set(ha(1,3),'YTickLabel','')
%     set(ha(3:4),'XTickLabel',{'  FM','  TV','  2G','  3G','  4G','   DECT','    WiFi','     Mobile'});
%     %set(Pic,'Position',[.1 .1 .4 .4])
%     set(gca, 'fontsize',12);
 end
 
 
  %**********************************
 function [FS_band,Occ_band,Clip] = ObtainOneData(StartItem,StopItem,year,gene,index)
  if (year == 2015),
    len =143201;%2015
    %Read *.scan
    Folder_level = 'D:\\DataFactory\\2015\\%s\\2015-11-07\\2015110717.scan';
    Folder_occ = 'D:\\DataFactory\\2015\\%s\\2015-11-07\\2015110717.hocc';
  else
    len =119201;%2014
    Folder_level = 'D:\\DataFactory\\2014\\%s\\2014-08-10\\2014081022.scan';
    Folder_occ = 'D:\\DataFactory\\2014\\%s\\2014-08-10\\2014081022.hocc';
  end
  warning off;
  %Obtain data and proccess into FieldStrength and Averaged OCC
  [LevelData,OccData] = FindFolderandRead(Folder_level,Folder_occ,index,StartItem,StopItem,len);
  FS_band = ConvertLevelToFS(LevelData,gene);
  Occ_band = OccData;
  Clip = Analysis(FS_band,Occ_band);
 end
%*********************************************

 function z = entropy(x)
% Compute entropy H(x) of a discrete variable x.
% Written by Mo Chen (mochen80@gmail.com).
    n = numel(x);
    x = reshape(x,1,n);
    [u,m,label] = unique(x);
    p = full(mean(sparse(1:n,label,1,n,numel(u),n),1));
    z = -dot(p,log2(p+eps));
 end
 %*********************************************
 
 function z = conditionalEntropy (x, y)
% Compute conditional entropy H(x|y) of two discrete variables x and y.
% Written by Mo Chen (mochen80@gmail.com).
    %assert(numel(x) == numel(y));
    n = numel(x);
    x = reshape(x,1,n);
    y = reshape(y,1,n);
    
    l = min(min(x),min(y));
    x = x-l+1;
    y = y-l+1;
    k = max(max(x),max(y));

    idx = 1:n;
    Mx = sparse(idx,x,1,n,k,n);
    My = sparse(idx,y,1,n,k,n);
    Pxy = nonzeros(Mx'*My/n); %joint distribution of x and y
    Hxy = -dot(Pxy,log2(Pxy+eps));

    Py = mean(My,1);
    Hy = -dot(Py,log2(Py+eps));

    % conditional entropy H(x|y)
    z = Hxy-Hy;
 end
  
 %*******************************************
 function [PowerDensity,Contributions] = PowerDensityandContris(FieldStrength,occ,Kersi_r)
    Temp = 0.5*1.00074*8.85*10^(-12);
    FS = Temp*(FieldStrength.^2);
    PI_total = sum(FS);
    %FM
    [FS_part_fm,cc_part_fm] = ReturnPartialFS(FS,occ,88,108);%FM
    %TV
    [FS_part_tv,occ_part_fm] = ReturnPartialFS(FS,occ,470,798);%TV
     %GSM 
     [FS_part_1,occ_part_1] = ReturnPartialFS(FS,occ,885,930);%GSM900 up
     [FS_part_2,occ_part_2] = ReturnPartialFS(FS,occ,930,960);%GSM900 down
     [FS_part_3,occ_part_3] = ReturnPartialFS(FS,occ,1710,1740);%GSM1800 up
     [FS_part_4,occ_part_4] = ReturnPartialFS(FS,occ,1805,1835);%GSM1800 down
     [FS_part_5,occ_part_5] = ReturnPartialFS(FS,occ,825,830);%CDMA up
     [FS_part_6,occ_part_6] = ReturnPartialFS(FS,occ,870,880);%CDMA down
     FS_part_2g = [FS_part_1,FS_part_2,FS_part_3,FS_part_4,FS_part_5,FS_part_6];
     %3G downlink
     [FS_part_1,occ_part_1] = ReturnPartialFS(FS,occ,1940,1960);%WCDMA up
     [FS_part_2,occ_part_2] = ReturnPartialFS(FS,occ,2130,2150);%WCDMA down
     [FS_part_3,occ_part_3] = ReturnPartialFS(FS,occ,2010,2025);%TD-SCAMA
     [FS_part_4,occ_part_4] = ReturnPartialFS(FS,occ,1920,1935);%CDMA2000 up
     [FS_part_5,occ_part_5] = ReturnPartialFS(FS,occ,2110,2125);%CDMA200 down
     FS_part_3g = [FS_part_1,FS_part_2,FS_part_3,FS_part_4,FS_part_5];
     %4G
     [FS_part_1,occ_part_1] = ReturnPartialFS(FS,occ,1880,1900);%TD-LTE yidong 1800
     [FS_part_2,occ_part_2] = ReturnPartialFS(FS,occ,2320,2370);%TD-LTE yidong 2300
     [FS_part_3,occ_part_3] = ReturnPartialFS(FS,occ,2575,2635);%TD-LTE yidong 2600
     [FS_part_4,occ_part_4] = ReturnPartialFS(FS,occ,2300,2320);%TD-LTE liantong 2300
     [FS_part_5,occ_part_5] = ReturnPartialFS(FS,occ,2555,2575);%TD-LTE liantong 2600
     [FS_part_6,occ_part_6] = ReturnPartialFS(FS,occ,2370,2390);%TD-LTE dianxin 2300
     [FS_part_7,occ_part_7] = ReturnPartialFS(FS,occ,2635,2655);%TD-LTE dianxin 2600
     [FS_part_8,occ_part_8] = ReturnPartialFS(FS,occ,1745,1765);%FDD-LTE liantong 1800 up
     [FS_part_9,occ_part_9] = ReturnPartialFS(FS,occ,1840,1860);%FDD-LTE liantong 1800 down
     [FS_part_10,occ_part_10] = ReturnPartialFS(FS,occ,1765,1780);%FDD-LTE dianxin 1800 up
     [FS_part_11,occ_part_11] = ReturnPartialFS(FS,occ,1860,1875);%FDD-LTE dianxin 1800 down
     FS_part_4g = [FS_part_1,FS_part_2,FS_part_3,FS_part_4,FS_part_5,FS_part_6,FS_part_7,FS_part_8,FS_part_9,FS_part_10,FS_part_11];
     %DECT
     [FS_part_dect,occ_part_dect] = ReturnPartialFS(FS,occ,1905,1920);
     %Wi-Fi
     [FS_part_wifi,occ_part_wifi] = ReturnPartialFS(FS,occ,2400,2483.5);
     %Calculation contributions
     PI_fm = sum(FS_part_fm);
     PI_tv = sum(FS_part_tv);
     PI_2g = sum(FS_part_2g);
     PI_3g = sum(FS_part_3g);
     PI_4g = sum(FS_part_4g);
     PI_dect = sum(FS_part_dect);
     PI_wifi = sum(FS_part_wifi);
     PI_mobile = PI_2g + PI_3g +PI_4g;
     PI_others = PI_total - PI_fm - PI_tv - PI_mobile - PI_dect -PI_wifi;
     %Calculate contributions
     Contri_fm = PI_fm/PI_total;
     Contri_tv = PI_tv/PI_total;
     Contri_2g = PI_2g/PI_total;
     Contri_3g = PI_3g/PI_total;
     Contri_4g = PI_4g/PI_total;
     Contri_dect = PI_dect/PI_total;
     Contri_wifi = PI_wifi/PI_total;
     Contri_mobile = (PI_2g+PI_3g+PI_4g)/PI_total;
     Contri_others = PI_others/PI_total;
     PowerDensity = [PI_fm,PI_tv,PI_2g,PI_3g,PI_4g,PI_dect,PI_wifi,PI_others];
     Contributions =[Contri_fm,Contri_tv,Contri_2g,Contri_3g,Contri_4g,Contri_dect,Contri_wifi,Contri_others];
 end
%***********************************************
