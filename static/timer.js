let timer;
let minutes = 25;
let seconds = 0;
let isRunning = false;

function startTimer() {
    if (!isRunning) {
        timer = setInterval(updateTimer, 1000);
        isRunning = true;
    }
}

function pauseTimer() {
    clearInterval(timer);
    isRunning = false;
}

function restartTimer() {
    clearInterval(timer);
    isRunning = false;
    minutes = 25;
    seconds = 0;
    updateTimer();
}

function updateTimer() {
    if (seconds === 0) {
        if (minutes === 0) {
            clearInterval(timer);
            isRunning = false;
            alert('Timer is up!');
            return;
        }
        minutes--;
        seconds = 59;
    } else {
        seconds--;
    }

    const formattedMinutes = String(minutes).padStart(2, '0');
    const formattedSeconds = String(seconds).padStart(2, '0');
    document.getElementById('timer').innerHTML = `${formattedMinutes}:${formattedSeconds}`;
}
