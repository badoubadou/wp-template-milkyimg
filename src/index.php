<?php
ob_start();
require 'php/functions.php';
require 'php/data.php';

$admin ? include('admin.php') : include('page.php');
ob_end_flush();