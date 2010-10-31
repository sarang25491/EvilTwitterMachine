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
	page = agent.get('https://mobile.twitter.com/session/new')
	form = page.form_with(:action => 'https://mobile.twitter.com/session')

        form.username = usern
        form.password = passwd

	timeline = form.submit # And we return the (possible) timeline
end
