<?php
/**
 * Shut functions and definitions
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

function prepare_post(){
    preg_match('/MSIE (.*?);/', $_SERVER['HTTP_USER_AGENT'], $matches);
    $data['isIE'] = (count($matches)>1) ? ' isie ' : ' isnotie ';

    $data['post_title'] = get_the_title();
    $data['post_subtitle'] = get_field('subtitle');
    $data['post_descrition'] = get_field('descrition');
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
      $query->set('post_type', array( 'post') );
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


add_theme_support( 'post-thumbnails' );

add_action( 'init', 'my_remove_post_type_support', 999 );
function my_remove_post_type_support() {
    remove_post_type_support( 'post', 'editor' );
}