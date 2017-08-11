"use strict";

const STATUS_ACTIVE = "active";
const STATUS_INACTIVE = "inactive";
class Button {

    constructor(id) {
        this.id = id;
        this.$elem = $(this.id);
        this.status = STATUS_INACTIVE;
        this.activeClass = "btn-primary";
        this.inactiveClass = "btn-default";
    }

    setStatus(status) {
        if (status !== STATUS_ACTIVE && status !== STATUS_INACTIVE) {
            throw new Error("Invalid status.");
        }
        this.status = status;
    }

    setActiveClass(cssClass) {
        this.activeClass = cssClass;
    }

    setInactiveClass(cssClass) {
        this.setInactiveClass = cssClass;
    }

    click(callback) {
        const clickHandler = function(e) {
            e.preventDefault();
            callback(e);
        };
        this.$elem.click(clickHandler);
    };

    toggleStatus() {
        if (this.status === STATUS_ACTIVE) {
            this.deactivate();
        } else {
            this.activate();
        }
    }

    activate() {
        this.status = STATUS_ACTIVE;
        this.$elem.removeClass(this.inactiveClass);
        this.$elem.addClass(this.activeClass);
    }

    deactivate() {
        this.status = STATUS_INACTIVE;
        this.$elem.removeClass(this.activeClass);
        this.$elem.addClass(this.inactiveClass);
    }

    static get STATUS_ACTIVE() {
        return STATUS_ACTIVE;
    }

    static get STATUS_INACTIVE() {
        return STATUS_INACTIVE;
    }
}

export default Button;
