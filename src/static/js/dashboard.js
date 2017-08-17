(function () {
    var Button = function (config) {
        var defaultConfig = {
            activeClass: "btn-primary",
            inactiveClass: "btn-default",
            status: "inactive"
        };
        $.extend(config, defaultConfig, config);

        this.id = config.id;
        this.$elem = $(this.id);
        this.status = config.status;
        this.activeClass = config.activeClass;
        this.inactiveClass = config.inactiveClass;
        this.clickHandler = config.clickHandler;

        this.$elem.click((function (e) {
            e.preventDefault();
            this.toggleStatus();
            this.clickHandler.bind(this)(e)
        }).bind(this));
    };
    Button.prototype = {
        constructor: Button,
        toggleStatus: function () {
            if (this.status === "active") {
                this.deactivate();
            } else {
                this.activate();
            }
        },
        activate: function () {
            this.status = "active";
            this.$elem.removeClass(this.inactiveClass);
            this.$elem.addClass(this.activeClass);
        },
        deactivate: function () {
            this.status = "inactive";
            this.$elem.removeClass(this.activeClass);
            this.$elem.addClass(this.inactiveClass);
        }
    };

    var DateFilterButton = function (config) {
        this.dateRangeContainerId = config.dateRangeContainerId;
        this.buttonContainer = undefined;
        var clickHandler = config.clickHandler.bind(this);
         config.clickHandler = function () {
             this.buttonContainer.setActiveButton(this.id);
             clickHandler();
         };
        Button.call(this, config);
    };

    var oldDateFilterButtonConstructor = DateFilterButton;
    DateFilterButton.prototype = Object.create(Button.prototype);
    DateFilterButton.constructor = oldDateFilterButtonConstructor;

    var CustomDateFilterButton = function (config) {
        if (config.clickHandler) {
            var clickHandler = config.clickHandler.bind(this);
        }

        config.clickHandler = function (e) {
            $(this.dateRangeContainerId).show();

            if (clickHandler) {
                clickHandler(e);
            }
        };
        DateFilterButton.call(this, config);
    };

    var oldCustomDateFilterButtonConstructor = CustomDateFilterButton;
    CustomDateFilterButton.prototype = Object.create(DateFilterButton.prototype);
    oldCustomDateFilterButtonConstructor.prototype.constructor = oldCustomDateFilterButtonConstructor;

    var StandardDateFilterButton = function (config) {
        if (config.clickHandler) {
            var clickHandler = config.clickHandler.bind(this);
        }
        config.clickHandler = function (e) {
            $(this.dateRangeContainerId).hide();

            if (clickHandler) {
                clickHandler(e);
            }
        };
        DateFilterButton.call(this, config);
    };
    var oldStandardDateFilterButtonConstructor = StandardDateFilterButton;
    StandardDateFilterButton.prototype = Object.create(DateFilterButton.prototype);
    StandardDateFilterButton.prototype.constructor = oldStandardDateFilterButtonConstructor;

    var ButtonContainer = function () {
        this.buttons = {};
        this.activeButton = undefined;
    };
    ButtonContainer.prototype = {
        constructor: ButtonContainer,
        addButton: function (button) {
            this.buttons[button.id] = button;
            button.buttonContainer = this;
        },
        setActiveButton: function (buttonId) {
            // Deactivate old one
            if (this.activeButton) {
                this.activeButton.deactivate();
            }

            // Activate new one
            this.buttons[buttonId].activate();
            this.activeButton = this.buttons[buttonId];
        }
    };


    var Dashboard = function () {
        this.bindEvents();
    };
    Dashboard.prototype = {
        constructor: Dashboard,
        bindEvents: function () {

            var dateRangeContainerId = "#dateRangeContainer";
            var customBtn = new CustomDateFilterButton({id: "#customBtn", dateRangeContainerId: dateRangeContainerId});
            // var lastMonthBtn = new StandardDateFilterButton({id: "#lastMonthBtn", dateRangeContainerId: dateRangeContainerId});
            // var futureBtn = new StandardDateFilterButton({id: "#futureBtn", dateRangeContainerId: dateRangeContainerId});
            // var thisMonthBtn = new StandardDateFilterButton({id: "#thisMonthBtn", dateRangeContainerId: dateRangeContainerId});
            //
            // var buttonContainer = new ButtonContainer();
            // buttonContainer.addButton(customBtn);
            // buttonContainer.addButton(lastMonthBtn);
            // buttonContainer.addButton(futureBtn);
            // buttonContainer.addButton(thisMonthBtn);
            // buttonContainer.setActiveButton(customBtn.id);
        }
    };
    new Dashboard();
})();

