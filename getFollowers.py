import tweepy
import csv

auth = tweepy.OAuthHandler("", "")
auth.set_access_token("", "")

api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True)

with open('Followers.csv', 'a') as file:
    writer = csv.writer(file, delimiter = '\t')
    writer.writerow(['USER', 'FOLLOWERS'])
    for follower in tweepy.Cursor(api.followers, screen_name='weiglemc').items():
        writer.writerow([follower.screen_name, follower.followers_count])
