# ELEC 221 2016W1 Project: Climate Change and The Antarctic Sea Ice Extent - Visual to Statistics

MATLAB code from my ELEC 221 Project, completed back in 2016. 

## ELEC 221: 2016W1

ELEC 221, Signals and Systems at UBC covers the following topics :

Complex numbers, LTI systems, convolution sum, discrete-time Fourier series and transforms, z-transform, sampling, introduction to filtering and modulation, feedback systems, stability.

The course had an optional project to be implemented in MATLAB, worth upto 10% of our final course grade. The project specification, report draft, and source code are available in this repository. 

## Notes

The code was slightly modified and refactored from the original version. The entire script has been separated into different files for modularity and easier disk management. 

## Instructions

1. Clone this repository

2. Open MATLAB, and navigate to this directory on your local machine

3. Run the script titled `ExtractFrames.m`. After completion of this script, all 3081 frames should be extracted and stored in the directory.

4. Run the script titled `DeleteExcessOGFrames.m`. Since we are interested in only the frames 1359-1699, we will remove the rest to free up storage. 

5. Run the script titled `ConvertToGrayScale.m`. This will make a new GrayScale copy of the images. 

6. Run the script titled `DeleteRemainingOGFrames.m`. This will delete the original frames of interest as we no longer need them.

7. Run the script titled `MaskAndConvertBW.m`. This will make Black and White copies of the GrayScale images, and then make another copy of each where the date is masked out.

8. Run the script titled `DeleteBWFrames.m`. Since we now have the masked images, we can delete the raw black and white ones.

9. Run the script titled `Filter.m`. This will use a Gaussian Low-Pass Filter to remove any effects from shadows.

10. Run the script titled `DeleteMasked.m`. This will delete all of the masked images, since we will work with the filtered ones now.

11. Run the script titled `IceChangePlot.m`. Observe the plots.

12. Finally, run the script `DeleteFilteredFrames.m`. This will delete all the filtered images from the directory. 
