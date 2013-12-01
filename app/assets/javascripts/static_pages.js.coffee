# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


note = $("#note")
timeStamp = (new Date(2014, 0, 4)).getTime()

loadWish = ->
	$("#hidden_text").load("/guests/wish")


invokeTextillate = ->
	$("#wish_box").replaceWith "<div id=\"wish_box\">" + $("#hidden_text").html() + "</div>"
	#$("#hidden_text").replaceWith "<div id=\"hidden_text\"></div>"
	$(".text").textillate
		minDisplayTime: 3000,
		in:
			effect: "bounceIn"
		out:
			effect: "hinge"
	#$("#wish_box").replaceWith "<div id=\"wish_box\"></div>"


$(window).bind "load", ->
	$("#countdown").countdown
	  timestamp: timeStamp
	  callback: (days, hours, minutes, seconds) ->
		message = ""
		message += days + " day" + ((if days is 1 then "" else "s")) + ", "
		message += hours + " hour" + ((if hours is 1 then "" else "s")) + ", "
		message += minutes + " minute" + ((if minutes is 1 then "" else "s")) + " and "
		message += seconds + " second" + ((if seconds is 1 then "" else "s")) + " <br />"
		message += "left!"
		note.html message
	
$(document).ready ->
	loadWish()
	
#i = 0

setInterval(invokeTextillate, 8000)
setInterval(loadWish, 4100)

###
while i < 5
	setTimeout (->
		$("#wish_box").replaceWith "<div id=\"wish_box\">" + $("#hidden_text").html() + "</div>"
		invokeTextillate()
		$("#hidden_text").replaceWith "<div id=\"hidden_text\"></div>"
		), 2000
	setTimeout (->
		loadWish()
		), 3000
	#$("#wish_box").replaceWith "<div id=\"wish_box\"></div>"
	#loadWish()
	i++
###


	

#$(window).bind "load", ->
#	loadWish()
#	setTimeout (->
#		invokeTextillate()
#		), 500
	
	
#$(document).ready ->
#	$("#wish_box").animate
#		left: "+=500px"
#		, "slow", ->
#			$("#wish_box").fadeOut(50000).delay 5000
#			myFadeOut()

#myFadeOut = ->
#	$("#wish_box").animate
#		left: "+=400px"
#		, "slow", ->
#			$("#wish_box").fadeOut 5000
