# Machine Learning Model Overview

## Description of preliminary data preprocessing
- First, I created the clean_spotify_data.ipynb file which accomplishes the following:
  - Create a list of playlists for 14 genres
    - This list contains 341 unique playlist ids
  - Create a DataFrame of song names, artists, and categories (genres) for each song in each playlist
    - This DataFrame contains 14,212 rows (songs)
    - It has 5 columns: song, song_id, artist, artist_id, and category
    - The run time to create the DataFrame using the Spotify API was 186 seconds
  - Add a column of artist genres 
    - The run time to get the genres for each artist using the Spotify API was about 19 minutes
  - Define a function that adds a filtered_genres column of common genres
    - There were 861 unique genres found
    - The run time of this function was 24 seconds
    - There are 349 unique genres in the new column
  - Add 13 columns of audio features
    - The run time to get the audio features for all 14,212 songs was about 29 minutes
  - Save the DataFrame as song_genres.csv
- Next, I created the clean_lyricsgenius_data.ipynb file which does the following:
  - Create DataFrame from the previous Spotify API calls
  - Add a column of song lyrics
    - Looking up the lyrics for all 14,212 songs using the Genius API took about 10 hours
    - There were no lyrics found for 5,229 songs
  - Define a function that cleans the song lyrics
    - This function removes unnecessary symbols and spaces
  - Add a non alphabetic word count column
  - Remove the songs without lyrics from the DataFrame
    - The updated DataFrame contains 8,982 songs
  - Save the DataFrame as song_lyrics.csv
- Then, I created the PySpark_NLP.ipynb file in order to:
  - Remove 371 more songs that do not have lyrics
  - Add a category_id column of encoded categories/genres
  - Tokenize the lyrics and remove stop words
  - Remove stop words
  - Remove 167 instrumental songs
  - Create a list of languages
    - There were 26 unique languages found
    - It took 75 seconds to find the languages of all 8,444 songs
  - Add a language column to the DataFrame
  - Remove 9 songs with no language
  - Save the DataFrame as nlp_df.csv
- Lastly, I created the termfrequencies.ipynb file which does the following:
  - Create a list of all words from the filtered lyrics column
    - 39,244 unique words were found
  - Add a unique word count column and update the filtered lyrics column
  - Remove the 336 songs with less than 25 unique words
  - Try to remove non English songs
  - Update the list of unique words and remove non alphabetic words
  - Create a DataFrame for the ML model
    - This DataFrame has 34,573 columns 
    - The run time to create the DataFrame was 128 seconds
  - Fill the DataFrame with term frequencies
    - Adding the term frequenices took about 68 minutes
  - Remove columns of words that only appear once
    - The updated DataFrame has 21,516 columns
  - Create a filtered DataFrame with columns of words that appear at least 4 times and are used in at least 4 different songs
    - The filtered DataFrame has 12,025 columns
  - Save the DataFrames as lyric_TF.csv and filtered_lyric_TF.csv
  
### Summary
- clean_spotify_data.ipynb creates song_genres.csv which contains artist, genre, and audio feature information for 14,212 songs
- clean_lyricsgenius_data.ipynb creates song_lyrics which also contains lyrics and non alphabetic word counts
- PySpark_NLP.ipynb creates nlp_df.csv which also contains category ids, filtered lyrics and languages
- term_frequencies.ipynb creates lyric_TF.csv and filtered_lyric_TF.csv which contain term frequencies for 8,014 songs

- top_cooccurring_words.ipynb
  - Create a list of co-occurring words
    - There were 485,774 unique co-occuring words found
  - Create a DataFrame of with the most common co-occurring words and their frequencies
    - This DataFrame has 130 columns 

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
