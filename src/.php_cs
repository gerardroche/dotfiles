<?php

$finder = PhpCsFixer\Finder::create();
$finder->name('*.phtml');
$finder->exclude('build');
$finder->exclude('lib');
$finder->exclude('tmp');
$finder->exclude('vendor');
$finder->in(getcwd());

$config = PhpCsFixer\Config::create();
$config->setRules(array(
    '@PSR2' => true,
    '@Symfony' => true,
    'yoda_style' => false,
    // 'concat_space' => ['spacing' => 'one'],
    // 'trailing_comma_in_multiline_array' => false,
    // 'no_trailing_comma_in_singleline_array' => true
));
$config->setFinder($finder);

return $config;
