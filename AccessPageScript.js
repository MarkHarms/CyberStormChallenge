var doc_width = document.documentElement.clientWidth;
var doc_height = document.documentElement.clientHeight;

document.body.style.height = (doc_height - 16).toString() + "px";
document.body.style.width = (doc_width - 16).toString() + "px";

console.log(doc_height);
console.log(doc_width);

document.onmousemove = MousePosition;

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
        submitBtn.style.top = move_down;

        if(submitBtn.offsetTop >= (doc_height - 25)){
            submitBtn.style.top = "0px";
        }
        
    }
    else if((y_pos <= bottom_pos + 50) && (y_pos >= top_pos) && (x_pos >= left_pos) && (x_pos <= right_pos)){
        submitBtn.style.top = move_up;

        if(submitBtn.offsetTop <= 0){
            submitBtn.style.top = (doc_height - 50).toString() + "px";
        }
        
    }
    else if((x_pos >= left_pos - 50) && (x_pos <= right_pos) && (y_pos >= top_pos) && (y_pos <= bottom_pos)){
        submitBtn.style.left = move_right;

        if(submitBtn.offsetLeft >= (doc_width)){
            submitBtn.style.left = "0px";
        }
        
    }
    else if((x_pos <= right_pos + 50) && (x_pos >= left_pos) && (y_pos >= top_pos) && (y_pos <= bottom_pos)){
        submitBtn.style.left = move_left;
        if(submitBtn.offsetLeft <= 0){
            submitBtn.style.left = (doc_width - 70).toString() + "px";
            console.log("to right");
        }
    }

}

function checkPassword() {
    var pass = document.getElementById("passBox").value;

    console.log(pass);

    if (pass == "password") {
        console.log("Next Page");
    } else {
        document.getElementById("incorrectPassword").style.visibility = "visible";
        document.getElementById("passBox").value = "";
    }
}