web=webcam();
img=snapshot(web);     %for storing the snapshots from video
imshow(img);
[width,height]=size(img);

while true
    img=snapshot(web);   

if width>144                
    img=imresize(img, [144 NaN]); %here we can change the width of image
                                  %I have kept it low for the smooth video graphics and movement 
end

face_Detector = vision.CascadeObjectDetector();

location_of_the_face = step(face_Detector, img);   %get the coordinates of image

detected_image= insertObjectAnnotation(img,'rectangle',location_of_the_face,'Face');
                                                %for placing the rectange
                                                %at right coordinates
web;
imshow(detected_image);
title('Face Detection');
end