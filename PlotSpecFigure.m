%Plot comparison of Spec
%Author: Zhu Gengyu 2016.6.7

function PlotSpecFigure()
 StartFreq = 20;
 StopFreq = 3000;
 StartItem = (StartFreq-20)/0.025+1;
 StopItem = (StopFreq-20)/0.025+1;
 figure(1),
 x_index = 20:0.025:3000;
 Folder = {'NWM','NWM','YXLJ','YXLJ'};
 Pic = tight_subplot(4,1,[.06 .08],[.14 .06],[.10 .04]);
 for i = 1:4; 
     axes(Pic(i));
     Path = sprintf('C:\\MATLAB7\\work\\Data\\%s\\Data.mat',Folder{i});
     load(Path);
     if((i == 1)||(i == 3))
      plot(x_index,FieldStrengthdB_2014(StartItem:StopItem),'LineWidth',0.2,'Color',[.0 0 0]);
     else
      plot(x_index,FieldStrengthdB_2015(StartItem:StopItem),'LineWidth',0.2,'Color',[.0 0 0]);   
     end
     %grid on;
     set(gca, 'fontsize',12);
     axis([20 3000 0 130]);
     %ADD ylabel remain not solved
     if (i == 1)||(i == 2)
       set(Pic(i),'XTick',[]);  
     end
     box off;
     if (i == 1)
       text(150,120,'FM');
       text(800,100,'CDMA');
       text(1200,120,'GSM900');
       text(1600,120,'TD-SCDMA');
       text(2300,100,'WCDMA');
       text(2200,120,'CDMA2000');
       text(2600,120,'TD-LTE');  
       xlabel('(a)');
     end
     if(i == 2)
       text(400,100,'TV');
       text(1800,120,'GSM1800');
       text(2350,100,'FDD-LTE');
       xlabel('(b)');
       ylabel('Electric  Value(dB \mu V m^{-1})');
     end
     if(i == 3)
       text(2000,120,'DECT');
       text(2600,100,'WiFi 2G');  
       xlabel('(c)');
     end
     if(i == 4)
       xlabel('Frequencies(MHz)');  
     end
 end
 set(Pic(3),'XTickLabel',{'500','1000','1500','2000','2500','3000'});
 %text_y = text('Electric Value(mV/m)')
 %linkaxes(Pic(1:4),'xy');
 set(gca, 'fontsize',12);
end