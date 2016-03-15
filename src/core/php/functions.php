<?php
/**
 * Biere functions and definitions
 *
 * Set up the theme and provides some helper functions, which are used in the
 * theme as custom template tags. Others are attached to action and filter
 * hooks in WordPress to change core functionality.
 *
 * When using a child theme you can override certain functions (those wrapped
 * in a function_exists() call) by defining them first in your child theme's
 * functions.php file. The child theme's functions.php file is included before
 * the parent theme's file, so the child theme functions would be used.
 *
 * @link https://codex.wordpress.org/Theme_Development
 * @link https://codex.wordpress.org/Child_Themes
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are
 * instead attached to a filter or action hook.
 *
 * For more information on hooks, actions, and filters,
 * {@link https://codex.wordpress.org/Plugin_API}
 *
 * @package WordPress
 */


// Add custom admin styles

// function load_custom_admin_styles() {
//     wp_register_style( 'custom_dashicons', get_stylesheet_directory_uri() . '/font.css', false, '1.0.0' );
//     wp_enqueue_style( 'custom_dashicons' );
// }

// add_action( 'admin_enqueue_scripts', 'load_custom_admin_styles' );

/*
* Creating a function to create our CPT
*/



function custom_post_type() {

// Set UI labels for Custom Post Type
    $labels = array(
        'name'                => _x( 'Photos-reportages', 'Post Type General Name', 'twentythirteen' ),
        'singular_name'       => _x( 'Photos-reportage', 'Post Type Singular Name', 'twentythirteen' ),
        'menu_name'           => __( 'Photos-reportages', 'twentythirteen' ),
        'parent_item_colon'   => __( 'Parent Photos-reportage', 'twentythirteen' ),
        'all_items'           => __( 'All Photos-reportages', 'twentythirteen' ),
        'view_item'           => __( 'View Photos-reportage', 'twentythirteen' ),
        'add_new_item'        => __( 'Ajouter Photos-reportage', 'twentythirteen' ),
        'add_new'             => __( 'Ajouter', 'twentythirteen' ),
        'edit_item'           => __( 'Modifier Photos-reportage', 'twentythirteen' ),
        'update_item'         => __( 'Mettre à jour Photos-reportage', 'twentythirteen' ),
        'search_items'        => __( 'Rechercher dans les Photos-reportages', 'twentythirteen' ),
        'not_found'           => __( 'Not Found', 'twentythirteen' ),
        'not_found_in_trash'  => __( 'Not found in Trash', 'twentythirteen' ),
    );

// Set other options for Custom Post Type

    $args = array(
        'label'               => __( 'photos-reportages', 'twentythirteen' ),
        'description'         => __( 'Photos-reportage news and reviews', 'twentythirteen' ),
        'labels'              => $labels,
        // Features this CPT supports in Post Editor
        // 'supports'            => array( 'title', 'editor', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields', ),
        'supports'            => array( 'title', 'thumbnail', ),
        // You can associate this CPT with a taxonomy or custom taxonomy.
        /* A hierarchical CPT is like Pages and can have
        * Parent and child items. A non-hierarchical CPT
        * is like Posts.
        */
        'menu_icon' => get_stylesheet_directory_uri() . '/images/camera.svg',
        'hierarchical'        => false,
        'public'              => true,
        'show_ui'             => true,
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_position'       => 5,
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'capability_type'     => 'post',
    );

    // Registering your Custom Post Type
    register_post_type( 'photos-reportages', $args );

// Set UI labels for Custom Post Type
    $labels = array(
        'name'                => _x( 'Bieres', 'Post Type General Name', 'twentythirteen' ),
        'singular_name'       => _x( 'Biere', 'Post Type Singular Name', 'twentythirteen' ),
        'menu_name'           => __( 'Bieres', 'twentythirteen' ),
        'parent_item_colon'   => __( 'Parent Biere', 'twentythirteen' ),
        'all_items'           => __( 'All Bieres', 'twentythirteen' ),
        'view_item'           => __( 'View Biere', 'twentythirteen' ),
        'add_new_item'        => __( 'Ajouter Biere', 'twentythirteen' ),
        'add_new'             => __( 'Ajouter', 'twentythirteen' ),
        'edit_item'           => __( 'Modifier Biere', 'twentythirteen' ),
        'update_item'         => __( 'Mettre à jour Biere', 'twentythirteen' ),
        'search_items'        => __( 'Rechercher dans les Bieres', 'twentythirteen' ),
        'not_found'           => __( 'Not Found', 'twentythirteen' ),
        'not_found_in_trash'  => __( 'Not found in Trash', 'twentythirteen' ),
    );

// Set other options for Custom Post Type
    $args = array(
        'label'               => __( 'bieres', 'twentythirteen' ),
        'description'         => __( 'Biere news and reviews', 'twentythirteen' ),
        'labels'              => $labels,
        'supports'            => array( 'title', 'thumbnail', ),
        'taxonomies'          => array( 'pays', 'couleur', 'type', ),
        'hierarchical'        => false,
        'public'              => true,
        'show_ui'             => true,
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_icon' => get_stylesheet_directory_uri() . '/images/bottle.svg',
        'menu_position'       => 5,
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'capability_type'     => 'post',
    );
    // Registering your Custom Post Type
    register_post_type( 'bieres', $args );
    flush_rewrite_rules();

// Set UI labels for Custom Post Type
    $labels = array(
        'name'                => _x( 'Evénements', 'Post Type General Name', 'twentythirteen' ),
        'singular_name'       => _x( 'Evénement', 'Post Type Singular Name', 'twentythirteen' ),
        'menu_name'           => __( 'Evénements', 'twentythirteen' ),
        'parent_item_colon'   => __( 'Parent Evénement', 'twentythirteen' ),
        'all_items'           => __( 'All Evénements', 'twentythirteen' ),
        'view_item'           => __( 'View Evénement', 'twentythirteen' ),
        'add_new_item'        => __( 'Ajouter Evénement', 'twentythirteen' ),
        'add_new'             => __( 'Ajouter', 'twentythirteen' ),
        'edit_item'           => __( 'Modifier Evénement', 'twentythirteen' ),
        'update_item'         => __( 'Mettre à jour Evénement', 'twentythirteen' ),
        'search_items'        => __( 'Rechercher dans les Evénements', 'twentythirteen' ),
        'not_found'           => __( 'Not Found', 'twentythirteen' ),
        'not_found_in_trash'  => __( 'Not found in Trash', 'twentythirteen' ),
    );

// Set other options for Custom Post Type
    $args = array(
        'label'               => __( 'événements', 'twentythirteen' ),
        'description'         => __( 'Evénement news and reviews', 'twentythirteen' ),
        'labels'              => $labels,
        'supports'            => array( 'title', 'thumbnail', ),
        'taxonomies'          => array( 'genres' ),
        'hierarchical'        => false,
        'public'              => true,
        'show_ui'             => true,
        'show_in_menu'        => true,
        'menu_icon' => get_stylesheet_directory_uri() . '/images/calendar.svg',
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_position'       => 5,
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'capability_type'     => 'post',
    );
    // Registering your Custom Post Type
    register_post_type( 'evenements', $args );
    flush_rewrite_rules();

    // Set UI labels for Custom Post Type
    $labels = array(
        'name'                => _x( 'Magazines', 'Post Type General Name', 'twentythirteen' ),
        'singular_name'       => _x( 'Magazine', 'Post Type Singular Name', 'twentythirteen' ),
        'menu_name'           => __( 'Magazines', 'twentythirteen' ),
        'parent_item_colon'   => __( 'Parent Magazine', 'twentythirteen' ),
        'all_items'           => __( 'All Magazines', 'twentythirteen' ),
        'view_item'           => __( 'View Magazine', 'twentythirteen' ),
        'add_new_item'        => __( 'Ajouter Magazine', 'twentythirteen' ),
        'add_new'             => __( 'Ajouter', 'twentythirteen' ),
        'edit_item'           => __( 'Modifier Magazine', 'twentythirteen' ),
        'update_item'         => __( 'Mettre à jour Magazine', 'twentythirteen' ),
        'search_items'        => __( 'Rechercher dans les Magazines', 'twentythirteen' ),
        'not_found'           => __( 'Not Found', 'twentythirteen' ),
        'not_found_in_trash'  => __( 'Not found in Trash', 'twentythirteen' ),
    );

// Set other options for Custom Post Type
    $args = array(
        'label'               => __( 'magazines', 'twentythirteen' ),
        'description'         => __( 'Magazine news and reviews', 'twentythirteen' ),
        'labels'              => $labels,
        'supports'            => array( 'title', 'thumbnail', ),
        'taxonomies'          => array( 'genres' ),
        'hierarchical'        => false,
        'public'              => true,
        'show_ui'             => true,
        'menu_icon' => get_stylesheet_directory_uri() . '/images/book.svg',
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_position'       => 5,
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'capability_type'     => 'post',
    );
    // Registering your Custom Post Type
    register_post_type( 'magazines', $args );
    flush_rewrite_rules();


// Set UI labels for Custom Post Type
    $labels = array(
        'name'                => _x( 'Publicités', 'Post Type General Name', 'twentythirteen' ),
        'singular_name'       => _x( 'Publicité', 'Post Type Singular Name', 'twentythirteen' ),
        'menu_name'           => __( 'Publicités', 'twentythirteen' ),
        'parent_item_colon'   => __( 'Parent Publicité', 'twentythirteen' ),
        'all_items'           => __( 'All Publicités', 'twentythirteen' ),
        'view_item'           => __( 'View Publicité', 'twentythirteen' ),
        'add_new_item'        => __( 'Ajouter Publicité', 'twentythirteen' ),
        'add_new'             => __( 'Ajouter', 'twentythirteen' ),
        'edit_item'           => __( 'Modifier Publicité', 'twentythirteen' ),
        'update_item'         => __( 'Mettre à jour Publicité', 'twentythirteen' ),
        'search_items'        => __( 'Rechercher dans les Publicités', 'twentythirteen' ),
        'not_found'           => __( 'Not Found', 'twentythirteen' ),
        'not_found_in_trash'  => __( 'Not found in Trash', 'twentythirteen' ),
    );

// Set other options for Custom Post Type
    $args = array(
        'label'               => __( 'publicités', 'twentythirteen' ),
        'description'         => __( 'Publicité news and reviews', 'twentythirteen' ),
        'labels'              => $labels,
        'supports'            => array( 'title', 'thumbnail', ),
        'taxonomies'          => array( 'genres' ),
        'hierarchical'        => false,
        'public'              => true,
        'menu_icon' => get_stylesheet_directory_uri() . '/images/bullhorn.svg',
        'show_ui'             => true,
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_position'       => 5,
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'capability_type'     => 'post',
    );
    // Registering your Custom Post Type
    register_post_type( 'publicités', $args );
    flush_rewrite_rules();

}


