var doc_width = document.documentElement.clientWidth;
var doc_height = document.documentElement.clientHeight;

document.body.style.height = (doc_height - 16).toString() + "px";
document.body.style.width = (doc_width - 16).toString() + "px";

var i = 0;
var txt = "Oh no! The end of the quarter is near and your grade isn't looking too pretty! You know your parents will be checking your grades when they get off work at 5 and that only leaves you with 2 hours to figure out how to change it! Luckily, we have created a backdoor to change your grade. The only catch is there are a series of challenges that you must complete to move it up. Each Challenge you complete will move your grade up one letter from the current F that you have. Good Luck!";
var speed = 30;
var whatisthis = "youshallnotpass";
var HACKSTREETBOYZAREBACK = new Audio('HackStreetBoyz.m4a');
HACKSTREETBOYZAREBACK.loop = true;

var LeedleLeedleLeedleLee = new Audio('LeedleLee.m4a');

document.addEventListener('DOMContentLoaded', function(){
    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    modal.style.display = "block";

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        HACKSTREETBOYZAREBACK.play();
        typeWriter();
    }
    }
});

createCow();

document.onmousemove = MousePosition;

function showPassword() {
    console.log(`
      ___________.__             __________                                               .___ .__            
        \__    ___/|  |__   ____   \______   \_____    ______ ________  _  _____________  __| _/ |__| ______ /\ 
          |    |   |  |  \_/ __ \   |     ___/\__  \  /  ___//  ___/\ \/ \/ /  _ \_  __ \/ __ |  |  |/  ___/ \/ 
          |    |   |   Y  \  ___/   |    |     / __ \_\___ \ \___ \  \     (  <_> )  | \/ /_/ |  |  |\___ \  /\ 
          |____|   |___|  /\___  >  |____|    (____  /____  >____  >  \/\_/ \____/|__|  \____ |  |__/____  > \/ 
                        \/     \/                  \/     \/     \/                          \/          \/    `);
}

function MousePosition(e) {

    var submitBtn = document.getElementById("runBtn");
    var top_pos = submitBtn.offsetTop;
    var left_pos = submitBtn.offsetLeft;
    var right_pos = left_pos + 75;
    var bottom_pos = top_pos + 30;

    x_pos = e.clientX;
    y_pos = e.clientY;

    //variales to control how button moves
    move_up = top_pos - 50;
    move_up = move_up.toString() + "px";

    move_down = top_pos + 50;
    move_down = move_down.toString() + "px";

    move_left = left_pos - 50;
    move_left = move_left.toString() + "px";

    move_right = left_pos + 50;
    move_right = move_right.toString() + "px";

    //Reads checks position of mouse and decides where the button needs to move
    if ((y_pos >= top_pos - 50) && (y_pos <= bottom_pos) && (x_pos >= left_pos) && (x_pos <= right_pos)){
        LeedleLeedleLeedleLee.play();
        submitBtn.style.top = move_down;

        if(submitBtn.offsetTop >= (doc_height - 25)){
            submitBtn.style.top = "0px";
        }
        
    }
    else if((y_pos <= bottom_pos + 50) && (y_pos >= top_pos) && (x_pos >= left_pos) && (x_pos <= right_pos)){
        LeedleLeedleLeedleLee.play();
        submitBtn.style.top = move_up;

        if(submitBtn.offsetTop <= 0){
            submitBtn.style.top = (doc_height - 50).toString() + "px";
        }
        
    }
    else if((x_pos >= left_pos - 50) && (x_pos <= right_pos) && (y_pos >= top_pos) && (y_pos <= bottom_pos)){
        LeedleLeedleLeedleLee.play();
        submitBtn.style.left = move_right;

        if(submitBtn.offsetLeft >= (doc_width)){
            submitBtn.style.left = "0px";
        }
        
    }
    else if((x_pos <= right_pos + 50) && (x_pos >= left_pos) && (y_pos >= top_pos) && (y_pos <= bottom_pos)){
        LeedleLeedleLeedleLee.play();
        submitBtn.style.left = move_left;
        if(submitBtn.offsetLeft <= 0){
            submitBtn.style.left = (doc_width - 70).toString() + "px";
            console.log("to right");
        }
    }

}

function tooEasy() {
    console.log(`
    __________                                               .___
    \______   \_____    ______ ________  _  _____________  __| _/
     |     ___/\__  \  /  ___//  ___/\ \/ \/ /  _ \_  __ \/ __ | 
     |    |     / __ \_\___ \ \___ \  \     (  <_> )  | \/ /_/ | 
     |____|    (____  /____  >____  >  \/\_/ \____/|__|  \____ | 
                    \/     \/     \/                          \/ `);
}

function createCow() {
    console.log(`%c ________________________________________
    < mooooooooooooooooooooooooooooooooooooo >
     ----------------------------------------
            \\   ^__^
             \\  (oo)\\_______
                (__)\\       )\\/\\
                    ||----w |
                    ||     ||`, "font-family:monospace");
}

function ignoreThisFunction() {
    var pass = document.getElementById("passBox").value;

    console.log(pass);

    if (pass == whatisthis) {
        console.log("Next Page");
		window.location.replace("../LoginPage"); // Need to obfuscate somehow
    } else {
        document.getElementById("incorrectPassword").style.visibility = "visible";
        document.getElementById("passBox").value = "";
        console.log("Come on you really think that's the password?");
    }
}

function typeWriter() {
    if (i < txt.length) {
      document.getElementById("explainText").innerHTML += txt.charAt(i);
      i++;
      setTimeout(typeWriter, speed);
    }
}

