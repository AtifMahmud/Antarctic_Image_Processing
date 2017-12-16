%% Converting from RGB to Grayscale and writing on drive
% Source: https://www.mathworks.com/help/matlab/ref/rgb2gray.html

for num= 1359:1699 %the frames we are interested in 
    file=strcat('frame_number', num2str(num), '.png');
    RGB=imread(file);
    gray_file=strcat('Gray_Scale ','frame_number', num2str(num),'.png');
    gray_image=rgb2gray(RGB);
    imwrite(gray_image, gray_file);
end 

% Using imshow to display April 18 Photograph
imshow('Gray_Scaleframe_number1416.png'); 