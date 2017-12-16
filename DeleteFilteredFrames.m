%% Delete the filtered images after plotting

for num= 1359:1699 %the frames we are interested in 
   file=strcat(num2str(num), 'filter', '.png');
   delete (file);
end