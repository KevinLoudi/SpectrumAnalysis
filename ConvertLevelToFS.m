%Format:[FieldStrengthdB,FieldStrengthVm] = ConvertLevelToFS(level,gene)
%Convert to Vm 
%Author:Zhugengyu 2016.1.28
function [FieldStrengthdB] = ConvertLevelToFS(level,gene)
  FieldStrengthdB = zeros(1,size(level));
  len = length(level);
 for i=1:len
    FieldStrengthdB(i) = double(level(i)/10)+gene(i)+1.1;%dBuV/m
 end
end
 