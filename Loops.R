## Loops

view(starwars)

## A simple example

for(i in 1:5){
  print(starwars$name[i])
}





## use variable name instead of number

for(i in 1:length(starwars$height)){
  print(starwars$height[i])
}





#create an empty vector
tallness <- vector(
  mode = "numeric",
  length = 5)

# Add data points to new vector
for(i in 1:5){
  tallness[i] <- starwars$height[i]/100
}

#Check new vector
tallness



## Creating a break

for(x in starwars$name){
  print(x)
  if(x == "Darth Vader"){
    break
  }
}





# skip a data point

for(x in starwars$name){
  if(x == "C-3PO"){
    next
  }
  print(x)
  if(x == "Darth Vader"){
    break
  }
}



## Concatenate and print
for(i in 1:5){
  cat("The height of", starwars$name[i], "is", tallness[i], "meters \n")
}



















































