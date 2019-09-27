clear all;
close all;
clc;

%%
for v = 1:12
    disp(v)
    if v < 10
        fileName1 = "v0"+string(v)+".mat";
        saveName1 = "result/v0"+string(v)+".png";
        fileName2 = "v0"+string(v)+"_anti.mat";
        saveName2 = "result/v0"+string(v)+"_anti.png";
    else
        fileName1 = "v"+string(v)+".mat";
        saveName1 = "result/v"+string(v)+".png";
        fileName2 = "v"+string(v)+"_anti.mat";
        saveName2 = "result/v"+string(v)+"_anti.png";
    end

    load(fileName1);
    load(fileName2);
    imwrite(cast(rgbI,'uint8'),char(saveName1));
    imwrite(cast(rgbI2,'uint8'),char(saveName2));
end