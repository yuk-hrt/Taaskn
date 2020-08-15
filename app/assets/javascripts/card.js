$(function(){
  
  //itemを動かすようにする ①
  $( "#sortable" ).sortable();
  // itemがドロップされた時にイベント発火 ②
  $(".done-box").droppable({
    accept: ".item",
    disabled: false,
    drop: function(e, ui){
      e.preventDefault();
      //ドロップされたitem要素を取得。jQueryオブジェクトからDOM要素を取り出す
      var done_item = ui.draggable[0];
      //idを取得。
      var done_url = ui.draggable.data("done-url");
      $.ajax({
        url: done_url,
        type: "POST",
        data: {_method: "POST"},
        dataType: "json"
      })
      .done(function(){
        $( ".done-cards" ).append(done_item);
      })
      .fail(function(){
        alert("エラー");
      })
    }
  })
});