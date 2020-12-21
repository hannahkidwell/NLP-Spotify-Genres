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
  - Find a list of all unique words found and remove words used less than 5 times
  - Use song title, artist, category, along with the list of unique words as column names
  - Fill in each row with lyric term frequencies

## Description of preliminary feature engineering and preliminary feature selection
- I used dataframe filled with song information (artist, genre, and lyrics) to create a new dataframe with term frequencies for each song
- Then I selected only the words that appeared at least 3 times within the dataset
- Futhermore, I removed songs that did not have matching categories and genres 

## Description of how data was split into training and testing sets
- The data was split into training and testing sets using the train_test_split method from the sklearn library
- The training set contained the default 75% of the original dataset which was 6,010 songs
- The testing set containted the other 25% of the orginal dataset which was 2,004 songs

## Explanation of model choice
- I chose to use a random forest model because they:
  - Allow for feature ranking, which we can use in order to eliminate features that have little impact on the output of our model
  - Run efficiently on large datasets
  - Are robust to outliers
- One limitation of this model has been accuractely prediciting similar genres

## How accurate, precise, and sensitive is the model?
- The model's accuracy using the entire dataset is 51.6%
- After filtering the data to only include songs with matching categories and genres, the accuracy increased to 64.5%
- The model's precision and sensitivity scores are

## What could you include if you had more time?
- Using the random forest model to predict genre only using two genres at a time
- Figuring out the most common words for each genre
- Analyzing common phrases in the dataset
