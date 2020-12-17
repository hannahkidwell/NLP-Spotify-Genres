# Machine Learning Model Overview

## Which model did you chose and why?
- I chose to use a random forest model because they:
  - Allow for feature ranking, which we can use in order to eliminate features that have little impact on the output of our model
  - Run efficiently on large datasets
  - Are robust to outliers

## How are you training your model?
- Split the data into testing and training sets
- Scale the input data
- Fit the classifier with the training data

## What is the model’s accuracy?
- The model’s accuracy is 16%

## How does the model work?
- Samples the data and builds several decision trees from a random subset of features
- Makes predictions using the testing data

## What is the input and output data of your model?
- The input data of our model are song lyrics that were pulled from the LyricsGenius python client for the Genius.com API and have been put through a natural language processing pipeline. 
- The output data of our model is the category/genre of the song.

## What are other possible models that could be used?
- Neural network model
- K-means algorithm







