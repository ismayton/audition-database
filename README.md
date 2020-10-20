# README

This database provides a tool for auditioning musicians who need a simple interface for browsing and comparing current audition excerpt lists with similar current and past lists. In addition to a simple browsing interface organized by instrument type, the database allows registered users to collect frequently referenced lists into a collection that is easy to view.

After cloning, be sure to run `bundle install`. 

* Ruby version 2.6.1

* Rails version 6.0.3

## Database Creation

To create the database, run `rake db:migrate`.

## Database Initialization

To populate the database with Orchestras, Instruments, and Positions, run `rake db:seed`. The seed file includes seeds for all ICSOM orchestras and the most common orchestra positions. For combined positions and european position naming conventions, more positions may need to be created in the app.

## Adding Lists to the Database

After creating an admin profile using the Signup form, the simplest process to creeate a list is;

1. create Composers and Pieces for the list
2. create a List, selecting an Orchestra and Position for the list in addition to entering the date of the audition
3. create Excerpts from the List show page, selecting the appropriate piece from the collection_select form, automatically associating the excerpts with both List and existing library.
