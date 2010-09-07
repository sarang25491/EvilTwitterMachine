#################################################
#	login.rb - login related functions.	#
#						#
#	public methods: login(usern, passwd)	#
#						#
#################################################

require 'rubygems'
require 'mechanize'

def login(usern, passwd)
	agent = Mechanize.new
	page = agent.get('http://twitter.com/')
	form = page.form_with(:action => 'https://twitter.com/sessions')

	# Our form's fields' names are session[username_or_email]
	# And session[password]. How do we access them?
	#
	# form['session[username_or_email]'] is the answer!

	form['session[username_or_email]'] = usern
	form['session[password]'] = passwd

	timeline = form.submit # And we return the (possible) timeline
end
