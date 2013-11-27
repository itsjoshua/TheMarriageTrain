# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


loadWish = ->
	$("#wish_box").load("/guests/wish")

	

$(document).ready ->
	loadWish()
	
$(document).ready ->
	$("#wish_box").animate
		left: "+=500px"
		, "slow", ->
			$("#wish_box").fadeOut 5000