/* Hook into the 'init' action so that the function
* Containing our post type registration is not
* unnecessarily executed.
*/

add_action( 'init', 'custom_post_type', 0 );
add_theme_support( 'post-thumbnails' );



function bieres_taxonomy() {
    register_taxonomy(
        'bieres_pays',  //The name of the taxonomy. Name should be in slug form (must not contain capital letters or spaces).
        'bieres',        //post type name
        array(
            'hierarchical' => true,
            'label' => 'Pays',  //Display name
            'query_var' => true,
            'rewrite' => array(
                'slug' => 'pays', // This controls the base slug that will display before each term
                'with_front' => false // Don't display the category base before
            )
        )
    );
}
add_action( 'init', 'bieres_taxonomy');

function bieres_taxonomy_couleur() {
    register_taxonomy(
        'bieres_couleur',  //The name of the taxonomy. Name should be in slug form (must not contain capital letters or spaces).
        'bieres',        //post type name
        array(
            'hierarchical' => true,
            'label' => 'Couleurs',  //Display name
            'query_var' => true,
            'rewrite' => array(
                'slug' => 'couleurs', // This controls the base slug that will display before each term
                'with_front' => false // Don't display the category base before
            )
        )
    );
}
add_action( 'init', 'bieres_taxonomy_couleur');

