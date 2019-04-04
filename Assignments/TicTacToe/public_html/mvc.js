var model = {
    rows: 3,
    cols: 3,
    curPlyr: 0,
    numTurns: 0,
    gameOver: false,
    tiles: [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
    ]
};

var view = {
    setX: function (elem) {
        var xImg = "url('x.png')";//Path to X image
        elem.style.backgroundImage = xImg;
    },
    
    setO: function (elem) {
        var oImg = "url('o.png')";//Path to O image
        elem.style.backgroundImage = oImg;
    },
    
    setMsg: function (msg) {
        document.getElementById("msgArea").innerHTML = msg;
    }
};

var controller = {
    handleClick: function (elem) {
        //Check for game over and leave if true
        if(model.gameOver){return;}
        
        //Get element id of clicked dom object
        var indices = [];//Indices for 2d array at model.tiles
        indices.push(elem.id.charAt(0));
        indices.push(elem.id.charAt(1));
        
        //Check if the area has already been clicked
        if (controller.isClicked(indices)) {
            //Alert user and return
            var errMsg = "That tile has already been chosen";
            view.setMsg(errMsg);
            return;
        }
        //Update view
        controller.updateView(elem);
        
        //Update model
        controller.updateModel(indices);
        
        //Check game status
        var val = ((model.curPlyr + 1) % 2 == 0) ? "X" : "O";
        controller.checkWin(val);
        
    },
    
    isClicked: function (arr) {
        return (model.tiles[arr[0]][arr[1]] === "") ? false : true;
    },
    
    checkWin: function(val) {
        var temp = model.tiles;
        var winMsg = "";
        if((temp[0][0] == val && temp[0][1] == val && temp[0][2] == val) ||
           (temp[1][0] == val && temp[1][1] == val && temp[1][2] == val) ||
           (temp[2][0] == val && temp[2][1] == val && temp[2][2] == val) ||
           (temp[0][0] == val && temp[1][0] == val && temp[2][0] == val) ||
           (temp[0][1] == val && temp[1][1] == val && temp[2][1] == val) ||
           (temp[0][2] == val && temp[1][2] == val && temp[2][2] == val) ||
           (temp[0][0] == val && temp[1][1] == val && temp[2][2] == val) ||
           (temp[0][2] == val && temp[1][1] == val && temp[2][0] == val)) {
            model.gameOver = true;//Set game over
            var plyr = ((model.curPlyr + 1) % 2) + 1;//Get winning player
            winMsg = "Congraulations Player " + plyr + ", You Win!";//Update view message
            view.setMsg(winMsg);//Set view message
        } else if (model.numTurns === 9) {//If scratch and no win
            model.gameOver = true;//Set game over
            winMsg = "Scratch, you are both losers";//Update view message
            view.setMsg(winMsg);//Set view message
        }
        
    },
    
    updateView: function(elem) {
        var msg = "bad value";
        if(model.curPlyr == 0) {//If player 1
            view.setX(elem);    //Set X image
            msg = "Player 2's Turn";
        } else {                //Else player 2
            view.setO(elem);    //Set O image
            msg = "Player 1's Turn";
        }
        view.setMsg(msg);
    },
    
    updateModel: function(indices) {
        model.tiles[indices[0]][indices[1]] = (model.curPlyr == 0) ? "X" : "O";//Set choice in tiles
        model.curPlyr = ++model.curPlyr % 2;//Switch players to next player
        model.numTurns++;//Update number of turns taken
    }
};

