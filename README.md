# download_images_function

Function to download images from a spreadsheet containing URLs for multiple images

Author: Liam Horne

Last Updated: April 17, 2023

# ARGUMENTS 

"dat" argument is the "image_report" spreadsheet from a data download on Wildtrax (you need organization admin privileges to access image URLs)

"file.path" argument is the existing main folder within your R Project where you want the images to be saved (e.g. if working within a R project, "Data/cameras/" - make sure it ends with a "/"). Separate folders will be automatically made for each camera location.


# IMPORTANT NOTES 

This function depends on "data.table" and "httr" packages. These dependencies are installed by the "download.images" function, but you will still have to install "data.table" if you want to run the code to change column names following the "Example data for download images function" script.

The "dat" data table MUST HAVE 3 columns named "location", "image_url", and "image_id" for the columns containing the camera location names, image URLs, and image IDs, respectively
This can be done using the "setnames" function in data.table - see the "Example data for download images function" script

Any of these characters \ / : * ? " < > | in the "location" or "image_id" columns will cause errors and are therefore automatically replaced with "_" by the function