function bieres_taxonomy_type() {
    register_taxonomy(
        'bieres_type',  //The name of the taxonomy. Name should be in slug form (must not contain capital letters or spaces).
        'bieres',        //post type name
        array(
            'hierarchical' => true,
            'label' => 'Type',  //Display name
            'query_var' => true,
            'rewrite' => array(
                'slug' => 'biere_type', // This controls the base slug that will display before each term
                'with_front' => false // Don't display the category base before
            )
        )
    );
}
add_action( 'init', 'bieres_taxonomy_type');


function bieres_taxonomy_alcohol() {
    register_taxonomy(
        'alcohol',  //The name of the taxonomy. Name should be in slug form (must not contain capital letters or spaces).
        'bieres',        //post type name
        array(
            'hierarchical' => true,
            'label' => 'Alcohol',  //Display name
            'query_var' => true,
            'rewrite' => array(
                'slug' => 'alcohol', // This controls the base slug that will display before each term
                'with_front' => false // Don't display the category base before
            )
        )
    );
}
add_action( 'init', 'bieres_taxonomy_alcohol');




function filter_post_type_link($link, $post)
{
    if ($post->post_type != 'bieres')
        return $link;

    if ($cats = get_the_terms($post->ID, 'bieres_pays'))
        $link = str_replace('%bieres_pays%', array_pop($cats)->slug, $link);
    return $link;
}
add_filter('post_type_link', 'filter_post_type_link', 10, 2);


