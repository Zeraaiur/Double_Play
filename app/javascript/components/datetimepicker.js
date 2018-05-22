import "eonasdan-bootstrap-datetimepicker"

const initializeDateTimePicker = () => {
  $(function () {
    $('#booking_pick_time').datetimepicker({
      format: "DD/MM/YYYY HH:mm"
    });
    $('#booking_return_time').datetimepicker({
      format: "DD/MM/YYYY HH:mm"
    });
  });
}

export { initializeDateTimePicker }
