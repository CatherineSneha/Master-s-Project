const trigger = document.querySelector('.nav-toggler');
const nav = document.querySelector('.full-screen-nav');
const backdrop = document.querySelector('.backdrop');
const test = document.getElementById('test');

// triggers the menu when clicked
trigger.addEventListener('click', () => nav.classList.add('open-nav'));
backdrop.addEventListener('click', () => nav.classList.remove('open-nav'));

// mouseover event on the items in menu bar 
test.addEventListener("mouseover", function( event ) {
  // highlight the mouseover target
  event.target.style.color = "orange";

  // reset the color after a short delay
  setTimeout(function() {
    event.target.style.color = "";
  }, 500);
}, false);

// displays a DOM tree when the retrieve records button is clicked
 function DOM_Tree(e, ul = $('#tree')) {
    for (let i = 0; i < e.childNodes.length - 1; i++) {
      if (e.childNodes[i].id != 'tree') {
        let li = document.createElement('li');
        let el = e.childNodes[i];
        if (e.childNodes[i].id != undefined) {
          li.innerText = e.childNodes[i].nodeName + ' ' + e.childNodes[i].id;
          ul.append(li);
        }
        let ul1 = document.createElement('ul');
        DOM_Tree(e.childNodes[i], ul1);
        ul.append(ul1);
      }
    }
  }
  confirmButton.onclick = function() {
    DOM_Tree(document.body);
  }