Feature: Merge Articles
  As a blog administrator
  so that similar articles can be read easily
  I want to merge two similar articles into one

Background:
  Given the blog is set up
  And the following users exist:
    | login      | password  | email              | name           | profile_id |
    | non_admin  | non_admin | non_admin@blog.com | Blog Publisher | 2          |
    | testadmin  | admin     | admin@blog.com     | Blog Admin     | 1          |
  And the following articles exist:
    | title         | author        | body            | published |
    | A first post  | First Author  | the first text  | true      |
    | A second post | Second Author | the second text | true      |

@javascript  @current
Scenario: An admin-user can merge articles into one
Given I am logged into the admin panel as "testadmin" with a password "admin"
And I visit the the edit page for "A first post"
Then I should see "Merge Articles"

Scenario: A non-admin cannot see the option to merge articles
Given I am logged into the admin panel as "non_admin" with a password "non_admin"
And I visit the the edit page for "A first post"
Then I should not see "Merge Articles"

Scenario: Merged article should contain text of both articles
Given I am logged into the admin panel as "admin"
And I visit the the edit page for "A first post"
And I attempt to merge with "A second post"
And I revisit the the edit page for "A first post"
Then I should see "the second text"
