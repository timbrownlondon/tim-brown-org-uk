let current = 0;

function display() {
  const item = data[current];
  document.body.style.backgroundColor = item.bg;
  document.body.style.color = item.fg;
  document.documentElement.style.setProperty("--link-color", item.fg);
  document.getElementById("message").textContent = item.txt;
}

function update(direction) {
  current = (current + direction + data.length) % data.length;
  display();
}

function random() {
  const prev = current;
  while (current === prev) {
    current = Math.floor(Math.random() * data.length);
  }
  display();
}

document.addEventListener("DOMContentLoaded", () => {
  random();
});
