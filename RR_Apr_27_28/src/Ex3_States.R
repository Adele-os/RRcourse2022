# Using the 'states' datasets, a built-in dataset in R  to work with US states (batteries included! lol)
# We can initially put the upper and lower values to construct the dataframe

df <- data.frame(toupper(state.name),
                 tolower(state.name))
names(df) <- c('UPPERCASE','lowercase') # Changing the column names

# We can store and save the result in 'in' folder for the further use 
# Creating input directory
dir.create('C:\\Users\\SONY\\Documents\\GitHub\\RRcourse2022\\RR_Apr_27_28\\in')
save(df, file = 'C:\\Users\\SONY\\Documents\\GitHub\\RRcourse2022\\RR_Apr_27_28\\in\\states_df')

#Loading the file
load('C:\\Users\\SONY\\Documents\\GitHub\\RRcourse2022\\RR_Apr_27_28\\in\\states_df')

# Saving the csv file in the 'out' folder

# Creating output directory
dir.create('C:\\Users\\SONY\\Documents\\GitHub\\RRcourse2022\\RR_Apr_27_28\\out')
path_out = 'C:\\Users\\SONY\\Documents\\GitHub\\RRcourse2022\\RR_Apr_27_28\\out\\States.csv'
write.csv(df,file.path(path_out), row.names = F)
