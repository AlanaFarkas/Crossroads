* MVP Planning *

As a user:
-You can input your address, and up to two other addresses of your friends
-You can find geographic midpoint between yourself and up to two other people
-You can select the type of establishment to find
-You can select the search radius around the midway point
-You can set limit to how many places are returned
-You can sort by multiple options, ex: good for groups, open late, takes credit cards, etc.
-You can have the ability to use google for directions
-You can log in through Yelp or Google, or create an account 
-You can 'favorite' places, tied to your crossroads account

Team Workflow:
-Push every hour
-Standup every hour
-Make many feature branches with clear names
-Commit often with clear, concise commit messages
-Take breaks, don't burnout!

**Stretch Goals**
-Utilize google calendar to invite friends to the agreed upon place
-Worldwide capability!
-IP Address location finder implementation 
-TEST TEST TEST

Main color? #9BDBE9
Google circle marker
Google info window
Open info window when you click on marker
Type of map choice for user

OOJS BREAKDOWN
-User inputs 3 addresses
-User inputs the type of establishment
-User inputs the desired radius around which to search for establishments
-Google plots the 3 addresses
-Google finds the geographic (or route?) midpoint between 3 addresses
-Map show page displays a marker at the midpoint
-Map show page displays a circle around the midpoint representing the radius
-Inside the circle, Yelp API pulls 5 options (by default, could be top rated) within the radius
-User can filter results using Yelp API
-Each establishment has a marker with Yelp information
-Marker has a link to 'email your friends' with that selection

Favorites
-A user can select favorite places that are saved to their account
-A user has a favorites page where favorites are listed 




