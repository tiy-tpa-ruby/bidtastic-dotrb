// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
console.log('setting up click handlers')
  // Favoriting
  $('body').on('click', '.fav-heart', function(event) {
    console.log('clicked on fav-heart')
    let itemId = $(this).data("itemid")
    $(this).removeClass('fav-heart')
    $(this).addClass('faved-heart')

    $.ajax({
      type: "POST",
      url: 'favorites/' + itemId
    })
  })

  // Unfavoriting
  $('body').on('click', '.faved-heart', function(event) {
    console.log('clicked on faved-heart')
    let itemId = $(this).data("itemid")
    $(this).removeClass('faved-heart')
    $(this).addClass('fav-heart')

    $.ajax({
      type: "DELETE",
      url: 'favorites/destroy/' + itemId
    })
  })
})
