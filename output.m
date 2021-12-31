
data=imread('501.jpg');

s = detect(data);
subplot(1,length(s)+1,1);
imshow(data);

hold on
k = 1;

for i=1:length(s)
    bb=s(i).BoundingBox;
    detected =  imcrop(data, s(i).BoundingBox);
    %rectangle('Position',bb,'EdgeColor','r','LineWidth',2);

    
    detect_RGB_red = Detect_color(detected,1);
    if(detect_RGB_red == 0)
    else
        k = k + 1;
        subplot(1,length(s)+1,k);
        imshow(detect_RGB_red);
        recognition(detect_RGB_red,length(s)+1,k) 
    end
    
    detect_RGB_blue = Detect_color(detected,3);
    if(detect_RGB_blue == 0)
    else
        k = k + 1;
        subplot(1,length(s)+1,k);
        imshow(detect_RGB_blue);
        recognition(detect_RGB_blue,length(s)+1,k) 
    end
end
hold off