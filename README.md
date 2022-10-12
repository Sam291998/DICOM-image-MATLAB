# DICOM-image-MATLAB
read DICOM image, display meta-information and resave DICOM image.
loading and processing of DICOM files from DICOM collection MATLAB.

<pre>
Steps:-

a: reasave DICOM image

  • input: CT-MONO2-16-ankle.dcm from MATLAB.
  • read the above DICOM file.
  • display different DICOM meta-information.
  • rescale the grayscale image by mapping the full range of its content intensity to the scale of the corresponding image data type.
  • save the rescaled image in one 8-bit PNG file.
</pre>
Result:

![dicom_img](https://user-images.githubusercontent.com/92868130/195371091-2d529820-5526-44bd-95e4-b0aa8c3ecab0.png)



<pre>
b: loading and processing of DICOM files from DICOM collection MATLAB

  • input directory: fullfile( matlabroot, ’toolbox/images/imdata’ )
  • gather details about the DICOM files contained in the input directory.
  • display in the console the gathered table
  
  • look for the series with the Modality equal to ’US’
  • read the series data with the color map
  • display in 1 figure the montage of the series with the color map
  
  • look for the series with the StudyDescription equal to ’CSP’
  • read the attributes WindowCenter and WindowWidth from one file in the series
  • set the display range to [WindowCenter − WindowWidth/2, WindowCenter +
    WindowWidth/2]
  • display in 1 figure the montage of the series with the display range

</pre>

Result:

1. US data 

![usdata](https://user-images.githubusercontent.com/92868130/195373614-f5e474aa-1516-45a0-b6a2-d00ed3b0b5c4.png)





2. CSP data

![cspdata](https://user-images.githubusercontent.com/92868130/195373652-4f77c296-b37a-41e3-845b-bd92f19f2493.png)
