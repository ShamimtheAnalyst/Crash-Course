#### Removing outliers - quick & dirty


# Preparing the data
# First of all, we insert a couple of outliers to the $disp column of the mtcars dataset
# (mtcars comes with the base package, so no need to import anything)
# In order to have a couple of outliers in this dataset, we simply multiply the values in mtcars$disp that are higher than 420 by *2

mtcars$disp[which(mtcars$disp > 420)] <- c(mtcars$disp[which(mtcars$disp >420)]*2)

# (This is just a random way of inserting a couple of outlier values, you could also assign a couple of high values in a milion different ways)

# Now we have a look at $disp column of the mtcars dataset with boxplot

boxplot(mtcars$disp)


### Storing outliers into a vector

# You can get the actual values of the outliers with this

boxplot(mtcars$disp)$out


# (Optional) If you don't need to see the plot again, you can hide it using plot=FALSE

boxplot(mtcars$disp, plot=FALSE)$out



# Now you can assign the outlier values into a vector

outliers <- boxplot(mtcars$disp, plot=FALSE)$out

# Check the results

print(outliers)


### Removing the outliers

# First you need find in which rows the outliers are

mtcars[which(mtcars$disp %in% outliers),]



# Now you can remove the rows containing the outliers, one possible option is:

mtcars <- mtcars[-which(mtcars$disp %in% outliers),]

# If you check now with boxplot, you will notice that those pesky outliers are gone

boxplot(mtcars$disp)




