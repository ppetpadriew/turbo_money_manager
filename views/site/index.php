<?php

/* @var $this yii\web\View */

use kartik\widgets\DatePicker;

$this->title = 'My Yii Application';

?>


<div class="site-index dashboard">

    <div class="row row-bot-buffer">
        <div class="col-md-4 col-md-offset-1">
            <h1 class="app-name">
                TURBO Money Manager
            </h1>
            <div class="input-group search">
                <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                <input type="text" class="form-control" placeholder="Category, Transaction, Amount">
            </div>
        </div>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right date-filter-btn-container">
                        <a href="#" class="btn btn-default" id="lastMonthBtn">Last Month</a>
                        <a href="#" class="btn btn-default" id="thisMonthBtn">This Month</a>
                        <a href="#" class="btn btn-default" id="futureBtn">Future</a>
                        <a href="#" class="btn btn-default" id="customBtn">Custom</a>
                    </div>
                </div>
            </div>


            <div class="row date-range-container" id="dateRangeContainer">
                <div class="col-md-6">
                    <strong>From</strong>
                    <?php
                    echo DatePicker::widget([
                        'name' => 'dp_1',
                        'type' => DatePicker::TYPE_INPUT,
                        'value' => '23-Feb-1982',
                        'pluginOptions' => [
                            'autoclose'=>true,
                            'format' => 'dd-M-yyyy'
                        ]
                    ]);
                    ?>
                </div>

                <div class="col-md-6">
                    <strong>To</strong>
                    <?php
                    echo DatePicker::widget([
                        'name' => 'dp_1',
                        'type' => DatePicker::TYPE_INPUT,
                        'value' => '23-Feb-1982',
                        'pluginOptions' => [
                            'autoclose'=>true,
                            'format' => 'dd-M-yyyy'
                        ]
                    ]);
                    ?>
                </div>
            </div>

        </div>
        <div class="col-md-4">
            <div class="pull-right total-summary">
                <div class="total-item income">
                    <div>Total Income</div> <div>1,000,000.00</div>
                </div>

                <div class="total-item expense">
                    <div>Total Expense</div> <div>100,000.00</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row row-bot-buffer">

        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Expense</h3>
                </div>
                <div class="panel-body">
                    <canvas id="expenseSummaryChart"></canvas>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Incomes</h3>
                </div>
                <div class="panel-body">
                    <canvas id="incomeSummaryChart"></canvas>
                </div>
            </div>
        </div>

    </div>

    <div class="row">

        <div class="col-md-12">

            <div class="transaction-container">

                <div class="transaction-item">
                    <div class="date-container">
                        <div class="day">25</div>
                        <div class="date-detail">
                            <div class="day-text">Sun</div>
                            <div class="month-year">June 2017</div>
                        </div>
                    </div>
                    <div class="total-amount">500.00</div>
                </div>

                <div class="transaction-item">
                    <div class="icon"><i class="ion-spoon"></i></div>
                    <div class="detail">
                        <div class="category">Food</div>
                        <div class="note">ข้าวขาหมู</div>
                    </div>
                    <div class="amount expense">50.00</div>
                </div>

                <div class="transaction-item">
                    <div class="icon"><i class="ion-spoon"></i></div>
                    <div class="detail">
                        <div class="category">Food</div>
                        <div class="note">ข้าวขาหมู</div>
                    </div>
                    <div class="amount expense">50.00</div>
                </div>
                <div class="transaction-item">
                    <div class="icon"><i class="ion-spoon"></i></div>
                    <div class="detail">
                        <div class="category">Food</div>
                        <div class="note">ข้าวขาหมู</div>
                    </div>
                    <div class="amount expense">50.00</div>
                </div>
                <div class="transaction-item">
                    <div class="icon"><i class="ion-cash"></i></div>
                    <div class="detail">
                        <div class="category">Salary</div>
                        <div class="note">เงินเดือน CF</div>
                    </div>
                    <div class="amount income">50.00</div>
                </div>

            </div>

        </div>

    </div>
</div>
