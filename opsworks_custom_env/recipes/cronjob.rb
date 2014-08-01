tasks = [
	{:name => 'clean:unconfirmed_documents', :hour => '6', :minute => '0'},
	{:name => 'reminders:send_document_deadlines', :hour => '6', :minute => '30'},
	{:name => 'reminders:send_discovery_end_date', :hour => '7', :minute => '0'},
	{:name => 'reminders:scheduled_events', :hour => '7', :minute => '30'},
	{:name => 'reminders:pending_invitation', :hour => '8', :minute => '00'},
]

tasks.each do |a_task|
	cron a_task[:name] do
	  hour a_task[:hour]
	  minute a_task[:minute]
	  weekday "*"
	  command "cd /srv/www/lawvault/current && bundle exec rake #{a_task[:name]} RAILS_ENV=production"
	end
end
