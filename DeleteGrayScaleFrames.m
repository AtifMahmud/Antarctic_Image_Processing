%% Delete the grayscale frames after masking

for num= 1359:1699 %the frames we are interested in 
   file=strcat('Black_Whiteframe_number', num2str(num),'.png');
   delete (file);
end