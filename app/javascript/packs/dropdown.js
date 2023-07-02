document.addEventListener("turbolinks:load", function(){
    document.getElementById('btn').addEventListener('click', function() {
        document.getElementById('test').classList.toggle('block');
    });
}, false);
