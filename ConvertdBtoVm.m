%Format:[FS_Vm] = CovertdBtoVm(FS_dB)
%Convert to Vm 
%Author:Zhugengyu 2016.1.28

function [FS_Vm] = CovertdBtoVm(FS_dB)
  len = length(FS_dB);
  if (len == 1)
    FS_Vm = 10^(((FS_dB)-120)/20);%V/m  1*1
  else
    FS_Vm = zeros(1,size(FS_dB)); 
    for i = 1:len
      FS_Vm(i) = 10^(((FS_dB(i))-120)/20)*10^0;%V/m 1*N
    end
  end
end