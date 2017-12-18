<?php

$config = PhpCsFixer\Config::create();
$config->setRules(array(
    '@PSR2' => true,
    '@Symfony' => true,
    'concat_space' => ['spacing' => 'one'],
    'trailing_comma_in_multiline_array' => false,
    'no_trailing_comma_in_singleline_array' => true
));

$finder = PhpCsFixer\Finder::create();
$finder->name('*.phtml');
$finder->exclude('build');
$finder->exclude('lib');
$finder->exclude('tmp');
$finder->exclude('vendor');
$finder->in(getcwd());

$config->setFinder($finder);

return $config;
