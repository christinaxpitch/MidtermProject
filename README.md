<img align="left" src="/Images/GOATEvents.png" width="825">
<img align="left" src="http://skilldistillery.com/downloads/sd_logo.jpg" height="175">
<br>

##### Douglas Sigmon (Developer, DBA) <br/> Ryan Miskoviak (Developer, Scrum Master)<br/> Aaron Cottrell (Developer, Repo Owner) <br/> Christina Pitch (Developer, Project Manager)
<br><br>
### Overview
G.O.A.T Events will be a virtual food court of sorts for all things group gathering. From music festivals, a downtown poetry slam or your local yoga class. Search and add your favorites to your profile page. Buy tickets or just browse everything G.O.A.T Events has to offer.

 Venues, get your event in front of potential ticket buyers. Market your event or venue's list of upcoming events to users you wouldn't be able to reach. To markets too expansive or expensive to do on your own. Users are on G.O.A.T Events because events and gatherings of any kind can post. Why isn't yours?

### Description

#### Users
Users will be able to browse events posted on the site by subscribing venue members. Guest users will be able to view the main homepage which will display a scroll of new and upcoming events available through G.O.A.T. Events exclusive venue pool. Guest users can also search for venues posting events on G.O.A.T. Events.
<br/>
<img align="left" src="/Images/UserPro.png" width="825">
<br/>
Sign up is absolutely free for the user. G.O.A.T. Events will be powered by a small ticket transaction fee and venue subscription fees for the site. Enabling your free account allows for additional site usage. Primarily, the ability to purchase tickets for the event of your choosing.
<br/> <img align="left" src="/Images/SearchButtons.png" width="825">
<br/>
Other features include favorites lists for venues and events so a user has these at a click upon re-visiting G.O.A.T. Events.

#### Venues
Once a Venue has subscribed to G.O.A.T. Events, they are provided with their own personal management dashboard. A venue may manage their own account or allow for a manager of many locations to add events and manage event details. An account manager will also be able to subscribe additional locations for use of G.O.A.T. Events vast user base. G.O.A.T. Events will keep watch for inappropriate content and reserves the right to remove an event from public view or remove a venue or account manager for repeated violations of site content rules.


<a href="http://3.128.124.196:8080/GoatEvents/home.do">
Link to deployed app</a>


### Implementation
#### 3 Main entities

* Users may have: 1 Address, many venues as an account manager, many favorite venues/events as a guest user and create many comments
* Venues may be managed by 1 user. Have 1 address Be favorited by many guest users. Create and manage many events. Have many amenities specific or general.
* Events are created by 1 venue. May have many comments. Have many Artists or types (genre). Be favorited by many users.

<img src="/DB/ERD.png">

### Technologies and Methodologies Used
* Spring MVC
* JPA
* MySQL Workbench
* HTML/CSS
* Gradle
* Pair Programming
* Git Collaboration
* AWS EC2 Deployment
* JSP
* HttpSession

### Lessons Learned
There were many front end aspects that we as a group really improved upon as the week progressed. Our CSS stylesheets became more advanced and more elegant as the week went along.

Pair programming was essential to completing the process. Not a single one of us would have been able to complete the sprint without help from our other teammates. We leaned on each other and instructors to help us through problems that we were encountering and we were able to overcome all of them to date. Unfortunately, we spent some valuable time debugging that left us with some functionality left to future versions.

We also learned more about console errors and debugging in general. Not being afraid of new errors and quickly recognizing duplicate errors for quick resolution.

We utilized HttpSession for the first time extensively and learning about how to set, recall and reset the session data for use as a user navigates the site was interesting and frustrating all in one.

TEAM CRIMSON GOAT!!!!
