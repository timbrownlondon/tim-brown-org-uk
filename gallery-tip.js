const tip = document.createElement('div');
tip.id = 'gallery-tip';
document.body.appendChild(tip);

document.querySelectorAll('#gallery a').forEach(a => {
  const img = a.querySelector('img');
  a.addEventListener('mouseenter', () => {
    const r = img.getBoundingClientRect();
    tip.textContent = img.alt;
    tip.style.left = (r.left + r.width / 2 + scrollX) + 'px';
    tip.style.top = (r.bottom + scrollY - 50) + 'px';
    tip.style.opacity = 1;
  });
  a.addEventListener('mouseleave', () => tip.style.opacity = 0);
});
