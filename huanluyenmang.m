%https://www.engineersgarage.com/matlab-red-color-detection/
clear all;
X=[]; 
D=zeros(4,360);
for sobienbao = 1:4,
    for k=1:90,
        filename = ['C:\Users\DAO TRUNG HIEU\OneDrive\Máy tính\Nhan dang bien bao giao thong\anh\' int2str(sobienbao) ' (' int2str(k) ')' '.png'];
        img1=imread(filename);
        img2=imresize(img1,[128 128]);
        img3 = rgb2gray(img2); 
        level = graythresh(img3);
        img4 = im2bw(img3,level);
        x=trichdactrung(img4);
        %[featureVector,hogVisualization] = extractHOGFeatures(img4,'CellSize',[36 36]);
        %x=featureVector';
        X=[X x];
        D(sobienbao,(sobienbao-1)*90+k)=1;
    end;
end;

temp=rand(1,360);
[temp,ind]=sort(temp);
X=X(:,ind);
D=D(:,ind);

Net=newff(X,D,10,{'tansig','purelin'});
Net=train(Net,X,D);

save mangnhandangbienbao.mat Net
