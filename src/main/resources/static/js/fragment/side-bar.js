// 사이드바 토글 기능 함수
function showMenu(toggleId, navbarId, bodyId) {
  const toggle = document.querySelector('#' + toggleId);
  const navbar = document.querySelector('#' + navbarId);
  const bodypadding = document.querySelector('#' + bodyId);

  if (toggle && navbar) {
    toggle.addEventListener('click', function () {
      navbar.classList.toggle('expander');
      bodypadding.classList.toggle('body-pd');
    });
  }
}

// showMenu 함수 호출
showMenu('nav-toggle', 'navbar', 'body-pd');

// 내비게이션 링크 색상 변경
const linkColor = document.querySelectorAll('.nav__link');

function colorLink() {
  linkColor.forEach(function (l) {
    l.classList.remove('active');
  });
  this.classList.add('active');
}

linkColor.forEach(function (l) {
  l.addEventListener('click', colorLink);
});

const linkCollapse = document.querySelectorAll('.collapse__link');

for (let i = 0; i < linkCollapse.length; i++) {
  linkCollapse[i].addEventListener('click', function () {
    const collapseMenu = this.nextElementSibling;
    collapseMenu.classList.toggle('showCollapse');

    const rotate = collapseMenu.previousElementSibling;
    rotate.classList.toggle('rotate');
  });
}

function toggleBackdrop() {
  const backdrop = document.querySelector('#backdrop');
  backdrop.classList.toggle('active');
}

document
  .querySelector('#nav-toggle')
  .addEventListener('click', function (event) {
    event.stopPropagation();
    toggleBackdrop();
  });

document.addEventListener('click', function (event) {
  const backdrop = document.querySelector('#backdrop');
  const sidebar = document.querySelector('#navbar');
  const isClickInsideSidebar = sidebar.contains(event.target);
  const isClickInsideBackdrop = backdrop.contains(event.target);

  if (!isClickInsideSidebar && !isClickInsideBackdrop) {
    backdrop.classList.remove('active');
  }
});
