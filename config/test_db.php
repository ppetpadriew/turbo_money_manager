<?php
$db = require(__DIR__ . '/db.php');
// test database! Important not to run tests on production or development databases
$db['dsn'] = 'mysql:host=turbo-money-manager-mysql-dev;dbname=codecept_test';

return $db;