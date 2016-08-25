
%Format:figure(1);NewGenerateData(930,960,1,2015);
function GenerateData()
 StartFreq = 1805;
 StopFreq = 1835;
 year = 2015;
 areaID = 1; %urban-commerical urban-residential suburban
 CategoryIndex =1;
 StartItem = (StartFreq-20)/0.025+1;
 StopItem = (StopFreq-20)/0.025+1;
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



 %Initialize load genes,position and display it.
 %load('DG-A2103_gene.mat');%20-3600监测天线因子表 2015年用
 load('DG-A2103_gene.mat');
 gene = gene(StartItem:StopItem);
 Path = sprintf('Position(%s).mat',num2str(year));
 load(Path);
  %Define categories 
     %H = 1:100;
     %H = [1 2 3 4 11 12 13 14 15 16 17 18 19 20 44 45 46 47 48 49 50]; %urban-commerical
     %H = [5 6 7 8 9 10 21 22 23 24 25 26 27 28 29 34 35 38 39 40 42 41 43 56 57 61 62 63 64 65 66 68 69 73 74 75 77 78 79 80 99 69 100]; %urban-residental
     %H = [72 76 71 75 30 31 32 33 36 37 51 52 53 54 55 58 59 60 67 70 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99]; %subruban
     %H = [20 21 22 35 40 39 26 42];
     %H = [29 30 31 37 36 18 1 25];
     %H = [43 44 45 46 50 51 55 57];
     %H = [20 21 22 23 19];
     %H = [25 41 40 37 32];
     %H = [43 44 45 46 47];
     
     %2015
     H = [19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 39];%urban commerical
     %H = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 18 40 41 35 36 37];
     %H = [16 17 38 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60];
     
      ID = ID(H(1:end));
      Lon = Lon(H(1:end));
      Lat = Lat(H(1:end));
 
 ID;Lat;Lon;
 %m = 10*ones(size(ID));
 item = 1:length(ID);%Calculate all site
 
 
 shown = zeros(1,length(ID));
 shown_p90 = zeros(1,length(ID));
 count = 0;
 
 %Find corresponding file and read out corresponding part of data 
 for i = item(1:end)
   if(year == 2014)
     j = ID(i)-2000;
   else
     j = ID(i)-1000;
   end
   %得到电平和占用度
   [LevelData,OccData] = FindFolderandRead(Folder_level,Folder_occ,j,StartItem,StopItem,len);
   %得到场强
   FS_dB = ConvertLevelToFS(LevelData,gene);
   %依次 最大电平，（平均电平），占用度，95%最大电平
   Clip = Analysis(FS_dB,OccData);
   
   %Unpack anlysis result of each sites
   FS_dB_max(i) = Clip(1);FS_dB_mean(i) = Clip(2);
   Occ_factor(i) = Clip(3);FS_dB_95(i) = Clip(4);
   
   %Convert to Field strength
   FS_Vm_max(i) = ConvertdBtoVm(FS_dB_max(i));
   FS_Vm_mean(i) = ConvertdBtoVm(FS_dB_mean(i));
   FS_Vm_95(i) = ConvertdBtoVm(FS_dB_95(i));
   if(Occ_factor(i) < 5)
   count = count + 1; end
   %Resave analysis result
   StatData{i} = Clip;
 end
   [Min_list,Min_index_list] = sort(FS_Vm_max);
   aa_Min_item_list = ID(Min_index_list);
   aa_List = aa_Min_item_list';
   shown = FS_Vm_max;
   shown_p90 = FS_Vm_95;
   shown_occ = Occ_factor;
   %shown_media = median(shown);
   %Maximal value
   aa_Range(1)=min(FS_Vm_max)*1000;
   aa_Range(2)=max(FS_Vm_max)*1000;
   aa_Range(3)=median(FS_Vm_max)*1000;
   aa_Range(4)=std(FS_Vm_max)*1000;
   
   aa_Range(5)=0;
   %95% maximal value
   aa_Range(6)=min(FS_Vm_95)*1000;
   aa_Range(7)=max(FS_Vm_95)*1000;
   aa_Range(8)=median(FS_Vm_95)*1000;
   aa_Range(9)=std(FS_Vm_95)*1000;
   
   aa_Range(10)=0;
   %Occ ranges
   aa_Range(11)=min(Occ_factor);
   aa_Range(12)=max(Occ_factor);
   aa_Range(13)=median(Occ_factor);
   aa_Range(14)=std(Occ_factor);
   
   b_Range(1)=Range(3);
   b_Range(2)=Range(8);
   b_Range(3)=Range(13)
   
   ratio = (length(ID)-count)./length(ID),
   save('StatData.mat','StatData');
   save('Data.mat','shown','shown_p90','shown_occ');
   save('Look.mat','aa_Range','aa_List','Min_list');

 %Analysis max
%  max_exposure = sum(shown)/length(item);
%  max_exposure_p90 = sum(shown_p90)/length(item);
%  aver_presence = sum(shown_occ)/length(item);
%  %Analysis sort
%  [temp,IX] = sort(shown,'descend');
%  %Plot
%  shown = shown_p90;
%  max_value = temp(1);
%  factor = zeros(1,100);
%  factor = shown/max_value;
%  scatter(Lon,Lat,600*factor,'filled');
%  xlabel('Latitude');
%  ylabel('Longitude');
%  grid on;
end