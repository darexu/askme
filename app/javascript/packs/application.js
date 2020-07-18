// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// This is a manifest file that'll be compiled into application.js, which will
// include all the files listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts,
// vendor/assets/javascripts, or any plugin's vendor/assets/javascripts
// directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear
// at the bottom of the compiled file.
//
// Read Sprockets README for details about supported directives.
//
// https://github.com/rails/sprockets#sprockets-directives
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// Этот код добавляет обработчик события выдвигания формы при клике на кнопку
// «Задать вопрос», которая видна только, когда страница открыта в маленьком
// окне.
// Called once after the initial page has loaded

$(document).on('turbolinks:load', function() {
  $('#ask-button').click(function(){
    $('#ask-form').slideToggle(300);
    return false;
  });
  $(document).ready(function() {
    $('.set-color').minicolors();
  });
})
