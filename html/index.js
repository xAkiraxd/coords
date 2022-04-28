$(function () {
    function display(bool) {
    if (bool) {
        $("body").show();
        $("#rare5m").show();
    } else {
        $("body").hide();
        $("#rare5m").hide();
    }
}

display(false)

window.addEventListener('message', function(event) {

        var item = event.data;

        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }

        rare5mCoords(event.data);
        rare5mnormalCoords(event.data);
        rare5mvector3Coords(event.data);
        rare5mvector4Coords(event.data);

    })
})

function rare5mClose(){
    $.post('http://coords/rare5mcloseButton');
}

function rare5mCopy(){
    const copyText = document.getElementById("rare5mCoords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
    console.log('Copied coords');
}

function rare5mnormalCopy(){
    const copyText = document.getElementById("rare5mnormalCoords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
    console.log('Copied coords');
}

function rare5mvector3Copy(){
    const copyText = document.getElementById("rare5mvector3Coords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
    console.log('Copied coords');
}

function rare5mvector4Copy(){
    const copyText = document.getElementById("rare5mvector4Coords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
    console.log('Copied coords');
}

function rare5mCoords(data) {

	if (data.type === 'rare5m') {
        rare5mcoordsStart(data);
    }

}

function rare5mnormalCoords(data) {

	if (data.type === 'normal') {
        rare5mcoordsnormalStart(data);
    }

}

function rare5mvector3Coords(data) {

	if (data.type === 'vector3') {
        rare5mcoordsvector3Start(data);
    }

}

function rare5mvector4Coords(data) {

	if (data.type === 'vector4') {
        rare5mcoordsvector4Start(data);
    }

}

function rare5mcoordsStart(data){
    document.querySelector("#rare5mCoords").textContent = data.text;
}

function rare5mcoordsnormalStart(data){
    document.querySelector("#rare5mnormalCoords").textContent = data.text;
}

function rare5mcoordsvector3Start(data){
    document.querySelector("#rare5mvector3Coords").textContent = data.text;
}

function rare5mcoordsvector4Start(data){
    document.querySelector("#rare5mvector4Coords").textContent = data.text;
}
