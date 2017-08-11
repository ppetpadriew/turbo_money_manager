"use strict";

import DateFilterButton from "./DateFilterButton";

class StandardDateFilterButton extends DateFilterButton {

    constructor(id, dateRangeContainerId, callback)
    {
        super(id, dateRangeContainerId);

        const clickHandler = (e) => {
            $(this.dateRangeContainerId).hide();

            if (callback) {
                callback(e);
            }
        };
        DateFilterButton.prototype.click.call(this, clickHandler);
    }

}
export default StandardDateFilterButton;
