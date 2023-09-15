// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require popper
//= require turbolinks
//= require bootstrap
//= require_tree
jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript,application/javascript,text/html")} })
window.jQuery = $;
window.$ = $;
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap-icons/font/bootstrap-icons.css'
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("@popperjs/core")
require("jquery/src/jquery")
global.Rails = Rails;



window.scroll_bottom = function(){
    if ($('#scroll-msgs').length > 0) {
        $('#scroll-msgs').scrollTop($('#scroll-msgs')[0].scrollHeight);
    }
}

window.onload = function() {
    scroll_bottom()
};

