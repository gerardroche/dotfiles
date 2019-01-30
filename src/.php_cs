<?php

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

$config = PhpCsFixer\Config::create();
$config->setRiskyAllowed(true);
$config->setRules([
    '@PSR2' => true,
    '@Symfony' => true,
    '@DoctrineAnnotation' => true,
    /* Misc. */
    'no_unneeded_final_method' => false,
    'yoda_style' => false,
    /* PHPDoc */
    'general_phpdoc_annotation_remove' => ['author'],
    'no_superfluous_phpdoc_tags' => true,
    'phpdoc_add_missing_param_annotation' => ['only_untyped' => true],
    'phpdoc_order' => true,
    'phpdoc_trim_consecutive_blank_line_separation' => true,
    'phpdoc_types_order' => true,
    /* Other */
    'combine_consecutive_issets' => true,
    'combine_consecutive_unsets' => true,
    'compact_nullable_typehint' => true,
    'escape_implicit_backslashes' => true,
    'explicit_indirect_variable' => true,
    'linebreak_after_opening_tag' => true,
    'method_chaining_indentation' => true,
    'no_useless_return' => true,
    'ordered_class_elements' => true,
    'ordered_imports' => true,
    /* Risky */
    '@Symfony:risky' => true,
    'psr4' => false, // Breaks Sublime Text php-cs-fixer linter.
    'array_syntax' => ['syntax' => 'short'],
    'no_alias_functions' => true,
    'no_php4_constructor' => true,
    'php_unit_construct' => true,
    'php_unit_dedicate_assert' => true,
    'php_unit_expectation' => true,
    'php_unit_mock' => true,
    'php_unit_namespaced' => true,
    'php_unit_no_expectation_annotation' => true,
    'php_unit_ordered_covers' => true,
    'php_unit_set_up_tear_down_visibility' => true,
    'pow_to_exponentiation' => true,
    'random_api_migration' => true,
    'self_accessor' => true,
    'strict_comparison' => true,
    'strict_param' => true,
    'string_line_ending' => true,
    // 'php_unit_test_class_requires_covers' => true,
    // 'void_return' => true,
]);

$finder = PhpCsFixer\Finder::create();
$finder->in(getcwd());
$finder->exclude('bootstrap/cache');
$finder->exclude('build');
$finder->exclude('node_modules');
$finder->exclude('storage');
$finder->exclude('tmp');
$finder->exclude('vendor');
$config->setFinder($finder);

return $config;
