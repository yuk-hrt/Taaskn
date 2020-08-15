$(function(){
  $("#sortable").sortable({
    update: function(e, ui){
    var item = ui.item;
    var item_data = item.data();
    var params = {_method: 'put'};
    params[item_data.modelName] = { row_order_position: item.index() }
      $.ajax({
        url: item_data.updateUrl,
        type: 'POST',
        dataType: 'json',
        data: params
      });
    }
  });
});