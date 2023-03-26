document.addEventListener('DOMContentLoaded', function() {
    const elems = document.querySelectorAll('.modal');
    const instances = M.Modal.init(elems);
});


document.addEventListener('DOMContentLoaded', function() {
    const elems = document.querySelectorAll('.sidenav');
    const instances = M.Sidenav.init(elems);
});


document.addEventListener('DOMContentLoaded', function() {
    const elems = document.querySelectorAll('.fixed-action-btn');
    const instances = M.FloatingActionButton.init(elems, {
        hoverEnabled: false
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const elems = document.querySelectorAll('.tooltipped');
    const instances = M.Tooltip.init(elems);
});