"use strict";
import Button from "./components/buttons/Button";

let button = new Button({
    id: "#btn",
    clickHandler: function () {
        alert("Hello");
    }
});
console.log(button);
