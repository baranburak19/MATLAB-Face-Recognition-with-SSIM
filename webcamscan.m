function output = webcamscan()
cam = webcam();
faceDetector = vision.CascadeObjectDetector;

t0=clock;
while etime(clock, t0) < 5
    image = snapshot(cam);
    fbox = faceDetector(image);
    imagef = insertObjectAnnotation(image,'rectangle',fbox,'Face');
    imshow(imagef);
end
croppedface = imcrop(imagef,fbox);
imshow(croppedface);
title('Captured face from webcam');
croppedface = rgb2gray(imresize(croppedface, [287 287]));
output = croppedface;
end