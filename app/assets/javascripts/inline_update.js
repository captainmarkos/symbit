$.fn.extend({
  inlineUpdate: function() {

    var send_file_request = function(input_elem) {
      console.log('--> send_file_request() fired!');

      var form_elem = $(input_elem).parents('form')[0];
      console.log('--> form_elem: ', form_elem);

      var form_data = new FormData(form_elem);
      console.log('--> form_data: ', form_data);
    };

    var send_data_request = function(input_elem) {
      $.ajax({
        type: 'PATCH',
        url: $(input_elem).data('path'),
        data: $(input_elem).serialize() + '&format=json',
        processData: false,
        success: function( data ) {
          $(input_elem).effect("highlight", {color: '#34d500'}, 2000);
        },
        error: function( data ) {
          console.log(data);
          $(input_elem).effect("highlight", {color: 'Salmon'}, 3000);
        }
      });
    };


    $.each(this, function(index, input_elem) {
      $(input_elem).change(function() {
        console.log('--> input_elem.serialize(): ', $(input_elem).serialize());
        var url = $(input_elem).data('path');

        console.log('--> input_elem.prop("id"): ', $(input_elem).prop("id"));
        console.log('--> input_elem.prop("name"): ', $(input_elem).prop("name"));
        console.log('--> input_elem.prop("type"): ', $(input_elem).prop("type"));
        console.log('--> input_elem.prop("value"): ', $(input_elem).prop("value"));

        if ($(input_elem).prop('type') === 'file') {
          send_file_request(input_elem);
        } else {
          send_data_request(input_elem);
        }
      });
      return;
    })
  }
});
