%Analysis of FS and Occ
%Author:Zhugengyu 2016.1.28
%Format:[Clip] = Analysis(FS_dB,FS_Vm,Occ)

function Clip = Analysis(FS_dB,Occ)
  Clip = [1.23456,1.23456,1.23456,1.23456,1.23456];
  ItemNum = length(FS_dB);
  FS_dB_mean = mean(FS_dB);

  %Obtain max and mean value of the set of data
  FS_dB_max = max(FS_dB);
  FS_dB_mean = mean(FS_dB);
    
  %Obtain max value with 95% confidence interval
  temp_dB = sort(FS_dB,'descend');
  mio_num = floor(ItemNum/20);%前5%最大值
  FS_dB_max_95 = mean(temp_dB(1:mio_num));
 
  %Obtain Occ data
  Occ_factor = double(mean(Occ));
  Occ_max = double(max(Occ)); 
  
  Clip = [FS_dB_max,FS_dB_mean,Occ_factor,FS_dB_max_95];
end
