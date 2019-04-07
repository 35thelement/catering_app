# Catering App: Tangerine

## Team Members
- Ben Romine
- Brenna Sorkin
- Cara Sciorilli
- Jacob Piersall

## Deployed App URL:
http://tangerine.the-real-ice-man.website

## App GitHub Repository:
https://github.com/35thelement/catering_app

## App Status:
- Deployed: **YES**
- Working: **YES**

## Individual Work
### Ben:
- Initial Setup
- Data Modeling & Reconfiguration
- Permission Management
- User Passwords & Sessions
- Window-In-Window Rendering of API Request Results
- Various Fixes

### Brenna:
- Initial Concept
- Workflow Design
- Branding & Naming
- UX/UI Design
- Bootstrap Addition
- Various Fixes

### Cara:
- Live Updates for Lists of Caterers
- Live Updates for Menu Editing
- Channel Management
- Workflow Implementation
- Presentation Setup
- Various Fixes

### Jacob:
- API Request with HTTPoison
- Rendering API Request Results
- API Key Management
- Recipe Image Display
- Release Engineer
- Various Fixes

## What is Tangerine?
Tangerine is a web application for individuals to schedule events
along with various caterers. This app supports three types of users:
Clients, Caterers, and Admins. All users have associated passwords and
can log in and out of our app. Clients are individuals who wish to
host events that will have food provided by caterers. They can create
events, and can choose the day of the event, the caterer of the event,
and whether or not the event is approved and finalized. Each of these
events has a menu. Clients can indicate their preferences for what
dishes they would like to appear on the menu, and can provide feedback
about the dishes that caterers present. Caterers are upscale food
providers who will be chosen for events by clients and can choose the
dishes that will be on a menu for an event. Caterers can view a list
of potential recipes that are based on the client's preferences. This
list is retrieved from the Food2Fork API using HTTPoison to perform
purely server to server API requests. From this list, the caterer can
choose five dishes that will be served. They can also view client
feedback about the dishes that they propose and can edit their list of
dishes accordingly. All users, events, and menus are stored in a
PostgreSQL database. All edits to the menu and user feedback are live.
Also, new additions to the list of caterers that is available on the
website are added in real-time. In addition, for caterers, viewing the
list of potential recipes is done in a frame that allows caterers to
view said list of recipes without leaving the page, but it does not
create a new API request with each page load. New API requests are
created only when a caterer chooses to search for recipes. Admins are
able to view, edit, and delete all events and users. To manage all of
these different roles, different parts of the UI were loaded depending
on what type of user is currently logged in. In addition, certain
actions are only available to certain users. The permission management
was likely one of the most complex features of our application, along
with the recipe API request creation and rendering. Due to the fact
that our API key is only allotted a certain number of requests per day
because we chose to use a free key, we needed to create a method of
performing API requests and rendering the data from these requests
such that they only occurred whenever they were necessary. To do this,
we created a link that would create an iframe tag inside a part of the
page used to edit a menu, which would render the page that performed
the API requests. This way, we would not perform an API request every
time we opened the page to edit a menu. One of the most significant
challenges that we encountered during the creation of our app was
determining how certain variables were going to be accessed by certain
actions. For example, originally our design had set the 'preferences'
as a field of an event, rather than as a field of a menu. Sometimes,
we needed to completely change our data model from the ground-up.
While this was an arduous task at times, as it required a rather
extensive rework, we were able to address it, and determine other
changes that needed to be made to the data model to prevent further
drastic changes.
