<!DOCTYPE html>
<html lang="<?=APP_LANG?>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?=( $__title__ ?? APP_NAME )?></title>
    <base href="<?=APP_URL?>">
    <link rel="icon" href="/favicon.ico">
    <link rel="stylesheet" href="/static/css/app.css">
    <?php if(isset($__styles__)): ?>
        <?php foreach($__styles__ as $f): ?>
            <link rel="stylesheet" href="/static/css/<?=$f?>.css">
        <?php endforeach; ?>
    <?php endif; ?>
    <script src="/static/js/app.js" defer></script>
    <?php if(isset($__scripts__)): ?>
        <?php foreach($__scripts__ as $f): ?>
            <script src="/static/js/<?=$f?>.js" defer></script>
        <?php endforeach; ?>
    <?php endif; ?>
</head>
<body>

<?php
require_once PARTIAL_PATH.'/navbar.php';
require_once PARTIAL_PATH.'/alert.php';
?>
