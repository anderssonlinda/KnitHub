![KnitHub start page](https://imgur.com/0LwELAc)

# KnitHub
A web app to browse knitting patterns, save patterns and upload your own projects where you’ve applied the pattern. 
## Development
### Technologies used:
- HTML
- CSS
- JavaScript
- Ruby
- SQL
- Postgres
- Bcrypt
- Sinatra

### Planning
I wrote down the basic version of the app and features I could add on if I had time and made some rough mockups to get an idea of how I wanted the layout to be. I planned out what tables and columns I needed in the database.
Developing stage
### Problems
#### Fixed problems
- How to favourite patterns,
I added a column for the user table in the database to track which patterns had been saved. The unique ids of the saved patterns are saved as a string that is then tuned into an array when the values need to be accessed or modified.  
- Highlight the current page in the navigation
To show which part of the website the user is currently in, I used javaScript to change the styling of the corresponding navigation element to the current url. Using a heavier font weight makes the element bigger and causes the layout to shift. I used css grid and made sure each navigation link had enough room for the text to expand as necessary. 
- Image preview
Because KnitHub is using urls to upload images I wanted the user to be able to see what they are linking to before uploading or changing an existing url. I used javaScript to grab the user input and inserted it as a source for an image tag and that way the image is displayed to the user before the user chooses to submit. 
 
#### Problems to solve
- Make diagram consistent and a diagram reading key 
The current pattern diagrams need to be changed so they are all consistent in size, use the same symbols etc in order to improve consistent layout and readability for the user. 
- Check that every user is unique and display error message 
When a user signs up to the web page I wanted to check that the username is unique before the user submits the form. I used a combination of javaScript and embedded Ruby to display an error message if the username is already taken. Unfortunately this means that all the usernames are displayed in the source code so I need to add an api so I can use only javaScript to check the usernames instead. 
### Lessons
Being the first time I used a database I’m really glad I planned out what tables and values I needed in the very early stages of the planning. It made working with them very easy. 

It was really useful to clearly plan what I wanted included in the basic version of the app to make sure I was getting it done in a timely manner. For my next project I will articulate better what additional features to add when the basic version is finished, because with a clearer progression plan the work flow is much more efficient. 
 