function default_taxonomy_term( $post_id, $post ) {
    if ( 'publish' === $post->post_status ) {
        $defaults = array(
            'bieres_pays' => array( 'other'),   //

            );
        $taxonomies = get_object_taxonomies( $post->post_type );
        foreach ( (array) $taxonomies as $taxonomy ) {
            $terms = wp_get_post_terms( $post_id, $taxonomy );
            if ( empty( $terms ) && array_key_exists( $taxonomy, $defaults ) ) {
                wp_set_object_terms( $post_id, $defaults[$taxonomy], $taxonomy );
            }
        }
    }
}
add_action( 'save_post', 'default_taxonomy_term', 100, 2 );

function remove_box()
{
    remove_post_type_support('post', 'editor');
}
add_action( 'init', 'remove_box');

function remove_box_page()
{
    remove_post_type_support('page', 'editor');
}
// add_action( 'init', 'remove_box_page');


function register_my_menu() {
  register_nav_menu('header-menu',__( 'Header Menu' ));
}
add_action( 'init', 'register_my_menu' );


if(!function_exists('d')) {
    function d($key, $data = null) {
      $output = '';
      if($key === '*') {
        $output = $data;
      } elseif(isset($data) && is_array($data) && array_key_exists($key, $data)) {
        $output = $data[$key];
      }
      return $output;
    }
}

function prepare_post_preview($post){
    $data = $post;
    $data['post_thumbnail'] = get_the_post_thumbnail($data['ID']);
    $data['post_permalink'] = get_permalink($data['ID']);
    // print_r( $data['post_author']);
    return $data;
}

$currentwidth = 0;
function prepare_post(){
    preg_match('/MSIE (.*?);/', $_SERVER['HTTP_USER_AGENT'], $matches);
    $data['isIE'] = (count($matches)>1) ? ' isie ' : ' isnotie ';


    $data['post_title'] = get_the_title();
    // $data['post_author'] = get_the_author();
    $data['post_author'] = get_field('auteur');
    $data['post_thumbnail'] = get_the_post_thumbnail();
    $post_thumbnail_id = get_post_thumbnail_id($post->ID);
    $data['post_thumbnail_src'] = wp_get_attachment_url($post_thumbnail_id);
    $data['post_thumbnail_src_small'] = wp_get_attachment_image_src($post_thumbnail_id, 'small');
    ///should add custom size for thumbnail
    // $data['post_thumbnail_src_med'] = wp_get_attachment_url($post_thumbnail_id);
    // $data['post_thumbnail_src_larg'] = wp_get_attachment_url($post_thumbnail_id);
    $data['thumb_as_bg'] = (count($matches)>1) ? 'background-image: url('.$data['post_thumbnail_src'].')' : '';

    $data['post_excerpt'] = get_field('chapeau');
    $data['post_excerpt_short'] = get_the_popular_excerpt(get_field('chapeau'));
    $data['post_date'] = get_the_date("d.m.Y");
    $data['post_date_time'] = get_the_date("Y-m-d");

    $data['content'] = get_the_content();
    $data['post_permalink'] = get_permalink($post->ID);
    $data['ID'] = $post->ID;

    $categories = get_the_category();
    $separatorclass = ' ';
    $separator = ' - ';
    $output = '';
    $outputclass = '';
    if ( ! empty( $categories ) ) {
        foreach( $categories as $category ) {
            $output .= ($category->name). $separator;
            $outputclass .= ($category->slug). $separatorclass;
        }
    }

    $data['extra_class'] = ' '.$outputclass;
    $data['category'] = trim($output, $separator);

    $post_type = get_post_type( $post->ID );
    $data['extra_class'] .= ' '.$post_type.' ';

    /*---------- biere -----------*/
    $data['extra_info'] = false;
    if (get_field('extra_info')){
        $data['extra_class'] .= ' extra_info ';
        $data['extra_info'] = true;
    }

    $data['width'] = $data['extra_info'] ? 8 : 4;



    return $data;
}


function search_filter($query) {
  if ( !is_admin() && $query->is_main_query() ) {
    if ($query->is_search) {
      $query->set('post_type', array( 'post', 'photos-reportages', 'bieres' ) );
    }
  }
}

