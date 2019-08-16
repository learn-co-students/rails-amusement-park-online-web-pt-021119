Feature Test: User Signup
  successfully signs up as non-admin (FAILED - 1)
  on sign up, successfully adds a session hash (FAILED - 2)
  successfully logs in as non-admin (FAILED - 3)
  on log in, successfully adds a session hash (FAILED - 4)
  prevents user from viewing user show page and redirects to home page if not logged in (FAILED - 5)
  successfully signs up as admin (FAILED - 6)
  on sign up for admin, successfully adds a session hash (FAILED - 7)
  successfully logs in as admin (FAILED - 8)
  on log in, successfully adds a session hash to admins (FAILED - 9)

Feature Test: User Signout
  has a link to log out from the users/show page (FAILED - 10)
  redirects to home page after logging out (FAILED - 11)
  successfully destroys session hash when 'Log Out' is clicked (FAILED - 12)
  has a link to log out from the users/show page when user is an admin (FAILED - 13)
  redirects to home page after admin logs out when user is an admin (FAILED - 14)
  successfully destroys session hash when 'Log Out' is clicked as admin (FAILED - 15)

Feature Test: Go on a Ride
  has a link from the user show page to the attractions index page (FAILED - 16)
  links from the user show page to the attractions index page (FAILED - 17)
  prevents users from editing/deleting/adding rides on the index page (FAILED - 18)
  has titles of the rides on the attractions index page (FAILED - 19)
  has links on the attractions index page to the attractions' show pages (FAILED - 20)
  links from the attractions index page to the attractions' show pages (FAILED - 21)
  prevents users from editing/deleting a ride on the show page (FAILED - 22)
  has a button from the attraction show page to go on the ride (FAILED - 23)
  clicking on 'Go on ride' redirects to user show page (FAILED - 24)
  clicking on 'Go on ride' updates the users ticket number (FAILED - 25)
  clicking on 'Go on ride' updates the users mood (FAILED - 26)
  when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message (FAILED - 27)
  when the user is too short, clicking on 'Go on ride' displays a sorry message (FAILED - 28)
  when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message (FAILED - 29)
  when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message (FAILED - 30)

Feature Test: Admin Flow
  displays admin when logged in as an admin on user show page (FAILED - 31)
  links to the attractions from the users show page when logged in as a admin (FAILED - 32)
  has a link from the user show page to the attractions index page when in admin mode (FAILED - 33)
  allows admins to add an attraction from the index page (FAILED - 34)
  allows admins to add an attraction (FAILED - 35)
  has link to attraction/show from attraction/index page for admins (FAILED - 36)
  does not suggest that admins go on a ride (FAILED - 37)
  links to attractions/show page from attractions/index (FAILED - 38)
  does not suggest that an admin go on a ride from attractions/show page (FAILED - 39)
  has a link for admin to edit attraction from the attractions/show page (FAILED - 40)
  links to attraction/edit page from attraction/show page when logged in as an admin (FAILED - 41)
  updates an attraction when an admin edits it (FAILED - 42)

Attraction
  * is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
  * has many rides
  * has many users through rides

Ride
  * is valid with a user_id and a attraction_id
  * belongs to one attraction
  * belongs to one user
  has a method 'take_ride' that accounts for the user not having enough tickets (FAILED - 43)
  has a method 'take_ride' that accounts for the user not being tall enough (FAILED - 44)
  has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets (FAILED - 45)
  has a method 'take_ride' that updates ticket number (FAILED - 46)
  has a method 'take_ride' that updates the user's nausea (FAILED - 47)
  has a method 'take_ride' that updates the user's happiness (FAILED - 48)

User
  * is valid with a name, password, happiness, nausea, height, and tickets
  * is not valid without a password
  * is valid with an admin boolean
  * defaults to admin => false
  * has many rides
  * has many attractions through rides
  has a method 'mood' that returns 'sad' when the user is more nauseous than happy (FAILED - 49)
  has a method 'mood' that returns 'happy' when the user is more happy than nauseous (FAILED - 50)
