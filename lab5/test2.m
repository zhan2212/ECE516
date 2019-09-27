clear all;
close all;
clc;

%%
for v = 1:12
    disp(v)
    if v < 10
        fileName = "videos\v0"+string(v)+".mp4";
    else
        fileName = "videos\v"+string(v)+".mp4";
    end
    video=VideoReader(char(fileName));
    vidHeight=video.Height; 
    vidWidth=video.Width; 
    k=1;
    while hasFrame(video)
        img = readFrame(video);
        r(:,:,k)=img(:,:,1);
        g(:,:,k)=img(:,:,2);
        b(:,:,k)=img(:,:,3);
        k = k+1;
    end

    % mean
    r1 = mean(r,3);
    g1 = mean(g,3);
    b1 = mean(b,3);
    rgbI= cat(3, r1, g1, b1);
    if v < 10
        saveName = "v0"+string(v)+".mat";
    else
        saveName = "v"+string(v)+".mat";
    end
    save(saveName,'rgbI','r1','g1','b1');
    
    r2 = zeros(1080,1920);
    g2 = zeros(1080,1920);
    b2 = zeros(1080,1920);
    
    % anti
    for i = 1:1080
        for j = 1:1920
            sum_r = 0;
            sum_g = 0;
            sum_b = 0;
            for k = 1:540
                sum_r = sum_r + double(r(i,j,k))^(2.22);
                sum_g = sum_g + double(g(i,j,k))^(2.22);
                sum_b = sum_b + double(b(i,j,k))^(2.22);
            end
            r2(i,j) = (sum_r/540)^(1/2.22);
            g2(i,j) = (sum_g/540)^(1/2.22);
            b2(i,j) = (sum_b/540)^(1/2.22);
        end
    end
                
    if v < 10
        saveName = "v0"+string(v)+"_anti.mat";
    else
        saveName = "v"+string(v)+"_anti.mat";
    end
    rgbI2 = cat(3, r2, g2, b2);
    save(saveName,'rgbI2','r2','g2','b2');

%     for i =1:540
%         res = cat(3, r(:,:,i), g(:,:,i), b(:,:,i));
%         imshow(res);
%         close all;
%     end
end

