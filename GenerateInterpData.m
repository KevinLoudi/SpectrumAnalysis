%Author:Zhu Gengyu 2016.2.23
%Format:figure(1);GenerateInterpData(100);
%Generate Grid*Grid interp data
function GenerateInterpData(Grid,year)
 load ('Data.mat');
 if (year == 2014)
    load('Position(2014).mat');
 else
    load('Position(2015).mat');
 end
 Range = [30.5 103.9;30.8 104.2];

 S = [Lat,Lon];
 Y = shown;  %Load from data.mat
 
 %poly0 regression function and the gauss  %correlation function
%  theta = [10 10]; lob = [1e-1 1e-1]; 
%  upb = [20 20];%udp
 theta = [8 8]; lob = [1e-1 1e-1]; 
 upb = [18 18];%udp

 %we can extract information about the generated model.
% [dmodel, perf] = ... 
% dacefit(S, Y, @regpoly0, @corrgauss, theta, lob, upb);
[dmodel, perf] = ... 
dacefit(S, Y, @regpoly0, @corrgauss, theta, lob, upb);


 X = gridsamp([30.5 103.9;30.8 104.2], Grid);
 [YX MSE] = predictor(X, dmodel);

 X1 = reshape(X(:,1),Grid,Grid); X2 = reshape(X(:,2),Grid,Grid);
 YX = reshape(YX, size(X1));
 %vector YX of predicted values at the mesh and MSE the  %mean squared
 %error for each predicted point.
 mesh(X1, X2, YX);
 hold on,
 %plot3(S(:,1),S(:,2),Y,'k.', 'MarkerSize',10);
 hold off,
 
 save('InterpData.mat','X1','X2','YX');
end