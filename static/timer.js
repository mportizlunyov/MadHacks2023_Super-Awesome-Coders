function Sec_30_Timer() {
    alert("Done!");
}
function confirmClick() {
    alert("Clicked!")
    document.body.innerHTML = "<p>Yes?</p>"
}

const button = document.querySelector("button");

button.addEventListener("click", confirmClick);

setTimeout(Sec_30_Timer, 30000);
