function recognition(detect,length_im,position_im) 
        img1 = detect;    
        img2 = imresize(img1,[128 128]);
        img2 = immultiply(img2,1.5); %tang do tuong phan cho anh
        img3=rgb2gray(img2); %chuyen sang anh xam
        level = graythresh(img3); % lay nguong xam de chuyen qua anh nhi phan
        img4 = im2bw(img3,level);
        x=trichdactrung(img4);
        load mangnhandangbienbao.mat
        y=sim(Net,x);
        [ymax,i]=max(y);
        disp(y);
        if ymax<0.5,
            disp('Khong nhan dang duoc');
        else
            subplot(1,length_im,position_im);
            imshow(img1);
            switch(i)
                case 1  
                    title('Noi giao nhau chay theo vong xoay');   
                case 2
                    title('Cam re trai');
                case 3
                    title('Toc do gioi han 50km/h');
                case 4
                    title('Di vong sang phai');
            end
        end
 end
 