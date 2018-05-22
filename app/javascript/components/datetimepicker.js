import "eonasdan-bootstrap-datetimepicker"

const initializeDateTimePicker = () => {
  $(function () {
    $('#booking_pick_time').datetimepicker();
    $('#booking_return_time').datetimepicker();
  });
}

export { initializeDateTimePicker }
