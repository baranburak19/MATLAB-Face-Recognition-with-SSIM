clear all
clc
answer = input("Enter the number next to your choice:\n(1)Capture face with webcam\n(2)Input image \n ");
global I;
if answer == 2 %% image scan
    croppedface = imagescan();
end

if answer == 1 %%webcam scan
    croppedface = webcamscan();
end

 % Compare with ? 
 answercomp = input("Enter the number next to your choice:\n(1)Compare with faces from database\n(2)Compare with key face\n");
 if (answercomp == 1)%Compare with faces from database:
 images = loaddatabase();
 similarity = zeros(1,25);
 for i = 1:25
image = reshape(images(:,i),[287 287]); 
similarity(i)= ssim(croppedface,image);
end
[M,index] = max(similarity); % I. yüze en benzer yüz
if (M <0.75)
    fprintf('Face does not match with any face from database.\n');
else
cd('TD_face_cropped');
similarface = imresize(imread(strcat(num2str(index),'cropped.jpg')),[287 287]);
subplot(1,2,1);
imshow(I);
title('Input image');
subplot(1,2,2);
imshow(similarface);
title('Matched face from database');
cd .. 
end
 end
 
 
 if (answercomp ==2) %Compare with key face
     answerkey = input("Enter the number next to your choice:\n(1)Capture key face with webcam\n(2)Input key face \n ");

    if(answerkey == 1) % take keyface with webcam
    keyface = webcamscan();
    end
    if(answerkey == 2) % input keyface from a file
    [file,path] = uigetfile('*.*','Select a key face');
    keyfaceloc = strcat(path,file);
    keyface = imread(keyfaceloc);
    keyface = rgb2gray(imresize(keyface, [287,287]));
    end
 
 %Compare key face and cropped face from first image
 similarity= ssim(croppedface,keyface);
 if (similarity < 0.75)
 fprintf('\nFaces does not match with each other.\n'); 
 else
  fprintf('\nKey face matches with input face.\n');
 end
 end



