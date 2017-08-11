"use strict";

import DateFilterButton from "./DateFilterButton";

class CustomDateFilterButton extends DateFilterButton {
    constructor(id, dateRangeContainerId, callback) {
        super(id, dateRangeContainerId);

        const clickHandler = (e) => {
            $(this.dateRangeContainerId).show();

            if(callback){
                callback(e);
            }
        };
        DateFilterButton.prototype.click.call(this, clickHandler);
    }

}
export default CustomDateFilterButton;