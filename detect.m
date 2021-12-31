function s = detect(input)
    I = input;
    I = immultiply(I,1.5);
    I = rgb2hsv(I);

    H_max = 179/255;
    H_min = 0;

    S_max = 1;
    S_min = 140/255;

    V_max = 1;
    V_min = 40/255;
    % Create mask based on chosen histogram thresholds
    BW = ( (I(:,:,1) >= H_min) | (I(:,:,1) <= H_max) ) & ...
        (I(:,:,2) >= S_min ) & (I(:,:,2) <= S_max) & ...
        (I(:,:,3) >= V_min ) & (I(:,:,3) <= V_max);
    BW =bwareaopen(BW,1000);
    bw=bwlabel(BW,8);
    s=regionprops(bw,'BoundingBox');
end