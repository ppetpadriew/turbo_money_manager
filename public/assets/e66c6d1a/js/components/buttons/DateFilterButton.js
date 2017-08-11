"use strict";

import Button from "./Button";

class DateFilterButton extends Button {
    constructor(id, dateRangeContainerId) {
        super(id);
        this.dateRangeContainerId = dateRangeContainerId;
    }

    setButtonContainer(buttonContainer) {
        this.buttonContainer = buttonContainer;
    }

    click(callback) {
        const clickHandler = (e) => {
            this.buttonContainer.setActiveButton(this.id);
            callback(e);
        };
        Button.prototype.click.call(this, clickHandler);
    }
}

export default DateFilterButton;