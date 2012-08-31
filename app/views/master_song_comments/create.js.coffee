$('#new_master_song_comment')[0].reset();
$('<%= escape_javascript(render(:partial => 'master_songs/comment'))%>')
  .prependTo('#comments')
  .hide()
  .fadeIn()


