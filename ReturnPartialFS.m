%Author:Zhugengyu 2015.12.31
%[FS_part,Occ_part] = ReturnPartialFS(FS,occ,88,108);
function [FS_part,Occ_part] = ReturnPartialFS(FeildStrength,occ,StartFreq,StopFreq)
    Step = 0.025; % 25kHz==0.025MHz
    if(StartFreq == 20)
       StartItem = 1;
    else
       StartItem = (StartFreq-20)/Step;
    end
    if(StopFreq == 3000)
       StopItem = 119201;
    else
       StopItem = (StopFreq-20)/Step;%Ƶ�ʶ�Ӧ�������е�ƫ����
    end
    FS_part = FeildStrength(StartItem:StopItem);%ȡ����Ӧֵ
    Occ_part = occ(StartItem:StopItem);
end