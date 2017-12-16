%% ELEC 221: Signals and Systems
% MATLAB Project
% Author: Atif Mahmud
% Student Number: 48660147



%% Creating a VideoReader Object 
vidObj = VideoReader('NASA.mp4'); 
get(vidObj); 

% Source: http://stackoverflow.com/questions/31932380/why-is-matlab-unable-to-determine-the-number-of-frames-in-a-video-file
% We need to read the last frame
data = read(vidObj, Inf);
numFrames = vidObj.NumberOfFrames; 

%% Determining Height and Width of Frames
% Source: https://www.mathworks.com/help/matlab/import_export/read-video-files.html
vidHeight = vidObj.Height;
vidWidth = vidObj.Width;


%% Extracting all the frames onto my drive
% I will then use the ones I need 
% Source: https://www.youtube.com/watch?v=AI-1ch6CHkI&t=295s

for img = 1:vidObj.NumberOfFrames;
  filename=strcat('frame_number', num2str(img), '.png');
  frame=read(vidObj, img);
  imwrite(frame, filename); 
end

%% Converting from RGB to Grayscale and writing on drive
% Source: https://www.mathworks.com/help/matlab/ref/rgb2gray.html

for num= 1363:1703 %the frames we are interested in 
    file=strcat('frame_number', num2str(num), '.png');
    RGB=imread(file);
    gray_file=strcat('Gray_Scale ','frame_number', num2str(num),'.png');
    gray_image=rgb2gray(RGB);
    imwrite(gray_image, gray_file);
end 

% Using imshow to display April 18 Photograph

imshow('Gray_Scaleframe_number1416.png'); 


%% To mask out date stamp, use pixels X= 81:292 
%%Y = 41:100

%% Changing from grayscale to black and white
% Source: https://www.mathworks.com/help/images/ref/im2bw.html

for num= 1363:1703 %the frames we are interested in 
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

for number = 1363:1703; % the images we are working with
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

%% Gaussian Low-pass Filter
% Source: https://www.mathworks.com/matlabcentral/newsreader/view_thread/156894



for number = 1363:1703; % the images we are working with
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

%%  Counting white pixels in Day 1
%Source:  https://www.mathworks.com/matlabcentral/answers/12011-count-black-and-white-pixels-on-a-image

 image_1=imread('1363filter.png');
 whitepix_1=0;
 blackpix_1=0;
 
  for R=1:720
        for C=1:1280
            if image_1(R,C)==1;
                whitepix_1=whitepix_1+1;
            else
                blackpix_1=blackpix_1+1
            end    
            end
        end
        
        area_1=whitepix_1;
              
% % Caclulating the percentage change in ice by counting white pixels Source:
% % https://www.mathworks.com/matlabcentral/answers/12011-count-black-and-white-pixels-on-a-image

 for number = 1363:1703; % the images we are working with
     filtered_name=strcat(num2str(number),'filter', '.png');
     image_x=imread(filtered_name);
     whitepix=0;
     blackpix=0;
     day=number-1363+1;
     index=0;
     for R=1:720
        for C=1:1280
            if image_x(R,C)==1;
                whitepix=whitepix+1;
            else
                blackpix=blackpix+1;
        
            end
     end         
     end 
      area=whitepix
      ice_change_tag= ((area-area_1)/area_1)*100;
 end
%  % Source:
%  % https://www.mathworks.com/matlabcentral/answers/113171-how-to-store-values-from-a-loop

      y_val(day)=ice_change_tag;
         
% end


x=linspace(1,183,341);
% figure
% plot(x,y_val);

%% Using polyfit to model ice change as polynomial regression

 poly=polyfit(x,y_val,3); % n=3
 val=polyval(poly,x);
 
 
 
% % Source:
% % https://www.mathworks.com/help/matlab/creating_plots/add-title-axis-labels-and-legend-to-graph.html

 figure
 xlabel('Days');
 ylabel('Percentage change in ice-area');
 
 plot(x,y_val);
 hold % Source: https://www.mathworks.com/matlabcentral/newsreader/view_thread/2131
 plot(x,val, 'Color', 'red');  


exp=-3.29472397891272e-06;

