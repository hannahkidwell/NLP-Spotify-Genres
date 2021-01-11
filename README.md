# Machine Learning Model Overview

## Description of preliminary data preprocessing
- Getting familiar with the Spotify API
  - How to search for playlists in each category
  - Pulling songs, artists, and genres
  - Getting audio features for a song
- Practice using LyricsGenius, a Python client for the Genuis API
  - Searching for songs and their lyrics
- Cleaning song lyrics
  - Removing non alphabetic symbols such as punctuation
  - Tokenize lyrics and remove stop words
  - Determine the language of the lyrics and remove non English songs
- Creating a DataFrame for the ML model
  - Find a list of all unique word stems found used more than 3 times
  - Use song title, artist, category, along with the list of unique word stems as column names
  - Fill in each row with stem frequencies

## Description of preliminary feature engineering and preliminary feature selection
- I used dataframe filled with song information (artist, genre, and lyrics) to create a new dataframe with stem frequencies for each song
- Then I selected only the word stems that appeared more than 3 times within the dataset
- Futhermore, I removed songs that did not have matching categories and genres 

## Description of how data was split into training and testing sets
- The data was split into training and testing sets using the train_test_split method from the sklearn library
- The training set contained the default 75% of the original dataset which was 6,010 songs
- The testing set containted the other 25% of the orginal dataset which was 2,004 songs

## Explanation of model choice
- I am still using a random forest model because it:
  - Allows for feature ranking, which we can use in order to eliminate features that have little impact on the output of our model
  - Runs efficiently on large datasets
  - Is robust to outliers
- One limitation of this model has been accuractely prediciting similar genres
- I also created a k-means model and a perceptron model, but they performed much worse than the random forest model
  - The k-means model had an accuracy of 22%
  - The perceptron model has an accuracy of 10%

## Explanation of changes in model choice
- I am still using a random forest model, but I changed the input features from word frequencies to word stem frequencies
  - Before, each input feature had 21,516 dimensions and the filtered input features had 14,046
  - After changing the input features from unique words to unique word stems, each input feature has 15,391 dimensions and the filtered features have 9,099

## Description of how the model was trained
- I trained the model using the scaled X training set and the y training set with 500 estimators and a random state of 78
  - The scaled X training set contained the audio features and word stems
  - The y training set contained the category id
  - It took 30 seconds to train the model
- To further train the model, I can pull down more songs from the Spotify and Genius APIs

## How accurate, precise, and sensitive is the model?
- The model's accuracy using the entire dataset is 51.6%
- After filtering the data to only include songs with matching categories and genres, the accuracy increased to 64.8%
- The model's macro average precision score was 0.67
  - The jazz genre had the best precision of 100%
  - The indie_alt and romance genres had the lowest precision of 46% 
- The model's weighted average recall score was 0.65
  - The hiphop genre had the best sensitivity of 93%
  - The soul genre had the lowest sensitivity of 14% 
