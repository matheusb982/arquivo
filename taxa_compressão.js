function calculate(){
  var diameter = document.calcform.diameter.value;
  var course = document.calcform.course.value;
  var amount = document.calcform.amount.value;
  var diameter = parseFloat(diameter.replace(',', '.'));
  var course = parseFloat(course.replace(',', '.'));
  var amount = parseFloat(amount.replace(',', '.'));
  var pi = 3.14159265359;
  var displacement = (((diameter * diameter * pi) / 4000) * course);
  var rate = ((displacement + amount) / amount);
  document.getElementById('displacement').value = displacement.toFixed(2);
  document.getElementById('rate').value = rate.toFixed(2);
}
