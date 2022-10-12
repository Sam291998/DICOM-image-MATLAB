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




%% 0B: DICOM COLLECTION %
%% a: COLLECTION

details = dicomCollection(fullfile(matlabroot,'toolbox/images/imdata'));               % collection of files
dicom_files=dicomCollection(fullfile(matlabroot,'toolbox/images/imdata/dicomdir'));    % gather details about the DICOM files contained in the input directory                         
disp(details);                                                                        % display in the console the gathered table                                     
disp(dicom_files);                                                                     % display in the console the gathered table                                    



%% b:  selecting and viewing US Data

disp(dicom_files("s2",14));                                                % getting the filename of the above Modality file                    

[X,cmap] = dicomread(dicom_files.Filenames("s2"));                         % reading the above series data with the color map   
figure()
montage(X,cmap, 'Size', [2 5])                                             % the montage of the series with the color map 

t=title('\bf US data:US-PAL-8-10x-echo','Color','blue');                   % title                                                                  
t.FontSize=16;





%% c: selecting and viewing CSP Data

CSP_Data=details("s3",14);                                                 % reading the series with the StudyDescription equal to "CSP" 
CSP_files=CSP_Data.Filenames{1,:};                                         % getting the filenames from CSP data 
disp(CSP_files);                                                           % displaying all filenames                                            

info=dicominfo(CSP_files(1));                                              % selecting one file from series   
windocenter=info.WindowCenter;                                             % reading the attributes WindowCenter and WindowWidth from the above file
windowidth=info.WindowWidth;
xrange=windocenter-windowidth/2;                                           % setting the display range
yrange=windocenter+windowidth/2;                                           % setting the display range




fileFolder = fullfile(matlabroot,'toolbox/images/imdata/dog');
dicomimds = imageDatastore(fileFolder,'FileExtensions','.dcm','ReadFcn',@(x) dicomread(x));  % creating imagedatastore for series of CSP data           
figure()
montage(dicomimds,"DisplayRange",[xrange yrange]);                                           % displaying in 1 figure the montage of the series with the display range               
title("CSP data");                                                                           % title                                                                                        

