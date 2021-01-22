# UCB Final Project: Predicting Musical Genres

## Project Outline
- Due to our common interest in music, our group chose the topic of predicting musical genres
- We decided to create a random forest model that predicts a song's genre based on lyrical term frequencies and audio features
- In order to store the data used to run model, we created a SQL database containing everything pulled from the Spotify and Genius APIs
- The results of the analysis are clearly conveyed in the dashboard linked below

## Link to Dashboard
 http://thedashboard.xyz/

## Link to Google Slides Presentation
Here is the link to the presentation: https://docs.google.com/presentation/d/1nddvQA9pJ1J52MaG6unWViKxsb_lgtQ5arq4Pr88yl0/edit?usp=sharing 

## Machine Learning Model Overview
### Description of preliminary data preprocessing
- First we used the Spotify and Genius APIs to create a CSV file filled with song data
- The next step was to filter the songs based on language and clean all of the song lyrics
- Then we created a natural language processing pipeline that tokenized the lyrics and removed stop words
- Lastly we created a DataFrame containing the term frequenices of each song

### Desciption of preliminary data analysis
- Looking at top words and word count distributions by genre and popularity we created DataFrames for the following:
  - Top ten words for each genre
  - Top ten co-occurring words for each genre
  - Word count distributions for each genre
  - Word count distributions for each quartile of songs based on popularity

### Description of preliminary feature engineering and preliminary feature selection
- We defined the features set (X) as the numerical audio features and term frequencies columns
- The target set (y) was the genres of the songs
- We found that the model performed best when using a filtered version of our DataFrame without the words that appeared the least
- Futhermore, we removed songs that did not have matching categories and genres 
We furthermore improved the model's accuracy by removing songs where the artist's genres did not match the song's category

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

## Link to Assigned Duties
Here is the link to an excel spreadsheet with what each group member worked on: https://drive.google.com/file/d/1yFzIDPxS48h5qYXb1bhgNAEhpdfMf9BK/view?usp=sharing

## Communication Log
We have been meeting using Discord and messaging through Slack or Discord to coordinate the projects plans. We will continue to meet Tuesdays, Thursdays, and Sundays given group availabliliy. 
- Meeting 11/20 in class
- Meeting 11/24 in class
- Meeting 12/1 on Zoom
- Meeting 12/3 in class class
- Meeting 12/6 on Discord
- Meeting 12/8 in class
- Meeting 12/10 in class
- Meeting 12/12 on discord
- Meeting 12/15 in class
- Meeting 12/17 in class
- Meeting 12/19 on discord
- Next Meeting 12/22 TENATIVE
