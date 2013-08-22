Feature: Merge Blogs
	As an Administrator
	In order to prevent duplicating previous articles
	I want to merge an article with the same content

	Background: users and articles already exists
		Given the following users exist:
		|login		|password		|email				|profile_id	|name		|state		|	
		|user1		|1234567		|user1@gabe.com		|2			|User1   	|active		|
		|user2		|1234567		|user2@gabe.com		|2			|User2      |active		|

		Given the following articles exist:
		|title		|author		|body			|created_at			|user_id|state		|	
		|Second		|user1		|second post	|2013-08-22 00:00:00|2	   	|published	|
		|Third		|user2		|third post		|2013-08-22 00:00:03|3      |published	|

		

	Scenario: Merge Article Form Shown for Admin
		Given the blog is set up
		And I am logged into the admin panel
		When I follow "All Articles"
		Then I should see "Manage articles"
		When I follow "Edit" on article "1"
		Then I should see "Merge Articles"

	Scenario: Merge Article form should not show if it is not admin
		Given the blog is set up
		And I am logged in as "user1" with password "1234567"
		When I follow "All Articles"
		Then I should see "Manage articles"
		When I follow "edit" on article "4"
		Then I should not see "Merge Articles"
