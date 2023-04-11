# download_images_function

A function to download images to local folders from a spreadsheet containing URLs for multiple images

The 'dat' argument is the 'image_report' spreadsheet from a data download on Wildtrax (you need organization admin privileges to access image URLs).
The 'dat' data table must have 3 columns named "location, "image_url", and "image_id" for the columns containing the camera location names, image URLs, and image IDs, respectively.

The'file.path' argument is the existing main folder within your R Project where you want the images to be saved (e.g., "Data/cameras/" - make sure it ends with a "/").
Separate folders will be automatically made for each camera location.


#IMPORTANT NOTE: You need to load the package "data.table" for this function to work.


