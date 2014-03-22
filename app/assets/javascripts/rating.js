$(function() {
  $('#ratings').dataTable({
    "sPaginationType": "bootstrap"
  });
});

$(function() {
    $(".rating_star").hover(function() {
      var stars = $(this).attr("data-stars");
      var form_id = $(this).attr("data-form-id");
      set_stars(form_id, stars);
    },
    function() {
      update_stars();
    });
});

$(function() {
    $('.rating_star').click(function() {
        var star = $(this);
        var form_id = star.attr("data-form-id");
        var stars = star.attr("data-stars");
        $('#' + form_id + '_stars').val(stars);

        $.ajax({
            type: "put",
            url: $('#' + form_id).attr('action'),
            data: $('#' + form_id).serialize(),
            success: function(response){
                console.log(response);
                update_stars();
                if(response["avg_rating"]){
                    $('#average_rating').text(response["avg_rating"]);
                }
            }
        })
    });
});

function update_stars(){
    $('.star_rating_form').each(function() {
        var form_id = $(this).attr('id');
        set_stars(form_id, $('#' + form_id + '_stars').val());
    });
}

function set_stars(form_id, stars) {
    for(i = 1; i <= 5; i++){
        if(i <= stars){
            $('#' + form_id + '_' + i).addClass("on");
        } else {
            $('#' + form_id + '_' + i).removeClass("on");
        }
    }
}

$(document).on('ready page:load', function() {
    update_stars();
})

