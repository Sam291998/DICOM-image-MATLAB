% Name: (Samson David Puthenpeedika)

%%%%%%%%% 02: RESAVE DICOM IMAGE %%%%%%%%%%


%% Read DICOM file

x = dicomread('CT-MONO2-16-ankle.dcm');  


%% getting the metadata from dicom file

info=dicominfo('CT-MONO2-16-ankle.dcm');            

% displaying the following DICOM information one by one in the console
modality=info.Modality;                             
disp("Modality= "+modality);

rows=info.Rows;
disp("Rows= "+rows);

columns=info.Columns;
disp("Columns= "+columns);

bits_allocated=info.BitsAllocated;
disp("Bits_allocated= "+bits_allocated);

rescale_intercept=info.RescaleIntercept;
disp("Rescale_intercept= "+rescale_intercept);

rescale_slope=info.RescaleSlope;
disp("Rescale_slope= "+rescale_slope);


%% Display DICOM imgage

% rescale the grayscale image by mapping the full range of its content intensity
img8 =uint8(rescale(x,0,255));        

figure(1)
imshow(img8);

% save the rescaled image in one 8-bit PNG file
imwrite(img8,'8_bit.png');                     
