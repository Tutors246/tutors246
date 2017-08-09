<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->wwwroot   = 'https://tutors246.moodlecloud.com';
$CFG->dataroot  = '/path/to/moodledata';
$CFG->dbtype    = 'pgsql';
$CFG->dblibrary = 'native';
$CFG->dbname    = 'database_name';
$CFG->dbuser    = 'database_user';
$CFG->dbpass    = 'database_pass';
$CFG->prefix    = 'm_';
$CFG->dbhost    = 'database_hostname';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '5432',
  'dbsocket' => '',
);

require_once(dirname(__FILE__) . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
