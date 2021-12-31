function detect = Detect_color(data,k)
% red color extraction
color=data(:,:,k);
% convert picture into gray
gray=rgb2gray(data);
% subtract red to gray frame
diff_im=imsubtract(color,gray);
% use median filter
diff_im=medfilt2(diff_im,[3,3]);
% convert image into binary
level = graythresh(diff_im);
diff_im=im2bw(diff_im,level);
% use blob statistics analysis on this image 
diff_im=bwareaopen(diff_im,500); % xoa doi tuong nho, roi rac
bw=bwlabel(diff_im,8);
% use boundbox to enbox red color object
stats=regionprops(bw,'BoundingBox');
%image(data);
max_area = 0;
area = 0;
object = 0;
hold on
if(length(stats)>0)
    for(i=1:length(stats))
        a = stats(i).BoundingBox;
        
        if((a(3)>a(4)*2) || (a(4)>a(3)*2))
            proportion = 0;
        else
            proportion = 1;
            a(4) = a(3)*1;
            area = a(3)*a(4);
        end

        if((max_area<area)&&(proportion == 1))
            max_area = area;
            object = i;
        end
    end
    
    if(object == 0)
        detect = 0;
    else
        bb=stats(object).BoundingBox;
        detect =  imcrop(data, a);
        %rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
    end
else
    detect = 0;
end
end
 