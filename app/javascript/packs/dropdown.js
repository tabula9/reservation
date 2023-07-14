document.addEventListener("turbolinks:load", function(){
    document.getElementById('btn').addEventListener('click', function() {
        document.getElementById('test').classList.toggle('block');
    });
}, false);

document.addEventListener("turbolinks:load", function(){
    const btn = document.getElementsByClassName('d_click');
    const dropdown = document.getElementsByClassName('dropdown__indexs');

    for(let i = 0; i < btn.length; i++){
        btn[i].addEventListener('click', function() {
            dropdown[i].classList.toggle('inline_block');
        });
    }
}, false);
