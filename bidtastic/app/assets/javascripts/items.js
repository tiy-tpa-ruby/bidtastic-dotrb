// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  // Favoriting
  $('.TBD').on('click', '.fav-heart', function(event) {
    let homeId = $(this).data("itemid")
    $(this).removeClass('fav-heart')
    $(this).addClass('faved-heart')

    $.ajax({
      type: "POST",
      url: 'favorites/' + itemId
    })
  })

  // Unfavoriting
  $('.TBD').on('click', '.faved-heart', function(event) {
    let itemId = $(this).data("itemid")
    $(this).removeClass('faved-heart')
    $(this).addClass('fav-heart')

    $.ajax({
      type: "DELETE",
      url: 'favorites/destroy/' + itemId
    })
  })
})
