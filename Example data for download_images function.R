#Example of how to download images from Wildtrax using the 'download_images' function 
  #see separate "download_images_function" script to load the function and see additional details

## Author: Liam Horne
# Last Updated: April 17, 2023

#load data.table
#install.packages("data.table")
library(data.table)

#Create example data using stock image URLs 
eg <- data.table(camera_site = c("A1", "A2", "A2", "A3", "A4"), 
                 `image_url(admin only)` = c("https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                             "https://images.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                             "https://images.pexels.com/photos/1366630/pexels-photo-1366630.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                             "https://images.pexels.com/photos/2088210/pexels-photo-2088210.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                                             "https://badurl.example"),
                 date = c("2022-04-25", "2022-04-26", "2022-04-27", "2022-04-28", "2022-04-29"))

#Set column names for use in the download images function

setnames(eg, old = "camera_site", new = "location")   #Change the name of the column that has your camera locations/names to "location"
setnames(eg, old = "image_url(admin only)", new = "image_url")    #Change the name of the column that has your image URLs to "image_url"
setnames(eg, old = "date", new = "image_id")    #Change the name of the column that has your image id info (e.g., date) to "image_id" 
                                                #This id will be pasted into the file name of each image

#Run the function, which simultaneously downloads the images and saves the output of any non-working URLs
badURLs<-download.images(dat = eg, file.path = "C:/Workspace/") 

#This example of a file path name is meant to be universal for example purposes, but ideally you would be using a 
#file path name within a R project, e.g., "Data/cameras/"

