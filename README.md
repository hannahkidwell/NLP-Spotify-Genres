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
  - Create a list of co-occurring words
    - There were 485,774 unique co-occuring words found
  - Create a DataFrame of with the most common co-occurring words and their frequencies
    - This DataFrame has 130 columns
    - The total run time to create the DataFrame was about 1.5 hours
  - Save DataFrame as top_cooccurring_TF.csv

- Next, I created the term_frequencies.ipynb file which does the following:
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

- Lastly, I created the cooccurring_term_frequencies.ipynb file which does the following:
  - Add columns of co-occurring words
    - Filling in the co-occurring term frequencies took 119 seconds
  - Save DataFrame as cooccurring_TF.csv
  - Create and save a filtered DataFrame as filtered_cooccurring_TF.csv
  
### Summary
- clean_spotify_data.ipynb creates song_genres.csv which contains artist, genre, and audio feature information for 14,212 songs
- clean_lyricsgenius_data.ipynb creates song_lyrics which also contains lyrics and non alphabetic word counts
- PySpark_NLP.ipynb creates nlp_df.csv which also contains category ids, filtered lyrics and languages, and top_cooccurring_TF.csv which contains the top co-occurring words and their frequencies
- term_frequencies.ipynb creates lyric_TF.csv and filtered_lyric_TF.csv which contain term frequencies for 8,014 songs
- cooccurring_term_frequencies.ipynb creates cooccurring_TF.csv and filtered_cooccurring_TF.csv which contain 

## Desciption of preliminary data analysis
- The top_words.ipynb file creates a DataFrame of the top ten words for each genre
  - From the total 140 top ten words from each of the 14 genres, 29 were unique
  - 7 out of all the top ten words for each genre are unique to one genre
    - 'cant' is unique to the top words in the metal genre
    - 'let' is unique to the top words in the jazz genre
    - The n-word is unique to the hiphop genre
    - 'man' and 'well' are unique to the blues genre
    - 'see' is unique to the top words in the metal genre
    - 'ill' is unique to the top words in the romance genre
  - 6 out of all the top ten words for each genre are unique to two genre
    - 'go' is unique to the top words in the punk and rock genres
    - 'aint' is unique to the top words in the country and hiphop genres
    - 'come' is unique to the top words in the classical and jazz genres
    - 'ooh' is unique to the top words in the indie-alt and pop genres
    - 'one' isunique to the top words in the classical and metal genres
    - 'never' is unique to the top words in the metal and punk genres
  - '?', 'dont', and 'im' are in the top ten words for every genre
    - 'know' is in the top ten words for every genre except funk
    - 'like' and 'love are in the top ten words for 11 out of 14 genres
- The top_cooccurring_words.ipynb file creates a DataFrame of the top ten co-occurring words for each genre
  - From the total 140 top ten co-occurring words from each of the 14 genres, 53 were unique
  - 18 of the top ten co-occurring words were not unique to a genre
  - 35 of the top ten co-occurring words are unique to one genre
  - 4 of the top ten co-occurring words are unique to two genre
      - 'get get' is unique to the top co-occurring words in the funk and jazz genres
      - 'dont want' is unique to the top co-occurring words in the blues and romance genres
      - 'doo doo' is unique to the top co-occurring words in the indie_alt and rock genres
      - 'da da' is unique to the top co-occurring words in the metal and rock genres
  - 'dont know' is in the top ten co-occurring words for every genre except funk
  - 'oh oh' is in the top ten co-occurring words for every genre except blues and pop
  - 'yeah yeah' is in the top ten co-occurring words for 11 out of the 14 genres
- The genre_by_word_count.ipynb file creates DataFrames of word count distributions for each genre
  - The hiphop genre had the highest mean word count and the highest mean unique word count
  - The blues genre has the lowest mean word count and the lowest mean unique word count
  - The song with the highest word count is in the hiphop category and the song with the highest unique word count is in the romance category
  - The song with the lowest word count is in the rock category
  - The indie-alt genre had the most songs with the minimum unique word count
- The popularity_by_word_count.ipynb file creates DataFrames of word count distributions for each quartile of the songs by popularity
  - The songs with the lowest 25% popularities have the lowest mean word count and the lowest mean unique word count
  - The songs in the second quartile of popularity have a mean word count of 164 words
  - The songs in the third quartile of popularity have a mean word count of 191 words
  - The songs with the highest 25% popularities ahve the highest mean word count fo 206 words
  - The song with the highest word count has a popularity of 64
  - The song with the highest unique word count has a popularity of 61
  - The song with the lowest word count has a popularity of 25
  - The average popularity of the songs with the minimum unique word is 36

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
