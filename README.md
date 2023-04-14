# download_images_function

Function to download images from a spreadsheet containing URLs for multiple images

Author: Liam Horne

Last Updated: April 13, 2023

# ARGUMENTS 

'dat' argument is the 'image_report' spreadsheet from a data download on Wildtrax (you need organization admin privileges to access image URLs)

'file.path' argument is the existing main folder within your R Project where you want the images to be saved (e.g. if working within a R project, "Data/cameras/" - make sure it ends with a "/"). Separate folders will be automatically made for each camera location.


# IMPORTANT NOTES 

You need to load the package "data.table" for this function to work.
install.packages("data.table")
library(data.table)

The 'dat' data table MUST HAVE 3 columns named "location", "image_url", and "image_id" for the columns containing the camera location names, image URLs, and image IDs, respectively.
This can be done using the 'setnames' function in data.table - see the download_images example script.

Any of these characters \ / : * ? " < > | in the "location" or "image_id" columns will cause errors and are therefore automatically replaced with "_" 
