$(document).on('turbolinks:load', function() {
  $('.collection').on('click', '.dismissable', function(e) {
    $(e.currentTarget).slideUp();
    e.preventDefault();
    e.stopPropagation();
  });
});
