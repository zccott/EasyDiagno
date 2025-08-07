#import necessary libraries
#import necessary libraries
import pandas as pd



import string
import nltk
from nltk.corpus import stopwords


from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, classification_report

from sklearn.neighbors import KNeighborsClassifier


df = pd.read_csv("C:/Users/Athul Ramesh N R/PycharmProjects/Easydiagno/src/Symptom2Disease.csv")
df.drop("Unnamed: 0",inplace=True,axis=1)
df
df.info()
df.isnull().sum()



def clean_text(sent):
    # remove punctuations
    sent = sent.translate(str.maketrans('', '', string.punctuation)).strip()

    # remove stopwords
    stop_words = set(stopwords.words('english'))
    words = nltk.word_tokenize(sent)
    words = [word for word in words if word not in stop_words]

    return " ".join(words).lower()
# apply clean_text on text column of df
df["text"] = df["text"].apply(clean_text)


X_train, X_test, y_train, y_test = train_test_split(df["text"], df["label"], test_size=0.2, random_state=42)
# use tfidf for text vectorization
tfidf_vectorizer = TfidfVectorizer(max_features=1500)

tfidf_train = tfidf_vectorizer.fit_transform(X_train).toarray()
tfidf_test = tfidf_vectorizer.transform(X_test).toarray()
# knn will be our first model
knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(tfidf_train, y_train)
predictions = knn.predict(tfidf_test)
def report(y_test,predictions):
    """Function to create classification report"""
    accuracy = accuracy_score(y_test, predictions)
    print(f'Accuracy: {accuracy:.2f}')
    print(classification_report(y_test, predictions))
report(y_test,predictions)


def make_pred(model, text):
    """Function to make prediction on single data instance"""
    text = clean_text(text)
    print(text)
    tfidf = tfidf_vectorizer.transform([text]).toarray()

    disease = model.predict(tfidf)
    print("disease",disease[0])
    return disease[0]
# symp1 = "pain behind the eyes and in the joints, muscles and/or bones,severe headache.rash over most of the body."
# res = make_pred(knn, symp1)
# print(res)