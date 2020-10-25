import csv

with open('user-Followers.csv', 'a') as file:
    writer = csv.writer(file, delimiter = '\t')
    writer.writerow(['U', '433'])
