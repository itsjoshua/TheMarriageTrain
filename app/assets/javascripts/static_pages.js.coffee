# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


note = $("#note")
timeStamp = (new Date(2014, 0, 4)).getTime()

loadWish = ->
	$("#hidden_text").load("/guests/wish")


invokeAnimate = ->
	wish = $("#hidden_text").html()
	$("#wish_box").replaceWith "<div id=\"wish_box\" class=\"animated fadeIn\">" + wish + "</div>"
	setTimeout (->
		$("#wish_box").replaceWith "<div id=\"wish_box\" class=\"animated hinge\">" + wish + "</div>"
	), 7000
	

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
	setTimeout (->
		invokeAnimate()
	), 1000
	

	
	
setInterval(loadWish, 7000)
setInterval(invokeAnimate, 9000)





