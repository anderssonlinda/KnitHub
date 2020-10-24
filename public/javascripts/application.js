img = document.querySelector('.img-preview');
input = document.querySelector('.img-input'); 
allPatterns = document.querySelector('.all-patterns');
cables = document.querySelector('.cables');
laces = document.querySelector('.laces');
textures = document.querySelector('.textures');

function preview() {
    img.src = input.value;
}

var url = window.location.href;
if (url.endsWith("/patterns/all")) {
    allPatterns.style.fontWeight = "500";
} else if (url.endsWith("/patterns/cables")) {
    cables.style.fontWeight = "500";
} else if (url.endsWith("/patterns/laces")) {
    laces.style.fontWeight = "500";
} else if (url.endsWith("/patterns/textures")) {
    textures.style.fontWeight = "500";
}