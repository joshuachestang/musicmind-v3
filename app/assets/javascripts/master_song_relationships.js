$("#favorite_msr").click(function() {
    $.ajax({
        url: "/master_song_relationships/add_favorite_msr",
        success: function(html){
            //do something here if you want
        }
    });
});