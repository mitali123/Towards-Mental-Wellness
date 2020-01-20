import tweepy
from textblob import TextBlob
import numpy as np
import re
import pandas as pd
from IPython.display import display
from nltk.tokenize import word_tokenize
from nltk.tag import pos_tag
from nltk.stem import PorterStemmer
from nltk.corpus import wordnet as wn
import json

consumer_key = "P6CXZBhB5L3Ovd9bHLe7OXtOv"
consumer_secret = "GvbM0aCmygMvrRl7BGMAhpTfKmAwnCjGfSdG4b6hjysGns7luG"
access_token = "1185263029589565440-rMPxvkgdqNOBMBd7BHsrpHHbtkUXAS"
access_token_secret = "jvUXmWfQ1LH8IQ5LQCoU4RneWOUTGeBqnHuazk1HxqVKk"

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth, wait_on_rate_limit=True)

#Little interest or pleasure in doing things
Question1 = ['dispassionateness', 'boredom', 'Hopelessness', 'detachment', 'aloof', 'loneliness', 'disconnection',
             'pulling off' , 'unexcited', 'featureless', 'uninteresting', 'spiritless', 'monotonous', 'tedious', 'ordinary', 'mundane', 
            'mind numbing', 'flat', 'bland', 'lame', 'tiresome'] 

#Feeling down, depressed, or hopeless
Question2 = ['unhappy', 'down', 'feeling low', 'crying',' low spirited', 'upset', 'worried', 'stressed', 'disappointed',
            'discouraged', 'disheartened', 'Terrified', 'Panic',  'Inability', 'Defeated', 'gloomy', 'glum', 
            'low', 'moody', 'blue' ,'heartsore', 'miserable', 'unemotional']

#Trouble falling or staying asleep, or sleeping too much
Question3 = ['Hypersomnia', 'Insomnia','sleepless', 'oversleeping', 'restlessness', 'disturbed', 'wide awake', 'wakeful', 
            'watchful', 'anxious', 'unsettled', 'uncomfortable'] 

#Feeling tired or having little energy
Question4 = ['Fatigue', 'tiredness', 'exhausted', 'inactivity', 'dull', 'low energy', 'slowness', 'lethargic',
             'inaction', 'drowsiness', 'idleness','inertia', 'lifelessness', 'apathy' ] 

 # Poor appetite or overeating
Question5 = ['always hungry', 'undereating','starving','deprived of food', 'binge-eat', 'stuffed']

#Feeling bad about yourself 
Question6 = ['sad','unworthy', 'flawed', 'defective', 'self-pity', 'sorrowful', 'low-spirited',
             'luck-less', 'failure', 'shameful', 'inconsistent', 'out of place', 'degrading', 'unsuitable', 'unfitting', 'improper', 
            'out of character', 'undeserving', 'born looser', 'non achiever', 'under achiever', 'flop', 'short fall', 'no body', 
            ] 

#Trouble concentrating on things
Question7 = ['unfocused', 'distracted','preoccupied', 'diverted','inattentive','vague','absorbed','engrossed', 'day dream', 'thoughtless' ] 

#Moving or speaking so slowly 
Question8 = ['restless','restive','on edge','uneasy', 'ill at ease','nervous', 'worried', 'unsettled', 'self-conscious',
             'disturbed', 'troubled', 'broken', 'twitchy', 'still', 'unmoving', 'immobile', 'motionless', 'static', 'stationary', 
             ] 
#Thoughts that you would be better off dead
Question9 = ['self-murder', 'suicide', 'death', 'kill' ]

porter = PorterStemmer()

pd.set_option('display.max_rows', 500)
pd.set_option('display.max_columns', 500)
pd.set_option('display.width', 1000)

def stemSentence(sentence):
    token_words = word_tokenize(sentence)
    stem_sentence = []
    for word in token_words:
        stem_sentence.append(word)
        stem_sentence.append(" ")
    return "".join(stem_sentence)

tweets = api.user_timeline(screen_name = 'bumbum00308642', count = 200, 
include_rts = False,
tweet_mode = 'extended')

print(tweets)

for info in tweets[:1]:
    print("ID:{}".format(info.id))
    print("Created at: {}".format(info.created_at))
    print("Text: {}".format(info.full_text))
    print("Screen Name: {}".format(info.user.screen_name))
    print("User Name: {}".format(info.user.name))
    print("Location: {}".format(info.user.location))
    #print("Replies :{}".format(info.in_reply_to_status_id_str))
    print("\n")

data = pd.DataFrame(data=[info.full_text for info in tweets],columns=['Tweets'])
data['Length'] = np.array([len(info.full_text) for info in tweets])
data['ID'] = np.array([info.id for info in tweets])
data['Date'] = np.array([info.created_at.date() for info in tweets])
data['Screen Name'] = np.array([info.user.screen_name for info in tweets])
data['User Name'] = np.array([info.user.name for info in tweets])
data['Location'] = np.array([info.user.location for info in tweets])

data.head(5)

def clean_tweet(info):
    tweet = info.lower()
    tweet = re.sub('[\s]+', ' ', info)  # remove white spaces
    tweet = info.strip('\'"')
    
    return ' '.join(re.sub("(@[A-Za-z0-9]+)|([^0-9A-Za-z \t])|(\w+:\/\/\S+)", " ", tweet).split())  # regex

