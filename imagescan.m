function output = imagescan()
[file,path] = uigetfile('*.*','Select an image');
imloc = strcat(path,file);
global I;
I = imread(imloc);

faceDetector = vision.CascadeObjectDetector;
faceDetector.MergeThreshold = 10;
fbox = faceDetector(I);

imagef = insertObjectAnnotation(I,'rectangle',fbox,'Face','LineWidth',3);
croppedface = imcrop(imagef,fbox);
croppedface = rgb2gray(imresize(croppedface, [287 287]));

output = croppedface;
end