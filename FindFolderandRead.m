%%Find corresponding file and read out corresponding part of data 


function [LevelData,OccData] = FindFolderandRead(Folder_level,Folder_occ,index,StartItem,StopItem,len)
    LevelData = zeros(len,1);
    OccData = zeros(len,1);
    if(len == 143201)
     SubFolder = num2str(1000 + index);
    elseif(len == 119201)
     SubFolder = num2str(2000 + index);  
    end
  
    Path = sprintf(Folder_level,SubFolder);
    jump_distance = 91;%scan文件头的长度
    fid = fopen(Path);
    fseek(fid,jump_distance,'bof');
    LevelData = fread(fid,len,'integer*2=>int16');%可以优化，读取某一段即可
    LevelData = LevelData(StartItem:StopItem);
  
    Path = sprintf(Folder_occ,SubFolder);
    if(len == 119201)
      jump_distance = 238486;%hocc文件头的长度+Level部分的长度
    elseif(len == 143201)
      jump_distance = 286486;%2015
    end  
    fid = fopen(Path);
    fseek(fid,jump_distance,'bof');
    OccData = fread(fid,len,'integer*2=>uint16');
    OccData = OccData(StartItem:StopItem);
end