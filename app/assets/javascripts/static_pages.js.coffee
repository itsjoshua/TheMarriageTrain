# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


note = $("#note")
timeStamp = (new Date(2014, 0, 4)).getTime()

loadWish = ->
	$("#hidden_text").load("/guests/wish")


invokeAnimate = ->
	$("#wish_box").replaceWith "<div id=\"wish_box\" class=\"animated fadeIn\">" + $("#hidden_text").html() + "</div>"
	setTimeout (->
		$("#wish_box").replaceWith "<div id=\"wish_box\" class=\"animated hinge\">" + $("#hidden_text").html() + "</div>"
	), 5000
	

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
	
$(window).bind "load", ->
	$('#gallery').photobox 'a'
	
$(document).ready ->
	loadWish()
	
	
setInterval(loadWish, 13500)
setInterval(invokeAnimate, 7000)


