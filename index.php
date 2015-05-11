<?php
//error_reporting(E_ALL);
//ini_set('display_errors', '1');

require 'vendor/autoload.php';
require_once 'DBconnection.php';

$app = new \Slim\Slim();

// We get the correct record based on the username entered
$data = basicAuthentication();
// We authenticate every incoming requet with http basic authentication
$app->add(new \Slim\Extras\Middleware\HttpBasicAuth($data['username'], $data['password']));

$app->get('/users', 'listUsers');
$app->get('/loggedin', 'welcomeUser');
$app->get('/user/devices', 'myDevices');
$app->get('/user/income', 'myIncome');
$app->get('/headers', 'basicAuthentication');
$app->get('/help', 'getHelp');

// Setting the default timezone to Danish time for functions that require this.
date_default_timezone_set('Europe/Copenhagen');
$app->run();

// Insert Error Report
function getHelp() {
    $app = \Slim\Slim::getInstance();

    $username = $app->request->headers("Php-Auth-User");
    $device = $app->request->headers("problemDeviceId");
    $subject = $app->request->headers("subject");
    $comments = $app->request->headers("comments");
    $problemDate = date('Y-m-d H:i:s');
    $data = array($device, $comments, $problemDate, $subject);

    $sql = "INSERT INTO problems (deviceId, comments, problemDate, subject )"
            . "VALUES ( ?, ?, ?, ?)";
    try {
        $db = getConnection();

        $stmta = $db->prepare($sql);
        $stmta->execute($data);

        $response = "Thank you";
        $app->response->setStatus(200);
        $app->response()->headers->set('Content-Type', 'application/json');
        echo json_encode($response);
        $db = null;
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}

// Print current user income per *this* month, week and day
function myIncome() {
    $app = \Slim\Slim::getInstance();
    $username = $app->request->headers("Php-Auth-User");
    $sql = "SELECT
  ( SELECT SUM(statistics.income)
   FROM users
   INNER JOIN userdevices ON users.userId=userdevices.userID
   INNER JOIN statistics ON userdevices.deviceId=statistics.deviceId
   WHERE users.userName='$username'
     AND MONTH(date) = MONTH(NOW())
     AND YEAR(date) = YEAR(NOW()) ) AS incomePerMonth,

  ( SELECT SUM(statistics.income)
   FROM users
   INNER JOIN userdevices ON users.userId=userdevices.userID
   INNER JOIN statistics ON userdevices.deviceId=statistics.deviceId
   WHERE users.userName='$username'
     AND WEEK(date) = WEEK(NOW())
     AND YEAR(date) = YEAR(NOW()) ) AS incomePerWeek,

  ( SELECT SUM(statistics.income)
   FROM users
   INNER JOIN userdevices ON users.userId=userdevices.userID
   INNER JOIN statistics ON userdevices.deviceId=statistics.deviceId
   WHERE users.userName='$username'
     AND DAY(date) = DAY(NOW())
     AND YEAR(date) = YEAR(NOW())) AS incomePerDay;";
    try {
        $db = getConnection();
        $stmt = $db->query($sql);
        $response = $stmt->fetchAll(PDO::FETCH_OBJ);


        $app->response->setStatus(200);
        $app->response()->headers->set('Content-Type', 'application/json');
        echo json_encode($response);
        $db = null;
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}

// Print out devices of current user
function myDevices() {
    $app = \Slim\Slim::getInstance();
    $username = $app->request->headers("Php-Auth-User");
    $sql = "SELECT deviceImage, deviceName, userdevices.deviceId, devicestatus FROM users
    INNER JOIN userdevices ON users.userId=userdevices.userID
    INNER JOIN devicestatus ON devicestatus.deviceId = userdevices.deviceId
    WHERE users.userName='$username'";
    try {
        $db = getConnection();
        $stmt = $db->query($sql);
        $response = $stmt->fetchAll(PDO::FETCH_OBJ);


        $app->response->setStatus(200);
        $app->response()->headers->set('Content-Type', 'application/json');
        echo json_encode($response);
        $db = null;
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}


// Print out current authenticated users given name
function welcomeUser() {
    $app = \Slim\Slim::getInstance();
    $username = $app->request->headers("Php-Auth-User");
    $sql = "select firstName FROM users WHERE username ='$username'";
    try {
        $db = getConnection();
        $stmt = $db->query($sql);
        $user = $stmt->fetchAll(PDO::FETCH_OBJ);


        $app->response->setStatus(200);
        $app->response()->headers->set('Content-Type', 'application/json');
        echo json_encode($user);
        $db = null;
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}

// Lists the complete users table - testing function - would never be on production
function listUsers() {
    $app = \Slim\Slim::getInstance();
    $sql = "select * FROM users";
    try {
        $db = getConnection();
        $stmt = $db->query($sql);
        $users = $stmt->fetchAll(PDO::FETCH_OBJ);


        $app->response->setStatus(200);
        $app->response()->headers->set('Content-Type', 'application/json');
        echo json_encode($users);
        $db = null;
    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}

// Authentication function to protect the Restful api
function basicAuthentication() {
    $app = \Slim\Slim::getInstance();

    $username = $app->request->headers("Php-Auth-User");
    $password = $app->request->headers("Php-Auth-Pw");
    $sql = "SELECT username, password FROM users WHERE username ='$username'";
    try {
        $db = getConnection();
        $stmt = $db->query($sql);
        $user = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        // We set the username and the password record
        $username = ($user[0]->username);
        $password = ($user[0]->password);

        $out['username'] = $username;
        $out['password'] = $password;

        return $out;

    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}


