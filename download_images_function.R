#Function to download images from a spreadsheet containing URLs for multiple images

# 'dat' argument is the 'image_report' spreadsheet from a data download on Wildtrax (you need organization admin privileges to access image URLs)
  #the 'dat' data table must have 3 columns named "location, "image_url", and "image_id" for the columns containing the 
  #camera location names, image URLs, and image IDs, respectively

# 'file.path' argument is the existing main folder within your R Project where you want the images to be saved 
    # (e.g. if working within a R project, "Data/cameras/" - make sure it ends with a "/")
    # Separate folders will be automatically made for each camera location


#IMPORTANT NOTE: You need to load the package "data.table" for this function to work.
# install.packages("data.table")
# library(data.table)


# Author: Liam Horne
# Last Updated: April 5, 2023

download.images<- function(dat, file.path) {
  
  #get list of camera locations names
  loc <- dat[, unique(location)]
  
  for(l in loc) {
    #get  data for specific location
    specloc <- dat[location == l]
    
    #check if directory exists
    already.directory<-dir.exists(paste0(file.path, l))
    
    if (already.directory) { #If True, then just add folders to the directory already named as given location in the loop
      
      #get image urls from the given location in the loop
      url<-specloc[, image_url]
      
      for(u in url) {
        
        #get the image id from the row with the given URL
        iid<-specloc[image_url == u, image_id]  #just image_id, not .(image_id) because just want the 'Values' output
        #download image from url, and name it according to the camera location and image id
        download.file(u, destfile = paste0(file.path, l, "/image_", iid, ".jpg"), mode = 'wb')
      }
    } else { #if the directory doesn't exist yet
      
      #create folder in directory for the given location
      dir.create(paste0(file.path, l))
      
      #get image urls from given location
      url<-specloc[, image_url]
      
      for(u in url) {
        
        #get the image id from the row with the given URL
        iid<-specloc[image_url == u, image_id] 
        #download image from url, and name it according to the camera location and image id
        download.file(u, destfile = paste0(file.path, l, "/image_", iid, ".jpg"), mode = 'wb')
      }
    }
  }
}

