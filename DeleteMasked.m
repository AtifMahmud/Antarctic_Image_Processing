%% Delete the masked black and white frames after filtering

for num= 1359:1699 %the frames we are interested in 
   file=strcat(num2str(num),'.png');
   delete (file);
end