import flatpickr from "flatpickr";
const initFlatpickr = () => {
  flatpickr(".datepicker", {
    dateFormat: "d-m-Y",
    allowInput: true,
    minDate: "today",
    maxDate: new Date().fp_incr(31),
    mode: "multiple",
    mode: "range",
    // inline: true,
  });
}
export { initFlatpickr };
