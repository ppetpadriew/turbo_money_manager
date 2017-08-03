"use strict";

import StandardDateFilterButton from "../components/buttons/StandardDateFilterButton";
import CustomDateFilterButton from "../components/buttons/CustomDateFilterButton";
import ButtonContainer from "../components/buttons/ButtonContainer";
import DashboardApi from "../api/DashboardApi";

const dateRangeContainerId = "#dateRangeContainer";
const customBtn = new CustomDateFilterButton("#customBtn", dateRangeContainerId);
const lastMonthBtn = new StandardDateFilterButton("#lastMonthBtn", dateRangeContainerId);
const futureBtn = new StandardDateFilterButton("#futureBtn", dateRangeContainerId);
const thisMonthBtn = new StandardDateFilterButton("#thisMonthBtn", dateRangeContainerId);

const buttonContainer = new ButtonContainer();
buttonContainer.addButton(customBtn);
buttonContainer.addButton(lastMonthBtn);
buttonContainer.addButton(futureBtn);
buttonContainer.addButton(thisMonthBtn);
buttonContainer.setActiveButton(thisMonthBtn.id);

const api = new DashboardApi();
api.getTransactions();