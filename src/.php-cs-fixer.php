<?php

declare(strict_types=1);

/*
 * PHP Coding Standards Fixer configuration.
 *
 * The PHP Coding Standards Fixer (PHP CS Fixer) tool fixes your code to follow
 * standards; whether you want to follow PHP coding standards as defined in the
 * PSR-1, PSR-2, etc., or other community driven ones like the Symfony one. You
 * can also define your (teams) style through configuration.
 *
 * @see https://github.com/FriendsOfPHP/PHP-CS-Fixer
 */

if (getenv('SKIP_CS')) {
    exit;
}

function load_dist_config()
{
    $candidates = [
        ".php-cs-fixer.dist.php",

        // v2.0 configurations (deprecated)
        ".php_cs.dist",

        // Support for laravel/* project structure
        "laravel/.php-cs-fixer.dist.php",
        "laravel/.php_cs.dist",
    ];

    $cwd = getcwd();

    $file = null;

    foreach ($candidates as $candidate) {
        if (is_file("$cwd/$candidate")) {
            $file = "$cwd/$candidate";
            break;
        }
    }

    if (!$file) {
        return false;
    }

    return require_once $file;
}

if (getenv('USE_DIST') || getenv('PHP_CS_FIXER_USE_DIST')) {
    if ($result = load_dist_config()) {
        return $result;
    }
}

const STRICT_MODE = false;

$rules = [
    '@PSR1' => true,
    '@PSR2' => true,
    '@PSR12' => true,
    '@PSR12:risky' => true,

    '@DoctrineAnnotation' => true,

    '@Symfony' => true,
    '@Symfony:risky' => true,

    'single_line_throw' => false, // @Symfony
    'yoda_style' => false, // @Symfony
    'native_constant_invocation' => false, // @Symfony:risky
    'native_function_invocation' => false, // @Symfony:risky

    '@PHP54Migration' => true,
    '@PHP56Migration:risky' => true,
    '@PHP70Migration' => true,
    '@PHP70Migration:risky' => true,
    '@PHP71Migration' => true,
    '@PHP71Migration:risky' => true,

    '@PHPUnit30Migration:risky' => true,
    '@PHPUnit32Migration:risky' => true,
    '@PHPUnit35Migration:risky' => true,
    '@PHPUnit43Migration:risky' => true,
    '@PHPUnit48Migration:risky' => true,
    '@PHPUnit50Migration:risky' => true,
    '@PHPUnit52Migration:risky' => true,
    '@PHPUnit54Migration:risky' => true,
    '@PHPUnit55Migration:risky' => true,
    '@PHPUnit56Migration:risky' => true,
    '@PHPUnit57Migration:risky' => true,
    '@PHPUnit60Migration:risky' => true,
    '@PHPUnit75Migration:risky' => true,
    '@PHPUnit84Migration:risky' => true,

    'no_alias_functions' => ['sets' => ['@all']],
];

if (PHP_VERSION_ID >= 70300) {
    $rules['@PHP73Migration'] = true;
}

if (PHP_VERSION_ID >= 70400) {
    $rules['@PHP74Migration'] = true;
    $rules['@PHP74Migration:risky'] = true;
}

if (PHP_VERSION_ID >= 80000) {
    $rules['@PHP80Migration'] = true;
    $rules['@PHP80Migration:risky'] = true;
}

if (PHP_VERSION_ID >= 81000) {
    $rules['@PHP81Migration'] = true;
}

// Must come after @* rules.
$rules['declare_strict_types'] = false; // @PHP70Migration:risky
$rules['void_return'] = false; // @PHP71Migration:risky

// TODO Is there a better heuristic to tell if being called by Sublime Text?
function is_sublime_text(): bool
{
    return (bool) getenv('PYTHONIOENCODING');
}

// The psr_autoloading rule doesn't work in the Sublime Text Linter plugin
// because the plugin uses a temporary file file which is not a valid composer
// defined autoloading path. TODO Report bug in Sublime Linter plugin.
if (is_sublime_text()) {
    $rules['psr_autoloading'] = false;
}

if (!STRICT_MODE) {
    $rules['concat_space'] = false;
    $rules['is_null'] = false;
}

$config = new PhpCsFixer\Config();
$config->setRiskyAllowed(true);
$config->setRules($rules);

$finder = PhpCsFixer\Finder::create();
$finder->exclude('bootstrap/cache');
$finder->exclude('build');
$finder->exclude('database');
$finder->exclude('node_modules');
$finder->exclude('public/dist');
$finder->exclude('public/fonts');
$finder->exclude('public/images');
$finder->exclude('resources');
$finder->exclude('storage');
$finder->exclude('tests/fixture');
$finder->exclude('tmp');
$finder->exclude('vendor');
$finder->in(getcwd());

$config->setFinder($finder);

return $config;
