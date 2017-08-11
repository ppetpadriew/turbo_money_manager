"use strict";

class ButtonContainer {

    constructor() {
        this.buttons = {};
        this.activeButton = undefined;
    }

    addButton(button) {
        this.buttons[button.id] = button;
        button.setButtonContainer(this);
    }

    setActiveButton(buttonId) {
        // Deactivate old one
        if (this.activeButton) {
            this.activeButton.deactivate();
        }

        // Activate new one
        this.buttons[buttonId].activate();
        this.activeButton = this.buttons[buttonId];
    }
}

export default ButtonContainer;