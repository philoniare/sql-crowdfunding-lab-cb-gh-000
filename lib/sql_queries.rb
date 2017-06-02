# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.










def selects_the_titles_of_all_projects_and_their_pledge_amounts
"SELECT projects.title, sum(pledges.amount) FROM projects, pledges WHERE projects.id=pledges.project_id GROUP BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
"SELECT users.name, users.age, sum(pledges.amount) FROM users, pledges WHERE pledges.user_id=users.id GROUP BY users.name, users.age;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT projects.title, total_pledges.total_pledge-projects.funding_goal FROM projects INNER JOIN (SELECT sum(pledges.amount) AS total_pledge, pledges.project_id FROM pledges GROUP BY pledges.project_id)
AS total_pledges on total_pledges.project_id=projects.id WHERE total_pledges.total_pledge >= projects.funding_goal;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
"SELECT users.name, total_pledge FROM users INNER JOIN (SELECT user_id, sum(amount) as total_pledge FROM pledges GROUP BY user_id) AS agg_pledgers ON agg_pledgers.user_id=users.id ORDER BY total_pledge, users.name;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT projects.category, pledges.amount FROM projects INNER JOIN pledges ON project_id=projects.id WHERE category='music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
"SELECT category, SUM(pledges.amount) FROM projects INNER JOIN pledges ON project_id=projects.id WHERE category='books' GROUP BY category;"
end
