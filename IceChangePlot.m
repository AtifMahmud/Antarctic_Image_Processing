%% Caclulating the percentage change in ice by counting white pixels Source:
%% https://www.mathworks.com/matlabcentral/answers/12011-count-black-and-white-pixels-on-a-image

%%  Counting white pixels in Day 1
%Source:  https://www.mathworks.com/matlabcentral/answers/12011-count-black-and-white-pixels-on-a-image

 image_1=imread('1359filter.png');
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

 for number = 1359:1699; % the images we are working with
     filtered_name=strcat(num2str(number),'filter', '.png');
     image_x=imread(filtered_name);
     whitepix=0;
     blackpix=0;
     day=number-1359+1;
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

%% Source:https://www.mathworks.com/matlabcentral/answers/113171-how-to-store-values-from-a-loop

y_val(day)=ice_change_tag;
end 

x=linspace(1,183,341);
figure
plot(x,y_val);

%% Using polyfit to model ice change as polynomial regression

poly=polyfit(x,y_val,3); % n=3
val=polyval(poly,x);
 
% % Source:
% % https://www.mathworks.com/help/matlab/creating_plots/add-title-axis-labels-and-legend-to-graph.html

figure
xlabel('Days');
ylabel('Percentage change in ice-area'); 
plot(x,y_val);

% Source: https://www.mathworks.com/matlabcentral/newsreader/view_thread/2131
figure
plot(x,val, 'Color', 'red');  



exp=-3.29472397891272e-06;
