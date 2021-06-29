function output = loaddatabase();
persistent loaded; % retains its value between calls 
uint_ims=[];
if (isempty(loaded))
    Images = zeros(82369,25);
    cd('TD_face_cropped');
    for i= 1:25
    image_holder = imread(strcat(num2str(i),'cropped','.jpg'));
    image_holder = rgb2gray(image_holder);
    image_holder = imresize(image_holder,[287 287]);
    Images(:,i) = reshape(image_holder,[82369 1]) ; % i. sütunda i. resme ait piksel değerleri 
    end
    fprintf('Database loaded\n');
    uint_ims = uint8(Images);
    cd ..
else fprintf('Databese already loaded.\n')    
end
loaded = 1;
output = uint_ims;
end