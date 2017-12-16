%% Delete the original frames after conversion to grayscale

for num= 1359:1699 %the frames we are interested in 
   file=strcat('frame_number', num2str(num), '.png');
   delete (file);
end