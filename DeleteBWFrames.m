%% Delete the black and white frames after conversion to black and white

for num= 1359:1699 %the frames we are interested in 
   file=strcat('Gray_Scale ','frame_number', num2str(num),'.png');
   delete (file);
end