%Obtian statical summary of all sites for each band
%GSM--inquire all sites--obtian data and
%saved--maxmial,maxmial(95%),median, signal presence rate range,power
%intensity 

function StatisticalSummaries
%Spatial statistical summaries
%     GenerateData(930,960,1,2014);
%     %Item = 100;
%     %Item = 60;
%     Item = 8;
%     load('StatData.mat');
%     
%     %Maxmial value range
%     Value = Unpack(StatData,1,Item);
%     Range_dB(1) = double(min(Value));
%     Range_dB(2) = double(max(Value));
%     Range(1) = ConvertdBtoVm(Range_dB(1))*1000;
%     Range(2) = ConvertdBtoVm(Range_dB(2))*1000;
%     Max_dB = mean(Value);
%     Max_Vm = ConvertdBtoVm(Max_dB)*1000;
%     
%        
%     %Mean Value range
%     Value = Unpack(StatData,2,Item);
%     Range_dB(3) = double(min(Value));
%     Range_dB(4) = double(max(Value));
%     Range(3)= ConvertdBtoVm(Range_dB(3))*1000;
%     Range(4) = ConvertdBtoVm(Range_dB(4))*1000;
%     Mean_dB = mean(Value);
%     Mean_Vm = ConvertdBtoVm(Mean_dB)*100    
% 
%     %Mean Value range
%     Value = Unpack(StatData,5,Item);
%     Range_dB(5) = double(min(Value));
%     Range_dB(6)= double(max(Value));
%     Range(5) = ConvertdBtoVm(Range_dB(5))*1000;
%     Range(6) = ConvertdBtoVm(Range_dB(6))*1000;
%       
%     %OCC range
%     Value = Unpack(StatData,3,Item);
%     Range(7) = double(min(Value));
%     Range(8) = double(max(Value));
 
%Temporal comparison    
StartFreq = 2110;
StopFreq = 2125;
StartItem = (StartFreq-20)/0.025+1;
StopItem = (StopFreq-20)/0.025+1;
Folder = {'QYG','CDZ','GHC','DZKD','XHGY','SN','YXLJ','NWM','WHLJ','INDOOR'};% 9+1 sites
All_Entropy = [0;0;0];
for i =1:8
Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{i});
load(Path);
x1 = FieldStrengthVm_2014(StartItem:StopItem);
x2 = FieldStrengthVm_2015(StartItem:StopItem);
  if(i==1)
    figure(1);
    plot(x1,'LineWidth',0.5,'Color',[.6 0 0]);
    hold on;
    plot(x2,'LineWidth',0.5,'Color',[.2 0 0]);
  end

  x1 = 1000000000*x1;
  x1 = floor(x1);
  x2 = 1000000000*x2;
  x2 = floor(x2);%保留3位小数取整，后面稀疏矩阵的计算需要
  
  [Corr,p] = corrcoef(x1,x2);
  [Intev,j] = find(p<0.05);
  
  
%   Entropy_x1 = entropy(x1)
%   Entropy_x2 = entropy(x2)
%   Joint_Entropy = jointEntropy(x1,x2)
%   ConditionalEntropy = conditionalEntropy (x1,x2)
%   RelativeEntropy = relativeEntropy (x1,x2)
%   MutualInformation = mutualInformation(x1,x2)
%   Clip = [Entropy_x1;Entropy_x2;ConditionalEntropy]
%   All_Entropy = [All_Entropy,Clip];
 end
end

%**********************
function [ValueArray] = Unpack(StatData,index,ItemNum)
   for i = 1:ItemNum
       Clip =  StatData{i};
       ValueArray(i) = double(Clip(index));
   end
end

%*********************************************

 function z = entropy(x)
% Compute entropy H(x) of a discrete variable x.
% Written by Mo Chen (mochen80@gmail.com).
    n = numel(x);
    x = reshape(x,1,n);
    [u,m,label] = unique(x);
    p = full(mean(sparse(1:n,label,1,n,numel(u),n),1));
    z = -dot(p,log2(p+eps));
 end
 
 %*********************************************
 
 function z = conditionalEntropy (x, y)
% Compute conditional entropy H(x|y) of two discrete variables x and y.
% Written by Mo Chen (mochen80@gmail.com).
    %assert(numel(x) == numel(y));
    n = numel(x);
    x = reshape(x,1,n);
    y = reshape(y,1,n);
    
    l = min(min(x),min(y));
    x = x-l+1;
    y = y-l+1;
    k = max(max(x),max(y));

    idx = 1:n;
    Mx = sparse(idx,x,1,n,k,n);
    My = sparse(idx,y,1,n,k,n);
    Pxy = nonzeros(Mx'*My/n); %joint distribution of x and y
    Hxy = -dot(Pxy,log2(Pxy+eps));

    Py = mean(My,1);
    Hy = -dot(Py,log2(Py+eps));

    % conditional entropy H(x|y)
    z = Hxy-Hy;
 end
 %****************************************
 
 function z = relativeEntropy (x, y)
% Compute relative entropy (a.k.a KL divergence) KL(p(x)||p(y)) of two discrete variables x and y.
% Written by Mo Chen (mochen80@gmail.com).    
    %assert(numel(x) == numel(y));
    n = numel(x);
    x = reshape(x,1,n);
    y = reshape(y,1,n);
    
    l = min(min(x),min(y));
    x = x-l+1;
    y = y-l+1;
    k = max(max(x),max(y));

    idx = 1:n;
    Mx = sparse(idx,x,1,n,k,n);
    My = sparse(idx,y,1,n,k,n);
    Px = mean(Mx,1);
    Py = mean(My,1);

    z = -dot(Px,log2(Py+eps)-log2(Px+eps));
end
%***************************************

function z = mutualInformation(x, y)
% Compute mutual information I(x,y) of two discrete variables x and y.
% Written by Mo Chen (mochen80@gmail.com).

    %assert(numel(x) == numel(y));
    n = numel(x);
    x = reshape(x,1,n);
    y = reshape(y,1,n);
    
    l = min(min(x),min(y));
    x = x-l+1;
    y = y-l+1;
    k = max(max(x),max(y));

    idx = 1:n;
    Mx = sparse(idx,x,1,n,k,n);
    My = sparse(idx,y,1,n,k,n);
    Pxy = nonzeros(Mx'*My/n); %joint distribution of x and y
    Hxy = -dot(Pxy,log2(Pxy+eps));

    Px = mean(Mx,1);
    Py = mean(My,1);

    % entropy of Py and Px
    Hx = -dot(Px,log2(Px+eps));
    Hy = -dot(Py,log2(Py+eps));

    % mutual information
    z = Hx + Hy - Hxy;
end