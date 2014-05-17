Writings
========

![codeship](https://www.codeship.io/projects/de1abb60-c02b-0131-4d22-1a54e49bcc8d/status)
[![Coverage Status](https://coveralls.io/repos/Lowest0ne/writings/badge.png)](https://coveralls.io/r/Lowest0ne/writings)

This application allows for the creation of book like collections.  Each book
contains entries, which may be letters, poems, stories, or some other type of writing.
Entries can also be put into categories.

The application allows for an admin to add/remove/edit these constructs, while
others can only view.

Usage
=====

The Admin 'sign_up' route does not exist ( the app uses devise ).
This is to prevent others from changing your work.
Admin will have to be created via command line.

As of now, all Admin are considered equal, so take care of who you give access.

As a logged in Admin, you will see links to modifiy the constructs
