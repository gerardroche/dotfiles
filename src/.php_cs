<?php

/*
 * PHP Coding Standards Fixer configuration.
 *
 * @see https://github.com/FriendsOfPHP/PHP-CS-Fixer
 */

$config = PhpCsFixer\Config::create();
$config->setRiskyAllowed(true);
$config->setRules([
    '@DoctrineAnnotation' => true,
    '@PHPUnit75Migration:risky' => true,
    '@PSR2' => true,
    '@Symfony' => true,
    '@Symfony:risky' => true,
    'align_multiline_comment' => true,
    'array_indentation' => true,
    'array_syntax' => ['syntax' => 'short'],
    'combine_consecutive_issets' => true,
    'combine_consecutive_unsets' => true,
    'compact_nullable_typehint' => true,
    'constant_case' => true,
    'escape_implicit_backslashes' => true,
    'explicit_indirect_variable' => true,
    'general_phpdoc_annotation_remove' => ['annotations' => ['author']],
    'linebreak_after_opening_tag' => true,
    'list_syntax' => ['syntax' => 'short'],
    'method_chaining_indentation' => true,
    'no_alias_functions' => true,
    'no_php4_constructor' => true,
    'no_superfluous_phpdoc_tags' => true,
    'no_unneeded_final_method' => false,
    'no_useless_return' => true,
    'ordered_class_elements' => true,
    'ordered_imports' => true,
    'php_unit_construct' => true,
    'php_unit_dedicate_assert' => true,
    'php_unit_expectation' => true,
    'php_unit_mock' => true,
    'php_unit_namespaced' => true,
    'php_unit_no_expectation_annotation' => true,
    'php_unit_ordered_covers' => true,
    'php_unit_set_up_tear_down_visibility' => true,
    'phpdoc_add_missing_param_annotation' => ['only_untyped' => true],
    'phpdoc_align' => false,
    'phpdoc_order' => true,
    'phpdoc_trim_consecutive_blank_line_separation' => true,
    'phpdoc_types_order' => true,
    'pow_to_exponentiation' => true,
    'psr4' => false, // Temp: Because it breaks Sublime Text php-cs-fixer linter
    'random_api_migration' => true,
    'self_accessor' => true,
    'strict_comparison' => true,
    'strict_param' => true,
    'string_line_ending' => true,
    'yoda_style' => false,
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
