%Box Plot
%Author: Zhu Gengyu 2016.6.7

function PlotBoxFigure()
 figure(1);
 StartFreq = 930;
 StopFreq = 960;
 Length = (StopFreq-StartFreq)/0.025;
 Folder = {'QYG','CDZ','GHC','DZKD','XHGY','SN','YXLJ','NWM','WHLJ','INDOOR'};% 9+1 sites
 Pic = tight_subplot(1,2,[.08 .05],[.1 .02],[.09 .01]);
 axes(Pic(2));
 num = 8;
 %ID = [5,4,8,6,3,1,2,7];
 for j = 1:num
    %i = ID(j); 
    i = j;
    Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{i});
    load(Path);
    %循环输入组计算结果，场强数据和信号存在程度
%     FS_2014 = FieldStrengthdB_2014;
%     FS_2015 = FieldStrengthdB_2015;
    
    FS_2014 = FieldStrengthdB_2014*1;
    FS_2015 = FieldStrengthdB_2015*1;
    
    [FS_part_2014,Occ_part_2014] = ReturnPartialFS(FS_2014,occ_2014,StartFreq,StopFreq);
    [FS_part_2015,Occ_part_2015] = ReturnPartialFS(FS_2015,occ_2015,StartFreq,StopFreq);
    %得到截取的部分数组
    Figure_2014(j,1:(Length+1)) = FS_part_2014(1:end)';
    Figure_2015(j,1:(Length+1)) = FS_part_2015(1:end)';
    Figure_occ_2014(j,1:(Length+1)) = Occ_part_2014(1:end)';
    Figure_occ_2015(j,1:(Length+1)) = Occ_part_2015(1:end)';
 end
     for i = 1:num
     %绘制指定频段场强的分布图，均值，标准差和离散方向
       boxplot(Figure_2015',1,'k*',1,0);
       hold on;
     end
 set(gca,'xticklabel',{'site5','site4','site8','site1','site6','site3','site2','site7'});
 xlabel('(b)');
 ylabel('');
 axis([0.5 8.5 0 120]);
 set(gca, 'fontsize',10);

 axes(Pic(1));
 StartFreq = 88;
 StopFreq = 108;
 Length = (StopFreq-StartFreq)/0.025;
 ID = [5,4,8,6,3,1,2,7];
 for j = 1:num
    i = ID(j); 
    i = j;
    Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{i});
    load(Path);
    %循环输入组计算结果，场强数据和信号存在程度
    
    
    FS_2014 = FieldStrengthdB_2014*1;
    FS_2015 = FieldStrengthdB_2015*1;
    
    [FS_part_2014,Occ_part_2014] = ReturnPartialFS(FS_2014,occ_2014,StartFreq,StopFreq);
    [FS_part_2015,Occ_part_2015] = ReturnPartialFS(FS_2015,occ_2015,StartFreq,StopFreq);
    %得到截取的部分数组
    Figure_2014(j,1:(Length+1)) = FS_part_2014(1:end)';
    Figure_2015(j,1:(Length+1)) = FS_part_2015(1:end)';
    Figure_occ_2014(j,1:(Length+1)) = Occ_part_2014(1:end)';
    Figure_occ_2015(j,1:(Length+1)) = Occ_part_2015(1:end)';
 end
     for i = 1:num
     %绘制指定频段场强的分布图，均值，标准差和离散方向
       boxplot(Figure_2015',1,'k*',1,0);
       hold on;
     end
 
 set(gca,'xticklabel',{'site1','site2','site3','site4','site5','site6','site7','site8'});
 xlabel('(a)')
 ylabel('Electric Field Vaule(dB \mu V m^{-1})');
 axis([0.5 8.5 0 120]);
 set(gca, 'fontsize',12);




end