def sentiment(info):
    analysis = TextBlob(clean_tweet(info))
    if analysis.sentiment.polarity > 0:
        return 1
    elif analysis.sentiment.polarity == 0:
        return 0
    else:
        return -1

# Depression Feature for Question1
def depressionFeature1(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question1 if (ele in feature)] 
    if len(res):
        return 1
    else:
        return 0

# Depression Feature for Question2
def depressionFeature2(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question2 if (ele in feature)] 
    if len(res):
        return 1
    else:
        return 0

# Depression Feature for Question3
def depressionFeature3(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question3 if (ele in feature)] 
    if len(res):
        return 1
    else:
        return 0

# Depression Feature for Question4
def depressionFeature4(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question4 if (ele in feature)] 
    if len(res):
        return 1
    else:
        return 0

# Depression Feature for Question5
def depressionFeature5(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question5 if (ele in feature)] 
    if len(res):
        return 1
    else:
        return 0

def depressionFeature6(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question6 if (ele in feature)] #9 df1
    if len(res):
        return 1
    else:
        return 0

def depressionFeature7(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question7 if (ele in feature)] #9 df1
    if len(res):
        return 1
    else:
        return 0

def depressionFeature8(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question8 if (ele in feature)] #9 df1
    if len(res):
        return 1
    else:
        return 0

def depressionFeature9(info):
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    feature = stemSentence(temp_tweet)
    res = [ele for ele in Question9 if (ele in feature)] #9 df1
    if len(res):
        return 1
    else:
        return 0

def firstperson(info): #need to ask
    temp_tweet = re.sub('[^a-zA-Z.\d\s]', '', info)
    words = word_tokenize(temp_tweet)
    prp = 0
    for word in words:
        word_pos = pos_tag([word])
        if word_pos[0][1] == 'PRP':
            prp = 1
            break
    return prp

data['SA'] = np.array([sentiment(info) for info in data['Tweets']])
data['DF1'] = np.array([depressionFeature1(info) for info in data['Tweets']])
data['DF2'] = np.array([depressionFeature2(info) for info in data['Tweets']])
data['DF3'] = np.array([depressionFeature3(info) for info in data['Tweets']])
data['DF4'] = np.array([depressionFeature4(info) for info in data['Tweets']])
data['DF5'] = np.array([depressionFeature5(info) for info in data['Tweets']])
data['DF6'] = np.array([depressionFeature6(info) for info in data['Tweets']])
data['DF7'] = np.array([depressionFeature7(info) for info in data['Tweets']])
data['DF8'] = np.array([depressionFeature8(info) for info in data['Tweets']])
data['DF9'] = np.array([depressionFeature9(info) for info in data['Tweets']])

data.head(10)

df = data.drop(['Length','ID','Location'], axis=1)
df.head(10)

newdf = df.groupby(['Date'])['DF1','DF2','DF3','DF4','DF5','DF6','DF7','DF8','DF9','SA'].sum().reset_index()
print(type(newdf))
print(newdf)

newdf['Date']= pd.to_datetime(newdf['Date'])
newdf['Date'].dt

cleaned_dataframe= newdf[(newdf['Date'] >= '2019-11-23 00:00:00') & (newdf['Date'] <= '2019-11-29 00:00:00')] 
print(cleaned_dataframe)

drop_date_df = cleaned_dataframe.drop(['Date'], axis=1)
drop_date_df.head(10)

def is_masked(x):
    if x > 0:
        return 1
    else:
        return 0

drop_date_df ['DF1'] = drop_date_df ['DF1'].apply(is_masked)
drop_date_df ['DF2'] = drop_date_df ['DF2'].apply(is_masked)
drop_date_df ['DF3'] = drop_date_df ['DF3'].apply(is_masked)
drop_date_df ['DF4'] = drop_date_df ['DF4'].apply(is_masked)
drop_date_df ['DF5'] = drop_date_df ['DF5'].apply(is_masked)
drop_date_df ['DF6'] = drop_date_df ['DF6'].apply(is_masked)
drop_date_df ['DF7'] = drop_date_df ['DF7'].apply(is_masked)
drop_date_df ['DF8'] = drop_date_df ['DF8'].apply(is_masked)
drop_date_df ['DF9'] = drop_date_df ['DF1'].apply(is_masked)

#df['PP'] = df['PP'].apply(is_masked)
#drop_date_df ['SA'] = drop_date_df ['SA'].apply(is_masked)

drop_date_df.head(10)

drop_sa_df = drop_date_df.drop(['SA'], axis=1)
DFsum= drop_sa_df.sum(axis=0)
print("DepressionFeature sum:",DFsum )
print("\t")

def is_DFmasked(x):
    if x == 4:
        return 3
    elif x ==3:
        return 2
    elif x == 2:
        return 1
    else:
        return 0
    
DFmasked= DFsum.apply(is_DFmasked)
print("DF masked :")
print( DFmasked)
DFsumof27=DFmasked.sum(axis=0)
print("\n")
print("PHQ-9 sum is :", DFsumof27)
