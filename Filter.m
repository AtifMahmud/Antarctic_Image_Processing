
%% Gaussian Low-pass Filter
% Source: https://www.mathworks.com/matlabcentral/newsreader/view_thread/156894



for number = 1359:1699; % the images we are working with
    masked_BW_filename=strcat(num2str(number), '.png');
    masked_image=imread(masked_BW_filename);
    N = fspecial('gaussian', [12, 12], 15);
    image=imfilter(masked_image,N);
    filtered_name=strcat(num2str(number),'filter', '.png');
    imwrite(image,filtered_name);
end 

% Using imshow to display FILTERED black and white  April 18 photograph 
imshow('1416filter.png'); 


% Finding 2-D DFT of averaging filter 

fft=fft2(N);