
%Format:figure(1);GenerateData(930,960,1,2015);
function GenerateData(StartFreq,StopFreq,CategoryIndex,year)
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
 load('DG-A2103_gene.mat');%20-3600监测天线因子表 2015年用
 gene = gene(StartItem:StopItem);
 Path = sprintf('Position(%s).mat',num2str(year));
 load(Path);
  %Define categories 
     ID = ID;
     %H = [20 21 22 35 40 39 26 42];
     %H = [29 30 31 37 36 18 1 25];
     %H = [43 44 45 46 50 51 55 57];
     %H = [20 21 22 23 19];
     %H = [25 41 40 37 32];
     %H = [43 44 45 46 47];
%      ID = ID(H(1:end));
%      Lon = Lon(H(1:end));
%      Lat = Lat(H(1:end));
 
 ID;Lat;Lon;
 m = 10*ones(size(ID));
 item = 1:length(ID);%Calculate all site
 
 
 shown = zeros(1,length(ID));
 shown_p90 = zeros(1,length(ID));
 
 %Find corresponding file and read out corresponding part of data 
 for i = item(1:end)
   if(year == 2014)
     j = ID(i)-2000;
   else
     j = ID(i)-1000;
   end
   [LevelData,OccData] = FindFolderandRead(Folder_level,Folder_occ,j,StartItem,StopItem,len);
   %Calculate Field strength from level
   FS_dB = ConvertLevelToFS(LevelData,gene);
   Clip = Analysis(FS_dB,OccData);
   
   %Unpack anlysis result of each sites
   FS_dB_max(i) = Clip(1);FS_dB_mean(i) = Clip(2);
   Occ_factor(i) = Clip(3);FS_dB_95(i) = Clip(4);
  
   %Convert to Field strength
   FS_Vm_max(i) = ConvertdBtoVm(FS_dB_max(i));
   FS_Vm_mean(i) = ConvertdBtoVm(FS_dB_mean(i));
   FS_Vm_95(i) = ConvertdBtoVm(FS_dB_95(i));
   
   %Resave analysis result
   StatData{i} = Clip;
 end
   shown = FS_Vm_max;
   shown_p95 = FS_Vm_95;
   shown_occ = Occ_factor;
   save('StatData.mat','StatData');
   save('Data.mat','shown','shown_p95','shown_occ');

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