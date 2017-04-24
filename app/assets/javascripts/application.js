// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require velocity
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

window.archive = window.archive || {};

(function($) {
    var ready = function() {
        var $window = $(window);
        var scrollTop = null;
        
        $('#page-top-btn').each(function() {
            scrollTop = new window.archive.Scroll(this);
        });
    
        // ページ遷移する度にスクロールイベントがbindされているためイベントをオフっとく
        $window.off('scroll.scrollTop');
        
        $window.on('scroll.scrollTop', function() {
            var height = $window.scrollTop();
            if (height > 200) {
                scrollTop.show();
            } else {
                scrollTop.hide();
                
            }
            
        });
    };

    // Turbolinks 5.0.1になりイベント名が変わってしまった   
    $(document).on('turbolinks:load', ready);
    
}(jQuery))