if ( function_exists( 'register_nav_menus' ) ) {
    register_nav_menus(
        array(
          'main_menu' => 'main_menu',
          'top_menu' => 'top_menu'
        )
    );
}

add_action('pre_get_posts','search_filter');

/*----------------YO-------------------------*/
/***
 * default set up for $in['toolbar1']
 * bold,italic,strikethrough,bullist,numlist,blockquote,hr,alignleft,aligncenter,alignright,link,unlink,wp_more,spellchecker,wp_fullscreen,wp_adv
 * default set up for $in['toolbar2']
 * formatselect,underline,alignjustify,forecolor,pastetext,removeformat,charmap,outdent,indent,undo,redo,wp_help
 * default set up for $in['block_formats']
 * Paragraph=p;Address=address;Pre=pre;Heading 1=h1;Heading 2=h2;Heading 3=h3;Heading 4=h4;Heading 5=h5; Heading 6=h6
 * @package TinyMCE
 */
function gn_tinymce_filtre($in){
    $in['toolbar1']='styleselect,bold,italic,underline,blockquote,link,unlink,spellchecker,wp_fullscreen,wp_adv ';
    $in['toolbar2']='pastetext,removeformat,charmap,undo,redo,wp_help ';
    $in['block_formats'] = 'Paragraph=p;Heading 2=h2;Heading 3=h3;Heading 4=h4;Heading 5=h5';
    return $in;
}
add_filter('tiny_mce_before_init', 'gn_tinymce_filtre');

// Callback function to insert 'styleselect' into the $buttons array
function my_mce_buttons_2( $buttons ) {
    array_unshift( $buttons, 'styleselect' );
    return $buttons;
}
// Register our callback to the appropriate filter
add_filter('mce_buttons_2', 'my_mce_buttons_2');

// Callback function to filter the MCE settings
// Callback function to filter the MCE settings
function my_mce_before_init_insert_formats( $init_array ) {
    // Define the style_formats array
    $style_formats = array(
        // Each array child is a format with it's own settings
        array(
            'title' => 'Intertitre',
            'block' => 'h4',
            'classes' => 'intertitre'
        )
    );
    // Insert the array, JSON ENCODED, into 'style_formats'
    $init_array['style_formats'] = json_encode( $style_formats );

    return $init_array;

}
// Attach callback to 'tiny_mce_before_init'
add_filter( 'tiny_mce_before_init', 'my_mce_before_init_insert_formats' );

function my_theme_add_editor_styles() {
    add_editor_style( 'custom-editor-style.css' );
}
add_action( 'admin_init', 'my_theme_add_editor_styles' );


function custum_get_tax($tax_name){
    $terms = get_the_terms( get_the_ID(), $tax_name );
    $on_draught = '';
    if ( $terms && ! is_wp_error( $terms ) ) :
        $draught_links = array();
        foreach ( $terms as $term ) {
            // $draught_links[] = $term->name;
            $draught_links[] = $term->slug;
        }
        $on_draught = join( " ", $draught_links );
    endif;
    return $on_draught;
}

function get_all_tax_name(){
    $ret = '';
    $ret .= custum_get_tax('bieres_pays').' ';
    $ret .= custum_get_tax('bieres_type').' ';
    $ret .= custum_get_tax('bieres_couleur').' ';
    $ret .= custum_get_tax('alcohol').' ';
    return $ret;
}


function get_the_popular_excerpt($excerpt){
    //$excerpt = get_the_excerpt();
    if(!strlen($excerpt)){
        return false;
    }
    $excerpt = preg_replace(" (\[.*?\])",'',$excerpt);
    $excerpt = strip_shortcodes($excerpt);
    $excerpt = strip_tags($excerpt);
    $excerpt = substr($excerpt, 0, 220);
    $excerpt = substr($excerpt, 0, strripos($excerpt, " "));
    $excerpt = trim(preg_replace( '/\s+/', ' ', $excerpt));
    $excerpt = $excerpt.'...';
    return $excerpt;
}

function moveElement(&$array, $a, $b) {
    $out = array_splice($array, $a, 1);
    array_splice($array, $b, 0, $out);
}

function getdescription($my_query){
    $ret = is_front_page() ? get_the_popular_excerpt(get_field('chapeau')) : '';
    // switch (get_page_template_slug()) {
    //     case 'archive-articles.php':
    //         # code...
    //         break;

    //     default:
    //         # code...
    //         break;
    // }
    $my_query->the_post();
    return 'yo'.get_the_popular_excerpt(get_field('chapeau'));
}


