# Final Project Outline, Assigned Duties, & Communication Guide

## Link to Google Slides Presentation
Here is the link to the presentation: https://docs.google.com/presentation/d/1nddvQA9pJ1J52MaG6unWViKxsb_lgtQ5arq4Pr88yl0/edit?usp=sharing 

## Link to Assigned Duties
Here is the link to an excel spreadsheet with what each group member worked on: https://drive.google.com/file/d/1yFzIDPxS48h5qYXb1bhgNAEhpdfMf9BK/view?usp=sharing

## Machine Learning Model Overview
### Description of preliminary data preprocessing
- In the first notebook, clean_spotify_data.ipynb, we used the Spotify API to create a DataFrame with artist, genre, and audio feature information for about 14,000 songs
- In the next notebook, clean_lyricsgenius_data.ipynb, we used the Genius API to add a column of lyrics
  - The runtime of looking up the lyrics using the API was about 10 hours
  - Since lyrics were not found for all songs, the updated DataFrame contains about 9,000 songs
    - Before saving the DataFrame, we cleaned the lyrics by removing unnecessary symbols and spaces
- The PySpark_NLP.ipynb filters the data based on 3 new columns and creates a DataFrame of the top co-occurring words
  - A category_id column of encoded genres is added
  - Instrumental songs are removed
  - A column of tokenized lyrics without stop words is added
  - A language column is added
  - Songs with no language found and songs with one language found that is not English are removed
  - The total runtime to create the DataFrame of co-occurring words was about 1.5 hours
- term_frequencies.ipynb was the last step towards creating DataFrames that can be used for the ML model
  - We created a list of all words from the filtered lyrics column
  - After removing non alphabetic words from that list, we then created a new DataFrame with all of the unique words used as columns
  - Filling the DataFrame with term frequencies took about 68 minutes
  - Then we saved the DataFrame and a filtered version of it without columns of words that appeared the least
- cooccurring_term_frequencies.ipynb created two more DataFrames that can be used for the ML model
  - Added frequencies of the top co-occurring words

### Desciption of preliminary data analysis
- The top_words.ipynb file creates a DataFrame of the top ten words for each genre
  - From the total 140 top ten words from each of the 14 genres, 35 were unique
  - 15 out of all the top ten words for each genre are unique to one genre
  - 'im' is in the top ten words for every genre
  - '?', 'dont', and 'know' are in the top ten words for 13 out of 14 genres
- The top_cooccurring_words.ipynb file creates a DataFrame of the top ten co-occurring words for each genre
  - From the total 140 top ten co-occurring words from each of the 14 genres, 43 were unique
  - 25 of the top ten co-occurring words are unique to one genre
  - 'dont know' and 'oh oh' are in the top ten co-occurring words for 13 out of 14 genres
- The genre_by_word_count.ipynb file creates DataFrames of word count distributions for each genre
  - The hiphop genre had the highest mean word count and the highest mean unique word count
  - The blues genre has the lowest mean word count and the lowest mean unique word count
- The popularity_by_word_count.ipynb file creates DataFrames of word count distributions for each quartile of the songs based on popularity
  - The songs with the lowest 25% popularities have the lowest mean word count and the lowest mean unique word count
  - The songs with the highest 25% popularities have the highest mean word count 

### Description of preliminary feature engineering and preliminary feature selection
- All of the DataFrames that we created to use for the ML model have columns of song names, artist names, category name and ids, genres, audio features, and word frequencies
- We defined my features set as the DataFrame after dropping the song names, artist names, category name and ids, and genres so that all the columns are filled with numerical audio features or term frequencies
- We found that the model performed best when using the filtered versions of my DataFrames where we removed the words that appeared the least
- Futhermore, we removed songs that did not have matching categories and genres 

### Description of how data was split into training and testing sets
- The data was split into training and testing sets using the train_test_split method from the sklearn library
- The training set contained the default 75% of the original dataset which was about 6,000 songs
- The testing set containted the other 25% of the orginal dataset which was about 2,000 songs

### Explanation of model choice
- We are using a random forest model because it:
  - Allows for feature ranking, which we can use in order to eliminate features that have little impact on the output of our model
  - Runs efficiently on large datasets
  - Is robust to outliers
- One limitation of this model has been accuractely prediciting similar genres
- We also created a k-means model and a perceptron model, but they performed much worse than the random forest model
  - The k-means model had an accuracy of 22%
  - The perceptron model has an accuracy of 10%

### Description of how the model was trained
- We trained the model using the scaled X training set and the y training set with 500 estimators and a random state of 78
  - The scaled X training set contained the audio features and word stems
  - The y training set contained the category id
- To further train the model, I can pull down more songs from the Spotify and Genius APIs

### How accurate, precise, and sensitive is the model?
- The model's accuracy using the entire dataset is 51.6%
- After filtering the data to only include songs with matching categories and genres, the accuracy increased to 70.7%
- Below is a screenshot of the confusion matrix:

<img src='https://github.com/hannahkidwell/UCB-Final-Project/blob/neele4/confusion_matrix.png' width=800>

- The country genre performed the best with 94% of predeictions being correct
- The soul genre performed the worst with 18% of predictions being correct
- The model's weighted average precision score was 0.70
  - The metal genre had the highest precision of 88%
  - The funk genre had the lowest precision of 46% 
- The model's weighted average recall score was 0.71
  - The country genre had the highest sensitivity of 94%
  - The soul genre had the lowest sensitivity of 18% 
