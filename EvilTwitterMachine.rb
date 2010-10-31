#!/usr/bin/env ruby

#################################################################
#			EvilTwitterMachine			#
#								#	
#			author: IanMalcolm			#
#								#
#	Parses a list of logins and passwords and uses them as	#
#	a botnet of sorts.					#
#								#
#	Requirements:	ruby > 1.9.1				#
#			mechanize gem				#
#								#
#	Command Line Parameters:				#
#			-f <FILE>	-- login list		#
#			-a <ATTACK>	-- attack		#
#								#
#	Place new attacks in the "attacks" folder.		#
#	---> The attack must have a function with the same	#
#	---> name as the file and expect a mechanize obj.	#
#################################################################

#########################
#	ENTRY POINT	#
#########################

require 'rubygems'
require 'mechanize'

require './common/login'
require './common/logout'
require './common/attackparser'

#########################
# PARSER: getUsern	#
#########################

def getUsern(line)
	line.split(' ')[0]
end

#########################
# PARSER: getPasswd	#
#########################

def getPasswd(line)
	line.split(' ')[1]
end

# Let's parse the login list
#################################
# TODO: parse any file.		#
# (For now, we are hardcoding	#
#################################

#################################
# For test purposes, let's just #
# try to log in for now.	#
# attacks/dummie should run and #
# report sucesses/failures	#
#################################

File.open("loginlist", "r").each do |line|
	usern  = getUsern(line)
	passwd = getPasswd(line)
	timeline = login(usern, passwd)
	runPlugin("dummie", timeline)
	logout
end


