import "eonasdan-bootstrap-datetimepicker"

const initializeDateTimePicker = () => {
  $('#booking_pick_time').datetimepicker({
    format: "DD/MM/YYYY HH:mm",
    sideBySide: true
  });
  $('#booking_return_time').datetimepicker({
    format: "DD/MM/YYYY HH:mm",
    sideBySide: true
  });
}

export { initializeDateTimePicker }
