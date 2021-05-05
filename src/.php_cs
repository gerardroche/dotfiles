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

$config = new PhpCsFixer\Config();

$config->setRiskyAllowed(true);

$config->setRules([
    '@PSR2' => true,
    '@PSR12' => true,
    '@Symfony' => true,

    // 'psr4' => false, // Temp: Because it breaks Sublime Text php-cs-fixer linter

    '@DoctrineAnnotation' => true,
    '@PHPUnit75Migration:risky' => true,
    '@PHPUnit84Migration:risky' => true,
    '@Symfony' => true,
    '@Symfony:risky' => true,

    'align_multiline_comment' => true,
    'array_indentation' => true,
    'array_syntax' => ['syntax' => 'short'],
    'backtick_to_shell_exec' => true,
    'binary_operator_spaces' => false,
    'blank_line_before_statement' => false,
    'braces' => false,
    'cast_spaces' => false,
    'class_attributes_separation' => false,
    'combine_consecutive_issets' => true,
    'combine_consecutive_unsets' => true,
    'compact_nullable_typehint' => true,
    'concat_space' => false,
    'constant_case' => true,
    'dir_constant' => true,
    'escape_implicit_backslashes' => true,
    'explicit_indirect_variable' => true,
    'fully_qualified_strict_types' => false,
    'increment_style' => false,
    'lambda_not_used_import' => false,
    'linebreak_after_opening_tag' => true,
    'list_syntax' => ['syntax' => 'short'],
    'method_chaining_indentation' => true,
    'no_alias_language_construct_call' => true,
    'no_empty_statement' => false,
    'no_extra_blank_lines' => false,
    'no_mixed_echo_print' => true,
    'no_unneeded_control_parentheses' => false,
    'no_unused_imports' => false,
    'no_useless_return' => true,
    'no_whitespace_in_blank_line' => false,
    'ordered_class_elements' => false,
    'ordered_imports' => true,
    'ordered_traits' => true,
    'self_accessor' => true,
    'semicolon_after_instruction' => false,
    'single_blank_line_at_eof' => false,
    'single_line_throw' => false,
    'single_space_after_construct' => false,
    'strict_comparison' => true,
    'strict_param' => true,
    'string_line_ending' => true,
    'trailing_comma_in_multiline' => false,
    'yoda_style' => false,
    // 'array_push' => false,
    // 'ereg_to_preg' => true,
    // 'function_to_constant' => false,
    // 'is_null' => false,
    // 'logical_operators' => false,
    // 'modernize_types_casting' => false,
    // 'native_constant_invocation' => false,
    // 'native_function_invocation' => false,
    // 'no_trailing_whitespace_in_string' => false,
    'psr_autoloading' => false, // tmp for ST
    // 'set_type_to_cast' => true,
    // 'single_quote' => false,
    // 'ternary_operator_spaces' => false,
    // 'ternary_to_elvis_operator' => false,
    // 'void_return' => true,

    ////////////
    // PHPDoc //
    ////////////

    'general_phpdoc_annotation_remove' => ['annotations' => ['author']],
    'general_phpdoc_annotation_remove' => true,
    'general_phpdoc_tag_rename' => true,
    'no_blank_lines_after_phpdoc' => true,
    'no_empty_phpdoc' => true,
    'no_superfluous_phpdoc_tags' => true,
    'phpdoc_add_missing_param_annotation' => ['only_untyped' => true],
    'phpdoc_align' => true,
    'phpdoc_annotation_without_dot' => true,
    'phpdoc_indent' => true,
    'phpdoc_inline_tag_normalizer' => true,
    'phpdoc_line_span' => true,
    'phpdoc_no_access' => true,
    'phpdoc_no_alias_tag' => true,
    'phpdoc_no_empty_return' => true,
    'phpdoc_no_package' => true,
    'phpdoc_no_useless_inheritdoc' => true,
    'phpdoc_order' => true,
    'phpdoc_order_by_value' => true,
    'phpdoc_return_self_reference' => true,
    'phpdoc_scalar' => true,
    'phpdoc_separation' => true,
    'phpdoc_single_line_var_spacing' => true,
    'phpdoc_summary' => true,
    'phpdoc_tag_casing' => true,
    'phpdoc_tag_type' => true,
    'phpdoc_to_comment' => true,
    'phpdoc_trim' => true,
    'phpdoc_trim_consecutive_blank_line_separation' => true,
    'phpdoc_types' => true,
    'phpdoc_types_order' => true,
    'phpdoc_var_annotation_correct_order' => true,
    'phpdoc_var_without_name' => true,

    // =================================== PHP 5.6
    'pow_to_exponentiation' => true,

    // =================================== PHP 7.0
    'ternary_to_null_coalescing' => true,

    // =================================== PHP 7.0 RISKY
    // 'declare_strict_types' => true,
    'combine_nested_dirname' => true,
    'non_printable_character' => true,
    'random_api_migration' => true,

    // =================================== PHP 7.1
    'visibility_required' => [
        'elements' => [
            // 'const',
            'method',
            'property',
        ],
    ],

    // =================================== PHP 7.1 RISKY
    // 'void_return' => true,

    // =================================== PHP 7.3
    'heredoc_indentation' => true,
    'method_argument_space' => ['on_multiline' => 'ensure_fully_multiline'],
    'no_whitespace_before_comma_in_array' => true,

    // =================================== PHP 7.4
    'normalize_index_brace' => true,
    'short_scalar_cast' => true,

    // =================================== PHP 7.4 RISKY
    'implode_call' => true,
    'no_alias_functions' => true,

    // 'use_arrow_functions' => true,

    // =================================== PHP 8.0
    'clean_namespace' => true,
    'no_php4_constructor' => true,
    'no_unset_cast' => true,
    'no_unreachable_default_argument_value' => true,
    'no_unneeded_final_method' => true,

    'php_unit_construct' => true,
    'php_unit_dedicate_assert' => true,
    'php_unit_expectation' => true,
    'php_unit_mock' => true,
    'php_unit_namespaced' => true,
    'php_unit_no_expectation_annotation' => true,
    'php_unit_set_up_tear_down_visibility' => true,
    // 'php_unit_fqcn_annotation' => false,
    // 'php_unit_method_casing' => false,
    // 'php_unit_mock_short_will_return' => false,
    // 'php_unit_ordered_covers' => true,
    // 'php_unit_test_annotation' => false,
    // 'php_unit_test_class_requires_covers' => true,
]);

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
