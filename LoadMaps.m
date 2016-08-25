%Format: figure(1) LoadMaps(7);
function LoadMaps(Nums)
  Folder = 'C:\\MATLAB7\\new_work\\ReadFiles\\ShpMap\\%s.%s';
  for index = 1:Nums
    Path = sprintf(Folder,num2str(index),'shp');
    S = shaperead(Path);
    mapshow(S,'Color', 'black');
  hold on;
end