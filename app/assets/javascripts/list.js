$( function() {
  $( "#sortable" ).sortable({
    connectWith: ".connectedSortable"
  }).disableSelection();
});