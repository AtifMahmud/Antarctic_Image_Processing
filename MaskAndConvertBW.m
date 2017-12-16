
%% To mask out date stamp, use pixels X= 81:292 
%%Y = 41:100

%% Changing from grayscale to black and white
% Source: https://www.mathworks.com/help/images/ref/im2bw.html

for num= 1359:1699 %the frames we are interested in 
   gray_file=strcat('Gray_Scale ','frame_number', num2str(num),'.png');
   I=imread(gray_file);
   blackwhite=im2bw(I); % No level specified; MATLAB uses 0.5
   blackwhite_filename=strcat('Black_White','frame_number', num2str(num),'.png');
   imwrite(blackwhite, blackwhite_filename);
end

%% Using imshow to display black and white  April 18 photograph 

 imshow('Black_Whiteframe_number1416.png'); 

 
%% Masking out the date stamp 
% Source: https://www.mathworks.com/matlabcentral/answers/86410-changing-values-of-pixels-in-an-image-pixel-by-pixel-thresholdin

for number = 1359:1699; % the images we are working with
  blackwhite_filename=strcat('Black_White','frame_number', num2str(number),'.png');
   my_image =imread(blackwhite_filename);
    for R=28:94
        for C=73:291
            my_image(R,C)=0; 
        end
    end
    masked_BW_filename=strcat(num2str(number), '.png');
    imwrite(my_image, masked_BW_filename);
end 


%% Using imshow to display MASKED black and white  April 18 photograph 

imshow('1416.png');