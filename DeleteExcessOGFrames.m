%% Delete the frames we no longer need

for num= 1:1358 
    file=strcat('frame_number', num2str(num), '.png');
    delete (file);
end 

for num= 1700:3081 
    file=strcat('frame_number', num2str(num), '.png');
    delete (file);
end 

