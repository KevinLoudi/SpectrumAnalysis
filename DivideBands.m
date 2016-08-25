%Divide into different bands
%Author:Zhugengyu  2016.1.20
%Format:[FS_band,Occ_band] = DivideBands(FieldStrength,occ_2015);
function [FS_band,Occ_band] = DivideBands(FS,occ)
    %FM
    [FS_part_fm,Occ_part_fm] = ReturnPartialFS(FS,occ,88,108);%FM
    %TV
    [FS_part_1,occ_part_1] = ReturnPartialFS(FS,occ,470,566);
    [FS_part_2,occ_part_2] = ReturnPartialFS(FS,occ,606,798);
    FS_part_tv = [FS_part_1,FS_part_2];
    Occ_part_tv =[occ_part_1;occ_part_2];
     %GSM 
     [FS_part_1,occ_part_1] = ReturnPartialFS(FS,occ,885,930);%GSM900 up
     [FS_part_2,occ_part_2] = ReturnPartialFS(FS,occ,930,960);%GSM900 down
     [FS_part_3,occ_part_3] = ReturnPartialFS(FS,occ,1710,1740);%GSM1800 up
     [FS_part_4,occ_part_4] = ReturnPartialFS(FS,occ,1805,1835);%GSM1800 down
     [FS_part_5,occ_part_5] = ReturnPartialFS(FS,occ,825,830);%CDMA up
     [FS_part_6,occ_part_6] = ReturnPartialFS(FS,occ,870,880);%CDMA down
     FS_part_2g = [FS_part_1,FS_part_2,FS_part_3,FS_part_4,FS_part_5,FS_part_6];
     Occ_part_2g =[occ_part_1;occ_part_2;occ_part_3;occ_part_4;occ_part_5;occ_part_6];
     %3G downlink
     [FS_part_1,occ_part_1] = ReturnPartialFS(FS,occ,1940,1960);%WCDMA up
     [FS_part_2,occ_part_2] = ReturnPartialFS(FS,occ,2130,2150);%WCDMA down
     [FS_part_3,occ_part_3] = ReturnPartialFS(FS,occ,2010,2025);%TD-SCAMA
     [FS_part_4,occ_part_4] = ReturnPartialFS(FS,occ,1920,1935);%CDMA2000 up
     [FS_part_5,occ_part_5] = ReturnPartialFS(FS,occ,2110,2125);%CDMA200 down
     FS_part_3g = [FS_part_1,FS_part_2,FS_part_3,FS_part_4,FS_part_5];
     Occ_part_3g = [occ_part_1;occ_part_2;occ_part_3;occ_part_4;occ_part_5];
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
     Occ_part_4g = [occ_part_1;occ_part_2;occ_part_3;occ_part_4;occ_part_5;occ_part_6;occ_part_7;occ_part_8;occ_part_9;occ_part_10;occ_part_11];
     %DECT
     [FS_part_dect,Occ_part_dect] = ReturnPartialFS(FS,occ,1905,1920);
     %Wi-Fi
     [FS_part_wifi,Occ_part_wifi] = ReturnPartialFS(FS,occ,2400,2483.5);
     FS_band = {FS_part_fm,FS_part_tv,FS_part_2g,FS_part_3g,FS_part_4g,FS_part_dect,FS_part_wifi};
     Occ_band = {Occ_part_fm,Occ_part_tv,Occ_part_2g,Occ_part_3g,Occ_part_4g,Occ_part_dect,Occ_part_wifi};
 end