  %Author:Zhugengyu 2016.1.4
  %[FS_average,FS_max,FS_min,FB_factor] =DividedAnalysis(FieldStrength,occ,Index);
  %Index=1 FM 88-108MHz;Index=3 TV;Index=3
  %GSM&&CDMA;Index=4,3G;Index=5,4G;Index=6 DECT;Index=7 Wi-Fi
  %Scale:[930 960 1710 1740 1805 1835 825 830;1940 1960 2130 2150 2010 2025 1920 1935 2110 2125;
  %     1880 1900 2575 2635 2635 2655 1745 1765 1840 1860 1765 1780 1860
  %     1875;1905 1920;2400 2483.5]
function [FS_average,FS_max,FS_min,FB_factor] = DividedAnalysis(FS,Occ,Index)
  switch Index
      case 1 %FM
          [FS_part,Occ_part] = ReturnPartialFS(FS,Occ,88,108);
   
      case 2 %TV
          [FS_part_1,Occ_part_1] = ReturnPartialFS(FS,Occ,470,566);
          [FS_part_2,Occ_part_2] = ReturnPartialFS(FS,Occ,606,798);
          FS_part = [FS_part_1,FS_part_2];
          Occ_part =[Occ_part_1;Occ_part_2];
          
      case 3 %GSM downlink
          %[FS_part_1,Occ_part_1] = ReturnPartialFS(FS,Occ,885,930);%GSM900 up
          [FS_part_1,Occ_part_1] = ReturnPartialFS(FS,Occ,930,960);%GSM900 down
          %[FS_part_3,Occ_part_3] = ReturnPartialFS(FS,Occ,1710,1740);%GSM1800 up
          [FS_part_2,Occ_part_2] = ReturnPartialFS(FS,Occ,1805,1835);%GSM1800 down
          %[FS_part_5,Occ_part_5] = ReturnPartialFS(FS,Occ,825,830);%CDMA up
          [FS_part_3,Occ_part_3] = ReturnPartialFS(FS,Occ,870,880);%CDMA down
          FS_part = [FS_part_1,FS_part_2,FS_part_3];
          Occ_part =[Occ_part_1;Occ_part_2;Occ_part_3];
       
      case 4 %3G downlink
          %[FS_part_1,Occ_part_1] = ReturnPartialFS(FS,Occ,1940,1960);%WCDMA up
          [FS_part_1,Occ_part_1] = ReturnPartialFS(FS,Occ,2130,2150);%WCDMA down
          [FS_part_2,Occ_part_2] = ReturnPartialFS(FS,Occ,2010,2025);%TD-SCAMA
          %[FS_part_3,Occ_part_3] = ReturnPartialFS(FS,Occ,1920,1935);%CDMA2000 up
          [FS_part_3,Occ_part_3] = ReturnPartialFS(FS,Occ,2110,2125);%CDMA200 down
           FS_part = [FS_part_1,FS_part_2,FS_part_3];
           Occ_part = [Occ_part_1;Occ_part_2;Occ_part_3];
           
      case 5 %4G
          [FS_part_1,Occ_part_1] = ReturnPartialFS(FS,Occ,1880,1900);%TD-LTE yidong 1800
          [FS_part_2,Occ_part_2] = ReturnPartialFS(FS,Occ,2320,2370);%TD-LTE yidong 2300
          [FS_part_3,Occ_part_3] = ReturnPartialFS(FS,Occ,2575,2635);%TD-LTE yidong 2600
          [FS_part_4,Occ_part_4] = ReturnPartialFS(FS,Occ,2300,2320);%TD-LTE liantong 2300
          [FS_part_5,Occ_part_5] = ReturnPartialFS(FS,Occ,2555,2575);%TD-LTE liantong 2600
          [FS_part_6,Occ_part_6] = ReturnPartialFS(FS,Occ,2370,2390);%TD-LTE dianxin 2300
          [FS_part_7,Occ_part_7] = ReturnPartialFS(FS,Occ,2635,2655);%TD-LTE dianxin 2600
          %[FS_part_4,Occ_part_4] = ReturnPartialFS(FS,Occ,1745,1765);%FDD-LTE liantong 1800 up
          [FS_part_8,Occ_part_8] = ReturnPartialFS(FS,Occ,1840,1860);%FDD-LTE liantong 1800 down
          %[FS_part_6,Occ_part_6] = ReturnPartialFS(FS,Occ,1765,1780);%FDD-LTE dianxin 1800 up
          [FS_part_9,Occ_part_9] = ReturnPartialFS(FS,Occ,1860,1875);%FDD-LTE dianxin 1800 down
          %FS_part = [FS_part_1,FS_part_2,FS_part_3,FS_part_4,FS_part_5,FS_part_6,FS_part_7];
          %Occ_part = [Occ_part_1;Occ_part_2;Occ_part_3;Occ_part_4;Occ_part_5;Occ_part_6;Occ_part_7];
          FS_part = [FS_part_1,FS_part_2,FS_part_3,FS_part_4,FS_part_5,FS_part_6,FS_part_7,FS_part_8,FS_part_9];
          Occ_part = [Occ_part_1;Occ_part_2;Occ_part_3;Occ_part_4;Occ_part_5;Occ_part_6;Occ_part_7;Occ_part_8;Occ_part_9];
          
      case 6 %DECT
          [FS_part,Occ_part] = ReturnPartialFS(FS,Occ,1905,1920);
      
      case 7 %Wi-Fi
          [FS_part,Occ_part] = ReturnPartialFS(FS,Occ,2400,2483.5);
          
      case 8 %Downlink,mobild phone in used 
          [FS_part_1,Occ_part_1] = ReturnPartialFS(FS,Occ,930,960);%GSM900 down
          [FS_part_2,Occ_part_2] = ReturnPartialFS(FS,Occ,1805,1835);%GSM1800 down
          [FS_part_3,Occ_part_3] = ReturnPartialFS(FS,Occ,870,880);%CDMA down
          [FS_part_4,Occ_part_4] = ReturnPartialFS(FS,Occ,2130,2150);%WCDMA down
          [FS_part_5,Occ_part_5] = ReturnPartialFS(FS,Occ,2010,2025);%TD-SCAMA
          [FS_part_6,Occ_part_6] = ReturnPartialFS(FS,Occ,2110,2125);%CDMA200 down
          [FS_part_7,Occ_part_7] = ReturnPartialFS(FS,Occ,1880,1900);%TD-LTE yidong 1800
          [FS_part_8,Occ_part_8] = ReturnPartialFS(FS,Occ,2675,2635);%TD-LTE yidong 2600
          [FS_part_9,Occ_part_9] = ReturnPartialFS(FS,Occ,2635,2655);%TD-LTE dianxin 2600
          [FS_part_10,Occ_part_10] = ReturnPartialFS(FS,Occ,1840,1860);%FDD-LTE liantong 1800 down
          [FS_part_11,Occ_part_11] = ReturnPartialFS(FS,Occ,1860,1875);%FDD-LTE dianxin 1800 down
          FS_part = [FS_part_1,FS_part_2,FS_part_3,FS_part_4,FS_part_5,FS_part_6,FS_part_7];
          Occ_part = [Occ_part_1;Occ_part_2;Occ_part_3;Occ_part_4;Occ_part_5;Occ_part_6;Occ_part_7];
          
      otherwise
          disp('error index');
      
      end
  num = length(FS_part);
  FS_average = sum(FS_part)/num;
  FS_part_sort = sort(FS_part,'descend');
  num_min = floor(num/100);%前1%最大值
  FS_max = sum(FS_part_sort(1:num_min))/num_min;%max value
  FS_part_sort = sort(FS_part);
  num_min = floor(num/100);%前1%最小值
  FS_min = sum(FS_part_sort(1:num_min))/num_min;%min value
  FB_factor = sum(Occ_part)/num;
end
