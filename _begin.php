<?php

declare(strict_types=1);
session_start();

require_once __DIR__.'/_globals/config.php';
require_once __DIR__.'/_globals/helpers.php';

error_reporting(
    APP_DEBUG
    ? E_ALL
    : 0
);

date_default_timezone_set(APP_TIMEZONE);

if(isset($__layout__)) {
    require_once LAYOUT_PATH.'/header.php';
}
