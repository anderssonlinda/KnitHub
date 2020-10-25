img = document.querySelector('.img-preview');
input = document.querySelector('.img-input'); 
allPatterns = document.querySelector('.all-patterns');
cables = document.querySelector('.cables');
laces = document.querySelector('.laces');
textures = document.querySelector('.textures');
myProjects = document.querySelector('.my-projects')
savedPatterns = document.querySelector('.saved-patterns')
projectImage = document.querySelector(".new-project-image")

function preview() {
    img.src = input.value;
}



function addBorder() {
    if (projectImage.getAttribute('src') == ""){
        projectImage.style.border = "none";
    } else {
        projectImage.style.border = "5px solid #dcc9b6";
    }
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
} else if (url.endsWith("/user/projects")) {
    myProjects.style.fontWeight = "500"
} else if (url.endsWith("/user/saved_patterns")) {
    savedPatterns.style.fontWeight = "500"
}

if (url.endsWith("/upload-project")) {
    if (projectImage.getAttribute('src') == "") {
        projectImage.style.border = "none";
    }
}