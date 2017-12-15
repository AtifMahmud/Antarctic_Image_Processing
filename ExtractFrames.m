%% Extracts frames and relevant information from a video file 

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